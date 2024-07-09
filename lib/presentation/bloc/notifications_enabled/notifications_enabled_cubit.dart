import 'package:bloc/bloc.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository.dart';

class NotificationsEnabledCubit extends Cubit<bool> {
  final NotificationRepository _notificationRepository;
  NotificationsEnabledCubit({required NotificationRepository notificationRepository}) :
        _notificationRepository = notificationRepository,
        super(true);

  void initWithSavedValue(){
    bool savedValue = _notificationRepository.isNotificationsEnabled();
    emit(savedValue);
  }

  Future<void> set(bool value) async{
    _notificationRepository.setNotificationsEnabled(value: value);
    emit(value);
  }
}
