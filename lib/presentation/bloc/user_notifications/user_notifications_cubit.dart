import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/repositories/notification/notification_repository.dart';

class UserNotificationsCubit extends Cubit<List<Map<String,dynamic>>> {
  final NotificationRepository _notificationsRepository;
  late final StreamSubscription _streamSubscription;
  UserNotificationsCubit({required NotificationRepository notificationRepository}) :
        _notificationsRepository = notificationRepository,
        super([]);

  void listenToNotifications({required String userUid}){
    _streamSubscription = _notificationsRepository.userNotifications(currentUserId: userUid).listen((event) {
      emit(event);
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
