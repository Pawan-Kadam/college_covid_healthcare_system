import 'package:college_covid_healthcare_system/components/reusable_block.dart';
import 'package:flutter/material.dart';
import 'package:college_covid_healthcare_system/components/table_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  _AdminViewState createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('College Covid Healtcare System'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableBlock(
              blockChild: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.grey[400], padding: const EdgeInsets.all(20)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TableWidget(
                            section: "Student",
                          )));
            },
            child: const Text("Student Section",
                style: TextStyle(color: Colors.black, fontSize: 18)),
          )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          ReusableBlock(
              blockChild: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.grey[400], padding: const EdgeInsets.all(20)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TableWidget(
                            section: 'Staff',
                          )));
            },
            child: const Text("Staff Section",
                style: TextStyle(color: Colors.black, fontSize: 18)),
          )),
          const Padding(padding: EdgeInsets.only(top: 20)),
          ReusableBlock(
              blockChild: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.grey[400], padding: const EdgeInsets.all(20)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TableWidget(
                            section: 'NGO',
                          )));
            },
            child: const Text("NGO Section",
                style: TextStyle(color: Colors.black, fontSize: 18)),
          )),
        ],
      ),
    );
  }
}
