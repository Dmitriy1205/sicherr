part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.addToken() = _AddToken;
  const factory NotificationEvent.deleteToken() = _DeleteToken;
}
