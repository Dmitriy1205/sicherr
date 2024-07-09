import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository.dart';

import '../../../core/exceptions/exceptions.dart';
import '../auth/auth_bloc.dart';

part 'notification_event.dart';

part 'notification_state.dart';

part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _notificationRepository;
  final AuthBloc _authBloc;

  NotificationBloc(
      {required NotificationRepository notificationRepository,
      required AuthBloc authBloc})
      : _notificationRepository = notificationRepository,
        _authBloc = authBloc,
        super(const NotificationState.initial()) {
    on<NotificationEvent>(_mapToState);
  }

  Future<void> _mapToState(
          NotificationEvent event, Emitter<NotificationState> emit) async =>
      event.map(
          addToken: (e) => _addToken(e, emit),
          deleteToken: (e) => _deleteToken(e, emit));

  Future<void> _deleteToken(_DeleteToken event, Emitter<NotificationState> emit) async{
    try {
      await _notificationRepository.deleteToken(
          currentUserId: _authBloc.state.user!.uid);

      emit(const NotificationState.success());
    } on BadRequestException catch (e) {
      emit(NotificationState.error(message: e.message, code: e.code));
    }
  }

  Future<void> _addToken(
      _AddToken event, Emitter<NotificationState> emit) async {
    try {
      await _notificationRepository.addToken(
          currentUserId: _authBloc.state.user!.uid);

      emit(const NotificationState.success());
    } on BadRequestException catch (e) {
      emit(NotificationState.error(message: e.message, code: e.code));
    }
  }
}
