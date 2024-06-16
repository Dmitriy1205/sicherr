import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicherr/core/managers/alarm_manager.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/core/managers/quick_binding_handler.dart';
import 'package:sicherr/data/local/caller_identifications_service.dart';
import 'package:sicherr/data/local/latest_contact_prefs.dart';
import 'package:sicherr/data/remote/client.dart';
import 'package:sicherr/data/remote/fcm_service.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository_impl.dart';
import 'package:sicherr/domain/repositories/dangerous_contacs/dc_repository.dart';
import 'package:sicherr/domain/repositories/dangerous_contacs/dc_repository_impl.dart';
import 'package:sicherr/domain/repositories/emeregency_contacts/em_contacts_repository.dart';
import 'package:sicherr/domain/repositories/emeregency_contacts/em_contacts_repository_impl.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository_impl.dart';
import 'package:sicherr/domain/repositories/timer/timer_repository_contract.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';
import 'package:sicherr/domain/repositories/user/user_repository_impl.dart';
import 'package:sicherr/presentation/bloc/alarm/alarm_bloc.dart';
import 'package:sicherr/presentation/bloc/contact_dentification/contact_identification_bloc.dart';
import 'package:sicherr/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:sicherr/presentation/bloc/danger_contact/dc_bloc.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import 'package:sicherr/presentation/bloc/notification/notification_bloc.dart';
import 'package:sicherr/presentation/bloc/pick_dc/pick_dc_cubit.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/bloc/shake_detector/shake_detector_bloc.dart';
import 'package:sicherr/presentation/bloc/shared_contacts/sc_bloc.dart';
import 'package:sicherr/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:sicherr/presentation/bloc/timer/timer_bloc.dart';
import 'package:sicherr/presentation/bloc/users_length/users_lentgh_cubit.dart';

import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/repositories/auth/auth_repository_impl.dart';
import '../../domain/repositories/contacts/contacts_repository.dart';
import '../../domain/repositories/identification_contacts/id_contacts_repository.dart';
import '../../domain/repositories/identification_contacts/id_contacts_repository_impl.dart';
import '../../domain/repositories/shared_contacts/sc_repository.dart';
import '../../domain/repositories/shared_contacts/sc_repository_impl.dart';
import '../../domain/repositories/timer/timer_repository_service.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/bloc/contact_details/contact_details_bloc.dart';
import '../../presentation/bloc/onboarding/onboarding_bloc.dart';
import '../../presentation/bloc/otp/otp_bloc.dart';
import '../../presentation/bloc/profile/profile_bloc.dart';
import '../utils/phone_encryptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  PhoneNumberEncryptor encryptor = PhoneNumberEncryptor();

  //Services
  final httpClient = HttpClient(encryptor: encryptor, auth: FirebaseAuth.instance);
  sl.registerLazySingleton(() => FCMService(messaging: messaging));
  sl.registerLazySingleton(() => CallerIdService());
  sl.registerLazySingleton(() => PhoneNumberEncryptor());

  final authRepository = AuthRepositoryImpl(auth: auth);
  final userRepository =
      UserRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final emContactRepository =
      EmContactsRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final contactsRepository =
      ContactsRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final alarmManager = AlarmManager();
  final quickBindingListener = QuickBindingListener(userRepo: userRepository);
  final notificationRepository = NotificationRepositoryImpl(
      fcmService: sl(), firebaseFirestore: firestore);
  final contactManager = ContactsManager();

  final latestContactPrefs = LatestContactPrefs();
  final callerIdService = CallerIdService();
  final callerIdRepository = CallerIdRepositoryImpl(
      callerIdService: callerIdService,
      latestContactPrefs: latestContactPrefs,
      encryptor: encryptor);
  final dangerContactsRepository =
      DCRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final sharedContactsRepository =
      SCRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final timerRepository = TimerRepositoryImpl(db: firestore);

  //Repositories
  sl.registerSingleton<AuthRepository>(authRepository);
  sl.registerSingleton<UserRepository>(userRepository);
  sl.registerSingleton<TimerRepository>(timerRepository);
  sl.registerSingleton<EmContactsRepository>(emContactRepository);
  sl.registerSingleton<ContactsRepository>(contactsRepository);
  sl.registerSingleton<AlarmManager>(alarmManager);
  sl.registerSingleton<NotificationRepository>(notificationRepository);
  sl.registerSingleton<HttpClient>(httpClient);
  sl.registerSingleton<QuickBindingListener>(quickBindingListener);
  sl.registerSingleton<ContactsInterface>(contactManager);
  sl.registerSingleton<CallerIdRepository>(callerIdRepository);
  sl.registerSingleton<DCRepository>(dangerContactsRepository);
  sl.registerSingleton<SCRepository>(sharedContactsRepository);

  sl.registerFactory(() => TimerBloc(httpClient: sl(), timerRepository: sl()));
  //Blocs
  sl.registerLazySingleton(() => AuthBloc(
        authRepository: sl(),
        userRepository: sl(),
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
  sl.registerLazySingleton(() => AlarmBloc(player: alarmManager));
  sl.registerLazySingleton(() => SendSosBloc(
      httpClient: sl(),
      authBloc: sl(),
      quickBindingInterface: quickBindingListener));
  sl.registerLazySingleton(
      () => NotificationBloc(notificationRepository: sl(), authBloc: sl()));
  sl.registerLazySingleton(() => ShakeDetectorBloc(profileBloc: sl()));
  sl.registerLazySingleton(() => ContactsBloc(sl()));
  sl.registerLazySingleton(() => ContactDetailsBloc(
        contactsRepo: sl(),
      ));
  sl.registerLazySingleton(() => ContactIdentificationBloc(
      callerIdRepository: sl(), contactsRepository: sl()));

  ///Dangerous Contacts
  sl.registerLazySingleton(() => PickDcCubit());
  sl.registerLazySingleton(() => DcBloc(dcRepository: sl(), authBloc: sl()));
  sl.registerLazySingleton(() => ScBloc(scRepository: sl(), authBloc: sl()));
  sl.registerLazySingleton(() => UsersLengthCubit(scRepository: sl()));
}

Future<void> initNotifications() async {
  await sl<CallerIdService>().initFCXProvider();
  await sl<FCMService>().initializeFirebase();
  await sl<FCMService>().initializeLocalNotifications();
  await sl<FCMService>().onMessage();
  FirebaseMessaging.onBackgroundMessage(fcmBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> fcmBackgroundHandler(RemoteMessage message) async {
  print("received");
  await Firebase.initializeApp();
}
