import 'package:flutter/material.dart';
import 'package:ma_voix_app/counter/business/blocProvider.dart';
import 'package:ma_voix_app/counter/business/Increment.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Increment increment = BlocProvider.of<Increment>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
        child: StreamBuilder<int>(
            stream: increment.getCounter,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('You hit me: ${snapshot.data} times');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          increment.incrementCounter();
        },
      ),
    );
  }
}
