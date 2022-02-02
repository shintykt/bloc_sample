import 'package:flutter/material.dart';
import 'package:bloc_sample/blocs/calc_bloc.dart';

class CalcBlocProvider extends InheritedWidget {
  const CalcBlocProvider({required Widget child}) : super(child: child);

  CalcBloc get bloc => CalcBloc();

  @override
  bool updateShouldNotify(_) => true;

  static CalcBlocProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CalcBlocProvider>();
  }
}
