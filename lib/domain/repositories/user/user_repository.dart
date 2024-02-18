import 'package:sicherr/domain/entities/onboarding/onboarding.dart';

abstract class UserRepository {
  Future<void> writeOnboarding({required String currentUserId});

  Future<void> updateOnboarding(
      {required String currentUserId, required Map<String, dynamic> data});

  Future<Onboarding?> getOnboarding({required String currentUserId});
}
