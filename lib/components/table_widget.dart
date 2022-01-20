import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TableWidget extends StatefulWidget {
  TableWidget({Key? key, required this.section}) : super(key: key);

  final String section;

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  final Stream<QuerySnapshot> studentStream =
      FirebaseFirestore.instance.collection('student').snapshots();
  final Stream<QuerySnapshot> staffStream =
      FirebaseFirestore.instance.collection('staff').snapshots();
  final Stream<QuerySnapshot> ngoStream =
      FirebaseFirestore.instance.collection('ngo').snapshots();

  final CollectionReference student =
      FirebaseFirestore.instance.collection('student');
  final CollectionReference staff =
      FirebaseFirestore.instance.collection('staff');
  final CollectionReference ngo = FirebaseFirestore.instance.collection('ngo');

  late Stream<QuerySnapshot> stream;

  // Future<void> deleteUser({id, stream}){
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.section == 'Student') {
      stream = studentStream;
    } else if (widget.section == 'Staff') {
      stream = staffStream;
    } else {
      stream = ngoStream;
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
            alignment: Alignment.center,
            // width: size.width * 0.001,
            height: size.height * 0.04,
            color: Colors.blueGrey[200],
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
              child: const Text(
                "BACK",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('College Covid Healtcare System'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          final List fetchedData = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            a['id'] = document.id;
            fetchedData.add(a);
          }).toList();

          return SingleChildScrollView(
            child: Column(
              children: [
                Table(children: [
                  TableRow(
                    children: [
                      headerRow(field: "Name", size: size),
                      headerRow(field: 'ID', size: size),
                      headerRow(field: "Action", size: size),
                    ],
                  ),
                  for (int i = 0; i < fetchedData.length; ++i) ...[
                    TableRow(children: [
                      tableCell(
                          field: (fetchedData[i]['First_Name'].toString() +
                              " " +
                              fetchedData[i]['Last_Name'].toString())),
                      tableCell(field: fetchedData[i]['Roll_No'].toString()),
                      actionTable(),
                    ])
                  ],
                ]),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Widget TableWidgetView({required Size size, required List fetchedData}) {
//   return
// }

TableCell headerRow({required String field, required Size size}) {
  return TableCell(
    child: Container(
        height: size.height * 0.05,
        color: Colors.grey[200],
        child: Center(
          child: Text(
            field,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
  );
}

TableCell tableCell({required String field}) {
  return TableCell(
      child: Padding(
    padding: const EdgeInsets.only(top: 13),
    child: Center(child: Text(field, style: const TextStyle(fontSize: 18.0))),
  ));
}

TableCell actionTable() {
  return TableCell(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // IconButton(
        //   onPressed: () => {
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) =>
        //     //         UpdateStudentPage(id: storedocs[i]['id']),
        //     //   ),
        //     // )
        //   },
        //   icon: Icon(
        //     Icons.edit,
        //     color: Colors.lightBlue[700],
        //   ),
        // ),
        IconButton(
          onPressed: () => {}, //{deleteUser(storedocs[i]['id']),},
          icon: Icon(
            Icons.delete,
            color: Colors.red[800],
          ),
        ),
      ],
    ),
  );
}
