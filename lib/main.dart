import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'bloc_observer.dart';
import 'core/app.dart';
import 'data/remote/fcm_service.dart';
import 'firebase_options.dart';
import 'core/service_locator/service_locator.dart' as sl;
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  Bloc.observer = GlobalObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await sl.init();
  await sl.initNotifications();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;


  runApp(const App());
}
