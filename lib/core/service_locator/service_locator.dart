import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../presentation/bloc/auth/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Repositories
  sl.registerLazySingleton(() => AuthRepository(auth: auth));

  //Blocs
  sl.registerLazySingleton(() => AuthBloc(
        authRepository: sl(),
      ));
}
