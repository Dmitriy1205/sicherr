part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.saveToken() = _SaveToken;
  const factory NotificationEvent.removeToken() = _RemoveToken;
}
