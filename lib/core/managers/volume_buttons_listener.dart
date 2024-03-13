import 'dart:async';

import 'package:sicherr/core/utils/prevent_concurrent_execution.dart';
import 'package:sicherr/domain/entities/quick_binding/binding_actions.dart';
import 'package:volume_controller/volume_controller.dart';

final class VolumeButtonsListener {
  static double _volume = 1.0;
  VolumeButtonsListener() {
    VolumeController().getVolume().then((value) {
      _volume = value;
    });
  }

  static StreamController<BindingActions>? _controller;

  static StreamSubscription<BindingActions> listenActions(
      void Function(BindingActions) callback) {
    if (_controller == null || _controller!.isClosed) {
      // Create a new stream controller if it's closed
      _controller = StreamController<BindingActions>();
    }

    VolumeController().listener((volume) {
      PreventConcurrentExecution.execute(() {
        if (volume != _volume || volume == 1.0) {
          if (volume >= _volume) {
            _controller?.add(BindingActions.volumeUp);
          } else {
            _controller?.add(BindingActions.volumeDown);
          }
          _volume = volume;
        }
      });
    });
    return _controller!.stream.listen(callback);
  }

  static removeListener() {
    _controller?.close();
    VolumeController().removeListener();
  }
}

mixin VolumeListenerMixin {
  StreamSubscription<BindingActions>? _volumeButtonsSubscription;

  void startListenVolumeBtn({required void Function(BindingActions) callback}) {
    _volumeButtonsSubscription = VolumeButtonsListener.listenActions(callback);
  }

  void stopListenVolumeBtn() {
    if (_volumeButtonsSubscription != null) {
      _volumeButtonsSubscription?.cancel();
      VolumeButtonsListener.removeListener();
    }
  }
}
