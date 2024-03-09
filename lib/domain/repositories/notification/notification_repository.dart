abstract class NotificationRepository {
  Future<void> saveToken({
    required String currentUserId,
  });

  Future<void> removeToken({required String currentUserId});
}
