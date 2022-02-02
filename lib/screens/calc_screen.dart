import 'package:flutter/material.dart';
import 'package:bloc_sample/blocs/calc_bloc.dart';
import 'package:bloc_sample/blocs/calc_provider.dart';

class CalcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CalcBlocProvider.of(context)!.bloc;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(bloc),
          _button(bloc),
        ],
      )),
    );
  }

  Widget _text(CalcBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.onAdd,
      builder: (context, snapshot) {
        return Text(
          snapshot.hasData ? snapshot.data! : '',
          style: const TextStyle(fontSize: 38.0),
        );
      },
    );
  }

  Widget _button(CalcBloc bloc) {
    return StreamBuilder<bool>(
      stream: bloc.onToggle,
      builder: (context, snapshot) {
        return Opacity(
            opacity: snapshot.hasData ? (snapshot.data! ? 1.0 : 0.0) : 0.0,
            child: ElevatedButton(
              child: const Text('スタート'),
              onPressed: () => bloc.start.add(null),
            ));
      },
    );
  }
}