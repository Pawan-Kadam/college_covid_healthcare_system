import 'package:flutter/material.dart';
import 'login.dart';

class NGOPage extends StatelessWidget {
  const NGOPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('College Covid Healtcare System'),
        centerTitle: true,
      ),
      body: LogInPage("NGO"),
    );
  }
}
