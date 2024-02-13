import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/service_locator/service_locator.dart';

import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/otp/otp_bloc.dart';
import '../presentation/bloc/sign_in/sign_in_bloc.dart';

class Providers extends StatelessWidget {
  final Widget child;

  const Providers({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<SignInBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<OtpBloc>(),
          lazy: false,
        ),
      ],
      child: child,
    );
  }
}
