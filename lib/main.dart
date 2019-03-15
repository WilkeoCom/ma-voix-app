import 'package:flutter/material.dart';
import 'package:ma_voix_app/bloc_helpers/blocProvider.dart';
import 'package:ma_voix_app/counter/blocs/incrementBloc.dart';
import 'package:ma_voix_app/counter/widgets/counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<IncrementBloc>(
        bloc: IncrementBloc(),
        child: Counter(),
      ),
    );
  }
}
