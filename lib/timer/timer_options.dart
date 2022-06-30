import 'complete_timer.dart';

class CompleteTimerOptions {
  CompleteTimerOptions({
    required this.callback,
    required this.duration,
    required this.autoStart,
  });

  final Callback callback;
  final Duration duration;
  final bool autoStart;
}
