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
  Duration get elapsed => stopwatch.elapsed;

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
    stopwatch.stop();
    timer.cancel();
  }

  void resume() {
    Duration leftDuration = options.duration - stopwatch.elapsed;
    initTimer(leftDuration);
  }

  @override
  void cancel() {
    stopwatch.stop();
    timer.cancel();
    stopwatch.reset();
    tick = 0;
  }

  void initTimer(Duration duration) {
    timer = Timer(duration, () {
      tick++;
      options.callback(this);
      stop();
    });
  }
}
