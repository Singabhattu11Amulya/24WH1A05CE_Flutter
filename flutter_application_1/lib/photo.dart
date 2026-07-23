import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Image Example"),
        ),
        body: Center(
          child: Image.asset(
            'assets/logo.png',
            width: 250,
            height: 250,
          ),
        ),
      ),
    ),
  );
}