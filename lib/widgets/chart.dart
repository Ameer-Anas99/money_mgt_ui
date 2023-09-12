import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              SalesData(70, 'mon'),
              SalesData(40, 'Tue'),
              SalesData(30, 'Wed'),
              SalesData(10, 'Thu'),
              SalesData(50, 'Fri'),
              SalesData(36, 'Sat'),
              SalesData(80, 'Sun')
            ],
            xValueMapper: (SalesData sales, _) => sales.Day,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.sales, this.Day);
  final String Day;
  final int sales;
}
