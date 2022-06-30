import 'dart:async';

import 'package:complete_timer/complete_timer.dart';

void main(List<String> args) {
  final Stopwatch stopwatch = Stopwatch();

  print('start');
  stopwatch.start();

  final CompleteTimer timer = CompleteTimer(
    duration: Duration(seconds: 1),
    periodic: true,
    autoStart: true,
    callback: (timer) {
      print('hello');
      print(timer.tick);
      if (timer.tick == 3) {
        stopwatch.stop();
        timer.stop();
        print('timer finished after: ${timer.elapsed}');
        print('stop watch result: ${stopwatch.elapsed}');
        timer.cancel();
      }
    },
  );
  Timer(Duration(seconds: 2, milliseconds: 800), () {
    print('paused');
    timer.stop();
  });

  Future.delayed(Duration(seconds: 5), () {
    print('resumed');
    timer.start();
  });
}
