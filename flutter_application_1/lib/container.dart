import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Container Example"),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text(
              "This is a Container",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}