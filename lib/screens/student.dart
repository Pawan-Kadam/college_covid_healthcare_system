import 'package:college_covid_healthcare_system/screens/login.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        title: const Text('College Covid Healtcare System'),
        centerTitle: true,
      ),
      body: LogInPage("Student"),
    );
  }
}
