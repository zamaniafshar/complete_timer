import 'dart:async';
import 'resumable_timer.dart';

class PeriodicTimer extends ResumableTimer {
  PeriodicTimer(super.options);

  @override
  void resume() {
    int microseconds = (options.duration.inMicroseconds * (tick + 1)) -
        stopwatch.elapsedMicroseconds;

    Duration leftDuration = Duration(microseconds: microseconds);
    timer = Timer(leftDuration, () {
      tick++;
      initTimer(options.duration);
      options.callback(this);
    });
    stopwatch.start();
  }

  @override
  void initTimer(Duration duration) {
    timer = Timer.periodic(duration, (_) {
      tick++;
      options.callback(this);
    });
  }
}
