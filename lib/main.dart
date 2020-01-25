
import 'package:assignment/views/playerView.dart';
import 'package:flutter/material.dart';

void main() => runApp(Assignment());

class Assignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlayerView(),
    );
  }
}

