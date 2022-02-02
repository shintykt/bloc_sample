import 'dart:async';
import 'dart:math' show Random;

class CalcBloc {
  final _startController = StreamController<void>();
  final _calcController = StreamController<int>();
  final _outputController = StreamController<String>();
  final _buttonController = StreamController<bool>();

  StreamSink<void> get start => _startController.sink;
  Stream<String> get onAdd => _outputController.stream;
  Stream<bool> get onToggle => _buttonController.stream;

  static const _repeat = 6;
  late int _sum;
  late Timer _timer;

  CalcBloc() {
    _startController.stream.listen((_) => _start());
    _calcController.stream.listen((count) => _calc(count));
    _buttonController.sink.add(true);
  }

  void dispose() {
    _startController.close();
    _calcController.close();
    _outputController.close();
    _buttonController.close();
  }

  void _start() {
    _sum = 0;
    _outputController.sink.add('');
    _buttonController.sink.add(false);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calcController.sink.add(timer.tick);
    });
  }

  void _calc(int count) {
    if (count < _repeat + 1) {
      final num = Random().nextInt(100);
      _outputController.sink.add('$num');
      _sum += num;
    } else {
      _timer.cancel();
      _outputController.sink.add('答えは$_sum');
      _buttonController.sink.add(true);
    }
  }
}
