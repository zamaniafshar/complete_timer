import 'dart:async';

import 'complete_timer.dart';
import 'timer_options.dart';

class ResumableTimer implements CompleteTimer {
  ResumableTimer(this.options) {
    if (options.autoStart) start();
  }

  final CompleteTimerOptions options;

  final Stopwatch stopwatch = Stopwatch();
  late Timer timer;

  @override
  bool get isRunning => stopwatch.isRunning;

  @override
  int tick = 0;

  @override
  Duration get elapsedTime => stopwatch.elapsed;

  @override
  void start() {
    if (isRunning) return;
    if (stopwatch.elapsedMicroseconds > 0) {
      resume();
    } else {
      initTimer(options.duration);
    }
    stopwatch.start();
  }

  @override
  void stop() {
    if (stopwatch.elapsedMicroseconds == 0) return;
    stopwatch.stop();
    timer.cancel();
  }

  void resume() {
    Duration remainingDuration = options.duration - elapsedTime;
    initTimer(remainingDuration);
  }

  @override
  void cancel() {
    stop();
    stopwatch.reset();
    tick = 0;
  }

  void initTimer(Duration duration) {
    timer = Timer(duration, () {
      tick++;
      cancel();
      options.callback(this);
    });
  }
}
