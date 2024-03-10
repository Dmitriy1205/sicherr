import 'dart:async';
import 'dart:developer';

import 'package:flutter_volume_controller/flutter_volume_controller.dart';
import 'package:just_audio/just_audio.dart';

abstract interface class BaseStrategy {
  void execute();
}

abstract interface class SimplePlayer {
  Future<void> play();
  Future<void> stop();
  bool get isPlaying;
  Stream<bool> get isPlayingChangeStream;
}

base class AlarmManager implements SimplePlayer {
  bool _isPlaying = false;

  @override
  bool get isPlaying => _isPlaying;
  @override
  Stream<bool> get isPlayingChangeStream => _playingStreamController.stream;

  late final AudioPlayer assetsAudioPlayer;
  late final StreamController<bool> _playingStreamController;

  AlarmManager() {
    _playingStreamController = StreamController<bool>.broadcast();
    assetsAudioPlayer = AudioPlayer()
      ..setLoopMode(LoopMode.all)
      ..setVolume(1.0);

    assetsAudioPlayer.playerStateStream.listen((event) {
      if (_isPlaying != event.playing) {
        _isPlaying = event.playing;
        _playingStreamController.add(_isPlaying);
        log('Alarm playing: ${event.playing}');
      }
    });
  }

  @override
  Future<void> play() async {
    try {
      assetsAudioPlayer.setAsset('assets/sounds/alarm.mp3');
      FlutterVolumeController.setVolume(1);
      await assetsAudioPlayer.play();
    } catch (e) {
      log('Error playing alarm');
    }
  }

  @override
  Future<void> stop() async {
    try {
      await assetsAudioPlayer.stop();
    } catch (e) {
      log('Error stop alarm');
    }
  }
}
