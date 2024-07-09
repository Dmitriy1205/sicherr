import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/domain/entities/tracking/tracking.dart';
import 'package:sicherr/domain/repositories/location_sharing/location_sharing_repository_contract.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';

import '../../../core/managers/quick_binding_handler.dart';
import '../../../data/remote/client.dart';
import '../../../domain/entities/quick_binding/binding_actions.dart';

part 'send_sos_event.dart';

part 'send_sos_state.dart';

part 'send_sos_bloc.freezed.dart';

class SendSosBloc extends Bloc<SendSosEvent, SendSosState> {
  final AuthBloc _authBloc;
  final LocationSharingRepository _locationSharingRepository;
  final UserRepository _userRepository;
  final HttpClient _httpClient;
  final QuickBindingInterface _quickBindingInterface;

  SendSosBloc(
      {required HttpClient httpClient,
      required QuickBindingInterface quickBindingInterface,
      required UserRepository userRepository,
      required AuthBloc authBloc,
      required LocationSharingRepository locationSharingRepository})
      : _locationSharingRepository = locationSharingRepository,
        _httpClient = httpClient,
        _authBloc = authBloc,
        _quickBindingInterface = quickBindingInterface,
        _userRepository = userRepository,
        super(const SendSosState.initial()) {
    on<SendSosEvent>(_mapBlocToState);
    _quickBindingInterface.triggerActionStream.listen((event) {
      if (event == ActivateBinding.sos) {
        add(const SendSosEvent.triggerQuickBinding());
      }
    });
  }

  Future<void> _mapBlocToState(
          SendSosEvent event, Emitter<SendSosState> emit) async =>
      event.map(
          pushTracking: (e) => _pushTracking(e, emit),
          stopStreaming: (e) => _stopStreaming(e, emit),
          sendSOS: (e) => _sendSos(e, emit),
          triggerQuickBinding: (e) => _triggerQuickBinding(e, emit));

  Future<void> _pushTracking(
      _PushTracking event, Emitter<SendSosState> emit) async {
    _locationSharingRepository.shareTrackingTo(
        usersUid: state.emUsersUids, tracking: event.tracking);
  }

  Future<void> _stopStreaming(
      _StopStreaming event, Emitter<SendSosState> emit) async {
    _locationSharingRepository.cancelSharingTrackingTo(
        usersUid: state.emUsersUids);
    emit(SendSosState.initial());
  }

  Future<void> _triggerQuickBinding(
      _TriggerQuickBinding event, Emitter<SendSosState> emit) async {
    emit(const SendSosState.quickBindingTriggered());
    emit(const SendSosState.initial());
  }

  Future<void> _sendSos(_SendSOS event, Emitter<SendSosState> emit) async {
    try {
      emit(const SendSosState.loading());
      final token = await _authBloc.state.user!.getIdToken();
      await _httpClient.sendSos(
          idToken: token!,
          message: event.message,
          currentUserPhone: event.currentUserPhone,
          emContactPhones: event.emContactPhone,
          lat: event.lat,
          long: event.long);
      emit(const SendSosState.success());
      if (event.lat != null && event.long != null) {
        List<String> emUsersUids = [];
        for (var emContactPhone in event.emContactPhone) {
          final encodedContactPhone =
              PhoneNumberEncryptor().encrypt(emContactPhone);
          final emContactId =
              await _userRepository.getUserIdByPhoneNumber(encodedContactPhone);
          if (emContactId == null) continue;
          emUsersUids.add(emContactId);
        }
        if (emUsersUids.isEmpty) return;
        emit(SendSosState.streaming(emUsersUids: emUsersUids));
      }
    } on BadRequestException catch (e) {
      emit(SendSosState.error(message: e.message, code: e.code));
    }
  }
}
