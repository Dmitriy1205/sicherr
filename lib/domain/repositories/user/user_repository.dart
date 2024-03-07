import 'package:sicherr/domain/entities/onboarding/onboarding.dart';

import '../../entities/user_profile/user_profile.dart';

abstract class UserRepository {
  Stream<UserProfile?> getUserFieldsStream({required String currentUserId});

  Future<void> setUserFields({required String currentUserId,required String phoneNumber});

  Future<void> updateUserFields({required String currentUserId,required Map<String, dynamic> data});

  Future<void> writeOnboarding({required String currentUserId});

  Future<void> updateOnboarding(
      {required String currentUserId, required Map<String, dynamic> data});

  Future<Onboarding?> getOnboarding({required String currentUserId});
}
