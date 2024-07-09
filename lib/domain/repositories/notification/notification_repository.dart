abstract class NotificationRepository {
  Future<void> addToken({required String currentUserId});

  Future<void> deleteToken({required String currentUserId});

  Future<void> sendNotification({required String title,
    required String message,
    required List<String> phones, required Map<String,dynamic> data});

  Stream<List<Map<String,dynamic>>> userNotifications({required String currentUserId});

  Future<void> setNotificationsEnabled({required bool value});
  bool isNotificationsEnabled();
}
