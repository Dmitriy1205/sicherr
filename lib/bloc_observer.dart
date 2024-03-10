import 'dart:developer';

import 'package:bloc/bloc.dart';

class GlobalObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('${bloc.runtimeType} $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    final changeMessage = change.toString().length > 250
        ? '${change.toString().substring(0, 250)}...'
        : change.toString();
    log('${bloc.runtimeType} $changeMessage');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    final transitionMessage = transition.toString().length > 250
        ? '${transition.toString().substring(0, 250)}...'
        : transition.toString();
    log('${bloc.runtimeType} $transitionMessage');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}
