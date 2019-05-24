import 'package:flutter/material.dart';
import 'package:ma_voix_app/bloc_helpers/blocProvider.dart';
import 'package:ma_voix_app/counter/blocs/incrementBloc.dart';
import 'package:ma_voix_app/counter/widgets/counter.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IncrementBloc incrementBloc = BlocProvider.of<IncrementBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(child: Counter()),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          incrementBloc.incrementCounter();
        },
      ),
    );
  }
}
