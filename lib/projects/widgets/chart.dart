import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/linear_polls.dart';

class Chart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  Chart(this.seriesList, {this.animate});

  factory Chart.withSampleData() {
    return new Chart(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: new charts.PieChart(
        seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 60,
          arcRendererDecorators: [new charts.ArcLabelDecorator()],
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearPolls, String>> _createSampleData() {
    final data = [
      new LinearPolls('Pour', 70),
      new LinearPolls('Contre', 30),
    ];

    return [
      new charts.Series<LinearPolls, String>(
        id: 'Polls',
        domainFn: (LinearPolls sales, _) => sales.legend,
        measureFn: (LinearPolls sales, _) => sales.votesNumber,
        data: data,
        labelAccessorFn: (LinearPolls row, _) => '${row.votesNumber}',
      )
    ];
  }
}
