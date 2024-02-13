import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sicherr/presentation/bloc/sign_in/sign_in_bloc.dart';

import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/repositories/auth/auth_repository_impl.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';
import '../../presentation/bloc/otp/otp_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  final authRepository = AuthRepositoryImpl(auth: auth);

  //Repositories

  sl.registerSingleton<AuthRepository>(authRepository);

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
}
