import 'dart:async';

import 'package:complete_timer/complete_timer.dart';

void normalTimerExample() {
  print('start normal timer');

  final CompleteTimer normalTimer = CompleteTimer(
    // must a non-negative Duration.
    duration: Duration(seconds: 5),

    // If periodic sets true
    // The callback is invoked repeatedly with duration intervals until
    // canceled with the cancel function.
    // Defaults to false.
    periodic: false,

    // If autoStart sets true timer starts automatically, default to true.
    autoStart: true,

    // The callback function is invoked after the given duration.
    callback: (timer) {
      print('normal example');
      timer.stop();
      // We call stop function before getting elapsed time to get a exact time.
      print('normal timer finished after: ${timer.elapsed}');
    },
  );

  // After 2 seconds we stop timer and 2 second later we resume it
  Future.delayed(Duration(seconds: 2), () {
    print('stopped normal timer');
    normalTimer.stop();
  });

  Future.delayed(Duration(seconds: 4), () {
    print('resumed normal timer');
    normalTimer.start();
  });
}

void periodic(List<String> args) {
  print('periodic timer started');

  // Creates a periodic timer which fires callback every seconds
  final CompleteTimer periodicTimer = CompleteTimer(
    // must a non-negative Duration.
    duration: Duration(seconds: 1),
    // If periodic sets true
    // The callback is invoked repeatedly with duration intervals until
    // canceled with the cancel function.
    // Defaults to false.
    periodic: true,
    // If autoStart sets true timer starts automatically, default to true.
    autoStart: true,
    callback: (timer) {
      print('periodic example');
      if (timer.tick == 5) {
        // We call stop function before getting elapsed time to get a exact time
        timer.stop();
        print('periodic timer finished after: ${timer.elapsed}');
        timer.cancel();
      }
    },
  );

  // After 2 seconds we stop timer and 2 second later we resume it
  Future.delayed(Duration(seconds: 2), () {
    print('stopped periodic timer');
    periodicTimer.stop();
  });

  Future.delayed(Duration(seconds: 4), () {
    print('resumed periodic timer');
    periodicTimer.start();
  });
}
