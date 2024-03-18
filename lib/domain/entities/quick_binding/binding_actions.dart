enum ActivateBinding {
  sos,
  warning;

  List<BindingActions> get triggerCondition => switch (this) {
        ActivateBinding.sos => [
            BindingActions.volumeUp,
            BindingActions.volumeUp,
            BindingActions.volumeDown,
            BindingActions.volumeDown,
          ],
        ActivateBinding.warning => [
            BindingActions.volumeUp,
            BindingActions.volumeDown,
            BindingActions.volumeUp,
            BindingActions.volumeDown,
          ],
      };
}

enum BindingActions { volumeUp, volumeDown, shakePhone }
