import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicherr/core/managers/alarm_manager.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/core/managers/quick_binding_handler.dart';
import 'package:sicherr/data/local/caller_identifications_service.dart';
import 'package:sicherr/data/local/home_position_prefs.dart';
import 'package:sicherr/data/local/latest_contact_prefs.dart';
import 'package:sicherr/data/remote/client.dart';
import 'package:sicherr/data/remote/fcm_service.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository_impl.dart';
import 'package:sicherr/domain/repositories/dangerous_contacs/dc_repository.dart';
import 'package:sicherr/domain/repositories/dangerous_contacs/dc_repository_impl.dart';
import 'package:sicherr/domain/repositories/documents/documents_repository_contract.dart';
import 'package:sicherr/domain/repositories/documents/documents_repository_impl.dart';
import 'package:sicherr/domain/repositories/emeregency_contacts/em_contacts_repository.dart';
import 'package:sicherr/domain/repositories/emeregency_contacts/em_contacts_repository_impl.dart';
import 'package:sicherr/domain/repositories/location_sharing/location_sharing_repository_contract.dart';
import 'package:sicherr/domain/repositories/location_sharing/location_sharing_repository_impl.dart';
import 'package:sicherr/domain/repositories/navigation/navigation_repository.dart';
import 'package:sicherr/domain/repositories/navigation/navigation_repository_impl.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository.dart';
import 'package:sicherr/domain/repositories/notification/notification_repository_impl.dart';
import 'package:sicherr/domain/repositories/timer/timer_repository_contract.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';
import 'package:sicherr/domain/repositories/user/user_repository_impl.dart';
import 'package:sicherr/presentation/bloc/alarm/alarm_bloc.dart';
import 'package:sicherr/presentation/bloc/contact_dentification/contact_identification_bloc.dart';
import 'package:sicherr/presentation/bloc/contacts/contacts_bloc.dart';
import 'package:sicherr/presentation/bloc/danger_contact/dc_bloc.dart';
import 'package:sicherr/presentation/bloc/documents/documents_cubit.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import 'package:sicherr/presentation/bloc/map/map_focus_request/map_focus_request_cubit.dart';
import 'package:sicherr/presentation/bloc/map/search_position/search_position_cubit.dart';
import 'package:sicherr/presentation/bloc/navbar_selected_page_index/navbar_selected_page_index_cubit.dart';
import 'package:sicherr/presentation/bloc/notification/notification_bloc.dart';
import 'package:sicherr/presentation/bloc/notifications_enabled/notifications_enabled_cubit.dart';
import 'package:sicherr/presentation/bloc/phone_number_change/phone_number_change_bloc.dart';
import 'package:sicherr/presentation/bloc/pick_dc/pick_dc_cubit.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/bloc/shake_detector/shake_detector_bloc.dart';
import 'package:sicherr/presentation/bloc/shared_contacts/sc_bloc.dart';
import 'package:sicherr/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:sicherr/presentation/bloc/sos_window/sos_window_cubit.dart';
import 'package:sicherr/presentation/bloc/timer/timer_bloc.dart';
import 'package:sicherr/presentation/bloc/tracking/tracking_cubit.dart';
import 'package:sicherr/presentation/bloc/user_notifications/user_notifications_cubit.dart';
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
import '../../presentation/bloc/map/home_position/home_position_cubit.dart';
import '../../presentation/bloc/onboarding/onboarding_bloc.dart';
import '../../presentation/bloc/otp/otp_bloc.dart';
import '../../presentation/bloc/profile/profile_bloc.dart';
import '../utils/phone_encryptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  PhoneNumberEncryptor encryptor = PhoneNumberEncryptor();

  //Services
  sl.registerLazySingleton(() => FCMService(messaging: messaging));
  sl.registerLazySingleton(() => CallerIdService());
  sl.registerLazySingleton(() => PhoneNumberEncryptor());
  sl.registerLazySingleton(() => HttpClient(encryptor: encryptor, auth: FirebaseAuth.instance));

  final authRepository = AuthRepositoryImpl(auth: auth);
  final locationSharingRepository =
      LocationSharingRepositoryImpl(db: firestore);
  final userRepository =
      UserRepositoryImpl(firestore: firestore, encryptor: encryptor, storage: storage);
  final emContactRepository =
      EmContactsRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final contactsRepository =
      ContactsRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final alarmManager = AlarmManager();
  final quickBindingListener = QuickBindingListener(userRepo: userRepository);
  final notificationRepository = NotificationRepositoryImpl(
    sharedPreferences: prefs,
      fcmService: sl(), firebaseFirestore: firestore, client: sl());
  final contactManager = ContactsManager();

  //local storage
  final latestContactPrefs = LatestContactPrefs();
  final homePositionPrefs = HomePositionPrefs();

  final callerIdService = CallerIdService();
  final callerIdRepository = CallerIdRepositoryImpl(
      callerIdService: callerIdService,
      latestContactPrefs: latestContactPrefs,
      encryptor: encryptor);
  final dangerContactsRepository =
      DCRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final sharedContactsRepository =
      SCRepositoryImpl(firestore: firestore, encryptor: encryptor);
  final navigationRepository =
      NavigationRepositoryImpl(homePositionPrefs: homePositionPrefs);
  final timerRepository = TimerRepositoryImpl(db: firestore);

  //Repositories
  sl.registerFactory<DocumentsRepository>(() {
    final languageCode = Platform.localeName.split("_").first;
    return DocumentsRepositoryImpl(db: firestore, languageCode: languageCode);
  });
  sl.registerSingleton<AuthRepository>(authRepository);
  sl.registerSingleton<UserRepository>(userRepository);
  sl.registerSingleton<TimerRepository>(timerRepository);
  sl.registerSingleton<EmContactsRepository>(emContactRepository);
  sl.registerSingleton<ContactsRepository>(contactsRepository);
  sl.registerSingleton<AlarmManager>(alarmManager);
  sl.registerSingleton<NotificationRepository>(notificationRepository);
  sl.registerSingleton<QuickBindingListener>(quickBindingListener);
  sl.registerSingleton<ContactsInterface>(contactManager);
  sl.registerSingleton<CallerIdRepository>(callerIdRepository);
  sl.registerSingleton<DCRepository>(dangerContactsRepository);
  sl.registerSingleton<SCRepository>(sharedContactsRepository);
  sl.registerSingleton<NavigationRepository>(navigationRepository);
  sl.registerSingleton<LocationSharingRepository>(locationSharingRepository);

  sl.registerFactory(() => TimerBloc(httpClient: sl(), timerRepository: sl()));
  sl.registerFactory(() => PhoneNumberChangeBloc(authRepository: sl()));
  sl.registerLazySingleton(() => DocumentsCubit(documentsRepository: sl()));
  sl.registerLazySingleton(() => TrackingCubit(locationSharingRepository: sl()));
  sl.registerLazySingleton(() => UserNotificationsCubit(notificationRepository: sl()));
  //Blocs
  sl.registerSingleton(AuthBloc(
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
      locationSharingRepository: sl(),
      authBloc: sl(),
      userRepository: sl(),
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
  sl.registerLazySingleton(() => HomePositionCubit(
      userRepository: userRepository,
      homePositionPrefs: homePositionPrefs,
      navigationRepository: sl(),
      locationSharingRepository: sl(),
      notificationRepository: sl()));
  sl.registerLazySingleton(
      () => SearchPositionCubit(navigationRepository: sl()));
  sl.registerLazySingleton(() => NavbarSelectedPageIndexCubit());
  sl.registerLazySingleton(() => MapFocusRequestCubit());
  sl.registerLazySingleton(() => SosWindowCubit());
  sl.registerLazySingleton(() => NotificationsEnabledCubit(notificationRepository: sl())..initWithSavedValue());

  ///Dangerous Contacts
  sl.registerLazySingleton(() => PickDcCubit());
  sl.registerLazySingleton(() => DcBloc(dcRepository: sl(), authBloc: sl()));
  sl.registerLazySingleton(() => ScBloc(scRepository: sl(), authBloc: sl()));
  sl.registerLazySingleton(() => UsersLengthCubit(scRepository: sl()));
}

Future<void> initNotifications() async {
  await sl<CallerIdService>().initFCXProvider();
  await sl<FCMService>().initializeFirebase();
  await sl<FCMService>().onMessage();
  FirebaseMessaging.onBackgroundMessage(fcmBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> fcmBackgroundHandler(RemoteMessage message) async {
  print("received");
  await Firebase.initializeApp();
}
