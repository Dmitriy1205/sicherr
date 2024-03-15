import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:sicherr/core/managers/alarm_manager.dart';
import 'package:sicherr/core/managers/quick_binding_handler.dart';
import 'package:sicherr/data/remote/client.dart';
import 'package:sicherr/data/remote/fcm_service.dart';
import 'package:sicherr/domain/repositories/emeregency_contacts/em_contacts_repository.dart';
import 'package:sicherr/domain/repositories/emeregency_contacts/em_contacts_repository_impl.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository_impl.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';
import 'package:sicherr/domain/repositories/user/user_repository_impl.dart';
import 'package:sicherr/presentation/bloc/alarm/alarm_bloc.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import 'package:sicherr/presentation/bloc/notification/notification_bloc.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/bloc/shake_detector/shake_detector_bloc.dart';
import 'package:sicherr/presentation/bloc/sign_in/sign_in_bloc.dart';

import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/repositories/auth/auth_repository_impl.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/bloc/onboarding/onboarding_bloc.dart';
import '../../presentation/bloc/otp/otp_bloc.dart';
import '../../presentation/bloc/profile/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //Services
  final httpClient = HttpClient();
  sl.registerLazySingleton(() => FCMService(messaging: messaging));

  final authRepository = AuthRepositoryImpl(auth: auth);
  final userRepository = UserRepositoryImpl(firestore: firestore);
  final emContactRepository = EmContactsRepositoryImpl(firestore: firestore);
  final alarmManager = AlarmManager();
  final quickBindingListener = QuickBindingListener(userRepo: userRepository);
  final notificationRepository = NotificationRepositoryImpl(
      fcmService: sl(), firebaseFirestore: firestore);

  //Repositories
  sl.registerSingleton<AuthRepository>(authRepository);
  sl.registerSingleton<UserRepository>(userRepository);
  sl.registerSingleton<EmContactsRepository>(emContactRepository);
  sl.registerSingleton<AlarmManager>(alarmManager);
  sl.registerSingleton<NotificationRepository>(notificationRepository);
  sl.registerSingleton<HttpClient>(httpClient);
  sl.registerSingleton<QuickBindingListener>(quickBindingListener);

  //Blocs
  sl.registerLazySingleton(() => AuthBloc(
        authRepository: sl(),
      ));
  sl.registerLazySingleton(() => SignInBloc(
        authRepository: sl(),
      ));
  sl.registerLazySingleton(() => OtpBloc(
        authRepository: sl(),
      ));
  sl.registerLazySingleton(() => ProfileBloc(
        userRepository: sl(),
        authBloc: sl(),
      ));
  sl.registerLazySingleton(() => OnboardingBloc(
        authBloc: sl(),
        userRepository: sl(),
      ));
  sl.registerLazySingleton(() => EmergencyContactBloc(
        authBloc: sl(),
        emContactsRepository: sl(),
      ));
  sl.registerLazySingleton(() => AlarmBloc(
      player: alarmManager, quickBindingListener: quickBindingListener));
  sl.registerLazySingleton(() => SendSosBloc(httpClient: sl(), authBloc: sl()));
  sl.registerLazySingleton(
      () => NotificationBloc(notificationRepository: sl(), authBloc: sl()));
  sl.registerLazySingleton(() => ShakeDetectorBloc(profileBloc: sl()));
}

Future<void> initNotifications() async {
  await sl<FCMService>().initializeFirebase();
  await sl<FCMService>().initializeLocalNotifications();
  await sl<FCMService>().onMessage();
  FirebaseMessaging.onBackgroundMessage(fcmBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> fcmBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}