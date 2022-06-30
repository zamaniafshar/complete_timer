import 'periodic_timer.dart';
import 'resumable_timer.dart';
import 'timer_options.dart';

typedef Callback = void Function(CompleteTimer timer);

/// A timer that can be configured to fire once or repeatedly with ability
/// [start], [stop], [resume] and [cancel]
///
/// Note: this class uses [Timer] and [StopWatch]
abstract class CompleteTimer {
  /// Creates a new timer
  ///
  /// The [callback] function is invoked after the given [duration].
  ///
  /// If [autoStart] sets true timer starts automatically, default to true.
  ///
  /// If [periodic] sets true timer fires repeatedly
  /// The [callback] is invoked repeatedly with [duration] intervals until
  /// canceled with the [cancel] function.
  /// Defaults to false
  factory CompleteTimer({
    required Duration duration,
    required Callback callback,
    bool periodic = false,
    bool autoStart = true,
  }) {
    final CompleteTimerOptions options = CompleteTimerOptions(
        callback: callback, duration: duration, autoStart: autoStart);
    if (periodic) {
      return PeriodicTimer(options);
    } else {
      return ResumableTimer(options);
    }
  }

  /// Elapsed time
  Duration get elapsed;

  /// The value starts at zero and is incremented each time a timer event
  /// occurs, so each callback will see a larger value than the previous one.
  int get tick;

  /// Whether the [CompleteTimer] is currently running.
  bool get isRunning;

  /// Start the timer, you don't need to call it
  /// if [autoStart] sets true and timer automatically starts.
  ///
  /// If call when the timer already started, then it resume the timer
  /// which this means [elapsed] and [tick] starts increasing from their previous value
  void start() {}

  /// Stop the timer and [elapsed] and [tick] stops increasing,
  /// if call when timer is stopped does nothing.
  void stop() {}

  /// Cancel the timer and reset [elapsed] and [tick]
  void cancel() {}
}
