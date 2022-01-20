import 'package:flutter/material.dart';
import 'login.dart';

class StaffPage extends StatelessWidget {
  const StaffPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('College Covid Healtcare System'),
        centerTitle: true,
      ),
      body: LogInPage("Staff"),
    );
  }
}
