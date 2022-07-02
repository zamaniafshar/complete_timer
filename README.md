A timer that can be configured to fire once or repeatedly with ability
start, stop, resume and cancel.

## Getting started

Add Get to your pubspec.yaml file:

```yaml
dependencies:
  complete_timer: ^1.0.0
```
Import get in files that it will be used:

```dart
import 'package:complete_timer/complete_timer.dart';
```
## How to use?
Create an CompleteTimer object and give duration and callback you want to fire after the given duration.

The timer starts automatically.
```dart
final CompleteTimer timer = CompleteTimer(
    duration: Duration(seconds: 5),
    // The callback will call after 5 seconds 
    callback: (timer) {
      print('timer finished');
    },
  );
```

### Pause Timer

```dart
  timer.stop();
```

### Resume Timer
```dart
  timer.start();
```
### Cancel Timer

```dart
  timer.cancel();
```
