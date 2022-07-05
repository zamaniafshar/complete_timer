import 'dart:async';
import 'resumable_timer.dart';

class PeriodicTimer extends ResumableTimer {
  PeriodicTimer(super.options);

  @override
  void resume() {
    int remainingMicroseconds = (options.duration.inMicroseconds * (tick + 1)) -
        stopwatch.elapsedMicroseconds;

    Duration remainingDuration = Duration(microseconds: remainingMicroseconds);
    timer = Timer(remainingDuration, () {
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
