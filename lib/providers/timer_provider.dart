import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

enum TimerState {
  work,
  workComplete,
  rest,
  ready
}

class TimerProvider extends ChangeNotifier {
  TimerState _state = TimerState.work;
  int _remainingSeconds = 20 * 60; // 20 minutes in seconds
  bool _isFirstTime = true;
  final AudioPlayer _audioPlayer = AudioPlayer();

  TimerState get state => _state;
  int get remainingSeconds => _remainingSeconds;
  bool get isFirstTime => _isFirstTime;

  String get displayTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void startWork() {
    _state = TimerState.work;
    _remainingSeconds = 20 * 60; // 20 minutes
    notifyListeners();
  }

  void startRest() {
    _state = TimerState.rest;
    _remainingSeconds = 20; // 20 seconds
    notifyListeners();
  }

  void startReady() {
    _state = TimerState.ready;
    _remainingSeconds = 0;
    _playAlarm();
    notifyListeners();
  }

  void tick() {
    if (_remainingSeconds > 0) {
      _remainingSeconds--;
      if (_remainingSeconds == 0 && _state == TimerState.work) {
        _state = TimerState.workComplete;
        _playAlarm();
      } else if (_remainingSeconds == 0 && _state == TimerState.rest) {
        startReady();
      }
      notifyListeners();
    }
  }

  Future<void> _playAlarm() async {
    await _audioPlayer.play(AssetSource('alarm.mp3'));
  }

  void setFirstTimeComplete() {
    _isFirstTime = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
} 