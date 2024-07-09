
class NotificationsOnTapHandler {
  final Map<NotificationsOnTapEvents, Function(Map<String, dynamic>)> events;

  NotificationsOnTapHandler(this.events);

  void handleInitialMessage(Map<String, dynamic> remoteMessageData) {
    events[NotificationsOnTapEvents.findByType(remoteMessageData["type"])]?.call(remoteMessageData);
  }
}

enum NotificationsOnTapEvents {
  sos('sos'),
  tracking('tracking');

  final String type;

  static NotificationsOnTapEvents? findByType(String type) =>
      NotificationsOnTapEvents.values.where((e) => e.type == type).firstOrNull;

  const NotificationsOnTapEvents(this.type);
}
