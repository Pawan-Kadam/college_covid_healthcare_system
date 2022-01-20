import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_covid_healthcare_system/components/reusable_block.dart';

class NGOView extends StatefulWidget {
  const NGOView({Key? key}) : super(key: key);

  @override
  _NGOViewState createState() => _NGOViewState();
}

class _NGOViewState extends State<NGOView> {
  final Stream<QuerySnapshot<Map<String, dynamic>>> studentStream =
      FirebaseFirestore.instance.collection('student').snapshots();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('College Covid Healtcare System'),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: studentStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final List storeddocs = [];
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map a = document.data() as Map<String, dynamic>;
              storeddocs.add(a);
              print(storeddocs);
            }).toList();

            return ListView(
              children: [
                ReusableBlock(
                  blockChild: const Center(
                      child: Text(
                    "List of People Willing to Donate Plasma",
                    style: TextStyle(fontSize: 18),
                  )),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: DataTable(
                          columnSpacing: size.width * 0.02,
                          headingRowHeight: size.height * 0.07,
                          columns: const [
                            DataColumn(
                              label: Text(
                                "ID",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Name",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Aadhar \nNumber",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                "Blood \nGroup",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(
                                Text("TECOD467",
                                    style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("Pawan Kadam",
                                    style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("123", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("a", style: TextStyle(fontSize: 16)),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(
                                Text("2", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("abc", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("123", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("a", style: TextStyle(fontSize: 16)),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(
                                Text("3", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("abc", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("123", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("a", style: TextStyle(fontSize: 16)),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(
                                Text("4", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("abc", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("123", style: TextStyle(fontSize: 16)),
                              ),
                              DataCell(
                                Text("a", style: TextStyle(fontSize: 16)),
                              ),
                            ])
                          ]),
                    ),
                  ),
                )
                // DataTable(
                //   // columns: DataColumn(label: ),
                //   // DataColumn(label: Text("Name")),
                //   // DataColumn(label: Text("ID")),
                // // rows: DataRow(cells: [DataCell(Text('1')),
                // //         DataCell(Text('Stephen')),
                // //         DataCell(Text('Actor'))]),  ),
                // )
              ],
            );
          },
        ));
  }
}
