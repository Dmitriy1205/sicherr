import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';

import '../../../domain/repositories/auth/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.initial()) {
    on<AuthEvent>(_mapAuthBlocToState);
    _authRepository.authStateChange.listen((User? user) {
      add(AuthEvent.initUser(user: user));
    });
  }

  Future<void> _mapAuthBlocToState(AuthEvent event, Emitter<AuthState> emit) =>
      event.map(
        initUser: (e) => _initUser(e, emit),
        logout: (e) => _logout(e, emit),
      );

  Future<void> _logout(_LogoutEvent event, Emitter<AuthState> emit) async {
    await _authRepository.logout();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _initUser(_InitUserEvent event, Emitter<AuthState> emit) async {
    if (event.user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      final isConfiguredContacts = await _userRepository.collectionExists(event.user!.uid, 'contacts');
      emit(AuthState.authenticated(user: event.user!, isConfiguredContacts: isConfiguredContacts));
    }
  }
}
