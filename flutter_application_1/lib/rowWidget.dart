import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Row Example"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.home, size: 50),
              Icon(Icons.star, size: 50),
              Icon(Icons.favorite, size: 50),
            ],
          ),
        ),
      ),
    ),
  );
}