import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/providers.dart';
import 'package:sicherr/core/service_locator/service_locator.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/core/utils/notifications_ontap_handler.dart';
import 'package:sicherr/presentation/bloc/notifications_enabled/notifications_enabled_cubit.dart';
import 'package:sicherr/presentation/screens/auth/sign_in.dart';
import 'package:sicherr/presentation/screens/configure_contacts/configure_contacts_screen.dart';
import 'package:sicherr/presentation/screens/initial.dart';
import 'package:sicherr/presentation/widgets/app_toast.dart';
import 'package:sicherr/presentation/widgets/loading_indicator.dart';

import '../data/remote/fcm_service.dart';
import '../l10n/l10n.dart';
import '../presentation/bloc/auth/auth_bloc.dart';
import '../presentation/bloc/notification/notification_bloc.dart';
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
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.locales,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        scrollBehavior: Platform.isAndroid
            ? ScrollConfiguration.of(context).copyWith(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
              )
            : null,
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return state.maybeMap(
              authenticated: (state) {
                if(context.read<NotificationsEnabledCubit>().state){
                  context
                      .read<NotificationBloc>()
                      .add(const NotificationEvent.addToken());
                }
                return state.isConfiguredContacts
                    ? const InitialScreen()
                    : const ConfigureContactsScreen();
              },
              unauthenticated: (_) => const SigninScreen(),
              orElse: () => const Material(child: LoadingIndicator()));
        }),
      ),
    );
  }
}
