import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Column Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 50,
                color: Colors.red,
              ),
              SizedBox(height: 20),
              Container(
                width: 100,
                height: 50,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Container(
                width: 100,
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}