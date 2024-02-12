import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sicherr/core/providers.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/screens/auth/sign_in.dart';
import 'package:sicherr/presentation/screens/home/home.dart';
import 'package:sicherr/presentation/screens/initial.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';

import '../presentation/bloc/auth/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return state.maybeMap(
              authenticated: (s) => const HomeScreen(),
              unauthenticated: (_) => const InitialScreen(),
              orElse: () => const Material(child: LoadingIndicator()));
        }),
      ),
    );
  }
}
