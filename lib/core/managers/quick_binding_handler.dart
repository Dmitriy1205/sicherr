import 'dart:async';
import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sicherr/core/managers/volume_buttons_listener.dart';
import 'package:sicherr/domain/entities/quick_binding/binding_actions.dart';
import 'package:sicherr/domain/entities/user_profile/user_profile.dart';
import 'package:sicherr/domain/repositories/user/user_repository.dart';

abstract interface class QuickBindingInterface {
  Stream<ActivateBinding> get triggerActionStream;

  ///implement add action to stream
  void addAction(BindingActions action);
}

final class QuickBindingListener
    with VolumeListenerMixin
    implements QuickBindingInterface {
  final UserRepository userRepo;

  late final StreamController<ActivateBinding> _actionsStreamController;
  final List<BindingActions> _actionsSequence = [];
  Timer? _clearActionsTimer;
  UserProfile? _userProfile;

  @override
  Stream<ActivateBinding> get triggerActionStream =>
      _actionsStreamController.stream;

  QuickBindingListener({required this.userRepo}) {
    _actionsStreamController = StreamController<ActivateBinding>.broadcast();
    // _initListeners();
  }

  //Initialization part start -------------------->
  void initListeners() {
    userRepo
        .getUserFieldsStream(
            currentUserId: FirebaseAuth.instance.currentUser?.uid ?? '')
        .listen((profile) {
      if (profile != null) {
        _userProfile = profile;
        _startsStopListeners();
      }
    });
  }

  void _startsStopListeners() {
    if (_userProfile!.alarmToneQB) {
      startListenVolumeBtn(callback: addAction);
      // This delay has been added to clear the _actionsSequence after we subscribe 
      // to the volume listener, because it's triggers already as we subscribe,
      // as result unwanted actions being added.
      Future.delayed(const Duration(milliseconds: 500))
          .then((_) => _clearActionSequence());
    } else {
      stopListenVolumeBtn();
    }

    if (_userProfile!.enabledSosQB) {
      //TODO: Start lisen shake phone action
    } else {
      //TODO: Stop lisen shake phone action
    }
  }

  //Initialization part end <--------------------

  // Only general logic for quick binding
  bool _checkIfTriggered() {
    final triggeredAction = ActivateBinding.values.firstWhereOrNull(
      (element) => const ListEquality()
          .equals(element.triggerCondition, _actionsSequence),
    );

    if (triggeredAction != null) {
      _actionsStreamController.add(triggeredAction);
      log('Action triggered: $triggeredAction');
      return true;
    } else {
      return false;
    }
  }

  @override
  void addAction(BindingActions action) {
    log('Added catch action: $action');
    _actionsSequence.add(action);
    _clearActionsTimer?.cancel();
    if (_checkIfTriggered()) {
      _clearActionSequence();
    } else {
      _clearActionsTimer =
          Timer(const Duration(seconds: 2), () => _clearActionSequence());
    }
  }

  void _clearActionSequence() {
    _actionsSequence.clear();

    log('Sequence array has been cleaned $_actionsSequence');
  }
}
