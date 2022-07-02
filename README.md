A timer that can be configured to fire once or repeatedly with ability
start, stop, resume and cancel.

## Getting started

Add `CompleteTimer` to your pubspec.yaml file:

```yaml
dependencies:
  complete_timer: ^1.0.0
```
Import `CompleteTimer` in files that it will be used:

```dart
import 'package:complete_timer/complete_timer.dart';
```
## How to use?
Create a `CompleteTimer` and give duration and callback you want to fire after the given duration.

```dart
// By default the timer starts automatically.
final CompleteTimer timer = CompleteTimer(
    duration: Duration(seconds: 5),
    // The callback function is invoked after the given duration.
    callback: (timer) {
      print('timer finished');
    },
  );
```
## Params

```dart
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
```

## CompleteTimer methods

- #### start()
        Start the timer, you don't need to call it if autoStart sets true.
        If call when the timer already started, then it resume the timer
        which this means elapsed and tick starts increasing from their previous value.
        
- #### stop()
        Stop the timer.
        The elapsed and tick stops increasing after this call.
        If call when timer is stopped does nothing.

- #### cancel()
        Cancel the timer.
        The elapsed and tick resets after this call.
        
- #### elapsed
        Elapsed time.
        
- #### tick
        The value starts at zero and is incremented each time a timer event
        occurs, so each callback will see a larger value than the previous one.
        
 - #### isRunning
        Whether the [CompleteTimer] is currently running.
