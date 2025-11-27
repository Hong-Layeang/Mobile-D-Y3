import 'package:flutter/material.dart';
import '';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Ronan the BEst")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(itemCount: 4, itemBuilder: _buildItem),
        ),
      ),
    ),
  );
}

Widget _buildItem(BuildContext context, int index) {
  print("Build item $index");

  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    color: Colors.blue,
    height: 100,
    child: Text("$index - ${expenses [index].title}"),
  );
}