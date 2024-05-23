import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/exceptions/exceptions.dart';

import '../../../domain/repositories/shared_contacts/sc_repository.dart';

part 'users_lentgh_state.dart';

part 'users_lentgh_cubit.freezed.dart';

class UsersLengthCubit extends Cubit<UsersLengthState> {
  final SCRepository _scRepository;

  UsersLengthCubit({required SCRepository scRepository})
      : _scRepository = scRepository,
        super(const UsersLengthState.initial()) {
    getLengthOfAllUsers();
  }

  Future<void> getLengthOfAllUsers() async {
    try {
      final length = await _scRepository.getAllUsersLength();
      emit(UsersLengthState.loaded(usersLength: length));
    } on BadRequestException catch (e) {
      emit(UsersLengthState.error(error: e.message));
    }
  }
}
