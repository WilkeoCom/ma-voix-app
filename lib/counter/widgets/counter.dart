import 'package:flutter/material.dart';
import 'package:ma_voix_app/bloc_helpers/blocProvider.dart';
import 'package:ma_voix_app/counter/blocs/incrementBloc.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc incrementBloc = BlocProvider.of<IncrementBloc>(context);

    return StreamBuilder<int>(
        stream: incrementBloc.getCounter,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Text('You hit me: ${snapshot.data} times');
        });
  }
}
