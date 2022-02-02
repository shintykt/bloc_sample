import 'package:flutter/material.dart';
import 'package:bloc_sample/screens/calc_screen.dart';

import 'blocs/calc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalcBlocProvider(
        child: CalcScreen(),
      ),
    );
  }
}
