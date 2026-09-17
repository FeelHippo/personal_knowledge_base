// https://dart.dev/libraries/async/creating-streams

// Transforming an existing stream
// The common case for creating streams is that you already have a stream, 
// and you want to create a new stream based on the original stream's events
import 'dart:async';

const LIMIT = 10;

var counterStream = Stream<int>.periodic(
  const Duration(seconds: 1),
  (x) => x,
).take(10);

// Creating a stream from scratch
// One way to create a new stream is with an asynchronous generator (async*) function.
Stream<String> stringified(Stream<int> ticks) async* {
    await for (final tick in ticks) {
        final current = tick + 1;
        // Until the function returns, 
        // it can emit events on the stream by using yield or yield* statements
        yield 'Generator: $current';
        if (current == LIMIT) yield "Let's Go!";
    }
}

// Using a StreamController
// use a StreamController to create and populate a stream
Stream<String> controlledTimedCounter(Duration interval, { int MaxCount = LIMIT, int counter = 1 }) {
    late StreamController<String> controller;
    Timer? timer;

    void tick(_) {
        counter++;
        controller.add('Controlled: $counter');
        if (counter == MaxCount) {
            timer?.cancel();
            controller.close();
        }
    }

    void startTimer() {
        timer = Timer.periodic(interval, tick);
    }

    void stopTimer() {
        timer?.cancel();
        timer = null;
    }

    controller = StreamController<String>(
        onListen: startTimer,
        onPause: stopTimer,
        onResume: startTimer,
        onCancel: stopTimer,
    );

    return controller.stream;

}
void main() async {
    var subscription;
    // The stream is created when the function is called...
    // and the function's body starts running when the stream is listened to
    stringified(counterStream).forEach(print);
    // When the function returns, the stream closes

    final timedCounter = controlledTimedCounter(const Duration(seconds: 1));
    subscription = timedCounter.listen((String counter) {
        print(counter);
        if (counter.contains("5")) {
            subscription.pause(Future.delayed(const Duration(seconds: 5)));
        }
    });

}