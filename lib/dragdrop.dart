import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Generate dummy data for the list view
  final List<String> _products = [
    'https://img.freepik.com/free-vector/combination-circuit-head-shape-artificial-intelligence-moral-electronic-world-illustration_456031-123.jpg?w=1380&t=st=1654503965~exp=1654504565~hmac=441d7c0db0f70f39230a34189c20b3b2cb4ca7cd752a5c69ceddea0770d58e4b',
    "https://img.freepik.com/free-photo/ai-technology-microchip-background-digital-transformation-concept_53876-124669.jpg?t=st=1654581027~exp=1654581627~hmac=8bc59ebf1db335dfddad621984f0ce6cb7d849dc38ac0ff2207cfae49d4ab099&w=996",
    "https://img.freepik.com/free-photo/digital-cyberspace-data-network-connections_24070-1044.jpg?w=1380",
  ];

  // List.generate(3, (index) => "Product ${index.toString()}",);
  List <String> names = [
    'Prem',
    'Mohan',
    'Perthosh'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(50),
          child: ReorderableListView.builder(
            itemCount: _products.length,
            itemBuilder: (context, index) {
              final String productName = _products[index];
              return Container(
                height: 300,
                key: ValueKey(productName),
                // color: Colors.amberAccent,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_products[index]),
                    fit: BoxFit.fill,
                  ),
                ),
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(25),
                  title: Text(
                    names[index],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.drag_handle,
                    color: Colors.white,
                  ),
                  onTap: () {},
                ),
              );
            },
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) {
                  newIndex = newIndex - 1;
                }
                final element = _products.removeAt(oldIndex);
                _products.insert(newIndex, element);
                final element1 = names.removeAt(oldIndex);
                names.insert(newIndex, element1);
              });
            },
          ),
        ),
      ),
    );
  }
}
