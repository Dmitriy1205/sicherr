import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/service_locator/service_locator.dart';
import 'package:sicherr/presentation/bloc/alarm/alarm_bloc.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';
import 'package:sicherr/presentation/bloc/notification/notification_bloc.dart';
import 'package:sicherr/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/bloc/shake_detector/shake_detector_bloc.dart';

import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/contacts/contacts_bloc.dart';
import '../presentation/bloc/otp/otp_bloc.dart';
import '../presentation/bloc/sign_in/sign_in_bloc.dart';
import 'managers/contacts_manager.dart';

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
        BlocProvider(
          create: (context) => sl<OnboardingBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<ProfileBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<EmergencyContactBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => sl<SendSosBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<NotificationBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<AlarmBloc>(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ContactsBloc(ContactsManager()),
        ),
        BlocProvider(
          create: (context) => sl<ShakeDetectorBloc>(),
          lazy: true,
        ),
      ],
      child: child,
    );
  }
}
