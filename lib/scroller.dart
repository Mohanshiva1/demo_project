import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickers extends StatefulWidget {
  const TimePickers({Key? key}) : super(key: key);

  @override
  State<TimePickers> createState() => _TimePickersState();
}

class _TimePickersState extends State<TimePickers> {
  List<String> values = [
    "5 hours Before",
    "2 hours Before",
    "1 hours Before",
    "55 min Before",
    "50 min Before",
    "45 min Before",
    "40 min Before",
    "35 min Before",
    "30 min Before",
    "25 min Before",
    "20 min Before",
    "15 min Before",
    "10 min Before",
    "5 min Before",
    "0",
    "5 min After",
    "10 min After",
    "15 min After",
    "20 min After",
    "25 min After",
    "30min After",
    "35 min After",
    "40 min After",
    "45 min After",
    "50 min After",
    "55 min After",
    "1 hours After",
    "2 hours After",
    "5 hours After",
  ];

  int index = 14;
  FixedExtentScrollController? scrollController;

  @override
  void initState() {
    scrollController = FixedExtentScrollController(initialItem: index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 180,
            width: 300,
            child: CupertinoPicker(
              scrollController: scrollController,
              // looping: true,
              children: Utils.modelBuilder<String>(values, (index, value) {
                return Center(
                  child: Text(
                    value,
                    style: TextStyle(
                        fontWeight: FontWeight.w900, letterSpacing: 5),
                  ),
                );
              }),
              onSelectedItemChanged: (index) {
                setState(() {
                  this.index = index;
                  print(".............................${values[index]}");
                });
              },
              itemExtent: 60,
              diameterRatio: 1.2,
            )),
      ),
    );
  }
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}
