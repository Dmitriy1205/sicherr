import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/providers.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/screens/auth/sign_in.dart';
import 'package:sicherr/presentation/screens/initial.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';

import '../presentation/bloc/auth/auth_bloc.dart';
import 'const/images.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(AppImages.background), context);
    precacheImage(const AssetImage(AppImages.logo), context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return state.maybeMap(
              authenticated: (_) => const InitialScreen(),
              unauthenticated: (_) => const SigninScreen(),
              orElse: () => const Material(child: LoadingIndicator()));
        }),
      ),
    );
  }
}
