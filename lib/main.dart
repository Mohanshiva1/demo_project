
import 'package:demo_project/dragdrop.dart';
import 'package:demo_project/scroller.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  TimePickers(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDescending = false;

  List<String> items = ["a", "c", "f", "c", "f", "b", "c", "f", "z"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton.icon(
                onPressed: () {
                  setState(() {
                    isDescending = !isDescending;
                  });
                },
                icon: Icon(Icons.compare_arrows),
                label: Text(isDescending ? 'Descending' : 'Ascending')),
            Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final sortedItems = items
                      ..sort((item1, item2) => isDescending
                          ? item2.compareTo(item1)
                          : item1.compareTo(item2));
                    final item = sortedItems[index];
                    return ListTile(
                      title: Text(item),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

