

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.counter}) : super(key: key);
  final int counter;
  @override
  Widget build(BuildContext context) {
    print(counter);
    return Scaffold(
      body: Container(
        child: Text('hey'),
      ),
    );
  }
}
