enum ActivateBinding {
  alarm,
  sos,
  warning;

  List<BindingActions> get triggerCondition => switch (this) {
        ActivateBinding.alarm => [
            BindingActions.volumeUp,
            BindingActions.volumeUp,
            BindingActions.volumeDown,
            BindingActions.volumeDown,
          ],
        ActivateBinding.sos => [
            BindingActions.shakePhone,
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
