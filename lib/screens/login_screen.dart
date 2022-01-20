import 'package:flutter/material.dart';
import 'package:college_covid_healthcare_system/components/reusable_block.dart';
import 'ngo_view.dart';
import 'vaccine_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'admin_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

late User loggedInUser;

class LogInScreen extends StatefulWidget {
  LogInScreen({Key? key, required this.email}) : super(key: key);

  String email;

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final CollectionReference _student =
      FirebaseFirestore.instance.collection('student');
  final CollectionReference _staff =
      FirebaseFirestore.instance.collection('staff');

  final Stream<QuerySnapshot> studentStream =
      FirebaseFirestore.instance.collection('student').snapshots();
  //   return await FirebaseFirestore.instance
  //     .collection("users")
  //     .where("name", isEqualTo: userName)
  //     .get()
  //     .catchError((e) {
  //   print(e.toString());
  // })

  // @override
  // void initState() {
  //   getCurrentUser();
  // }

  // getCurrentUser() async {
  //   final user = await _auth.currentUser;
  //   try {
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
      body: StreamBuilder<QuerySnapshot>(
        stream: studentStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          // print(widget.email);
          final List fetchedData = [];
          snapshot.data!.docs
              .where((element) => element['Email'] == widget.email)
              .map((DocumentSnapshot document) {
            print(document.data());
            // print(object)
            Map a = document.data() as Map<String, dynamic>;
            print(a);
            fetchedData.add(a);
          });

          // print(snapshot.data!.docs[0]['Email'] + "hello");
          print(fetchedData);

          return LoginViewData(fetchedData: fetchedData);
        },
      ),
    );
  }
}

class LoginViewData extends StatelessWidget {
  LoginViewData({Key? key, required this.fetchedData}) : super(key: key);
  List fetchedData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        ReusableBlock(
          blockChild: Container(
            height: size.height * 0.04,
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              "Welcome Student Name",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        const Center(
          child: Text(
            "Your Details",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: DataTable(
                columnSpacing: size.width * 0.02,
                headingRowHeight: size.height * 0.07,
                columns: [
                  dataColumn("Field"),
                  dataColumn("Details"),
                ],
                rows: [
                  for (var i = 0; i < fetchedData.length; i++) ...[
                    dataRow('Roll No', fetchedData[i]['Roll_No']),
                    dataRow('First Name', fetchedData[i]['First_Name']),
                    dataRow(
                        'Last Name', fetchedData[i]['Last_Name'].toString()),
                    dataRow(
                        'Department', fetchedData[i]['Department'].toString()),
                    dataRow('Aadhar Details',
                        fetchedData[i]['Aadhaar_No'].toString()),
                    dataRow('Mobile Number',
                        fetchedData[i]['Mobile_No'].toString()),
                    dataRow('Email', fetchedData[i]['Email'].toString()),
                    dataRow('Blood Group',
                        fetchedData[i]['Blood_Group'].toString()),
                    dataRow(
                        'Plasma Will', fetchedData[i]['Plasma_Will'].toString())
                  ]
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.grey[300]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VaccineDetails("Hello")),
                  // builder: (context) => VaccineDetails("Pawan")),
                );
              },
              child: const Text(
                "Please Click Here to Fill Vaccine Details",
                style: TextStyle(color: Colors.black),
              )),
        ),
      ],
    );
  }
}

DataColumn dataColumn(attribute) {
  return DataColumn(
    label: Text(
      attribute,
      style: const TextStyle(fontSize: 20),
    ),
  );
}

DataRow dataRow(field, value) {
  return DataRow(
    cells: [
      DataCell(
        Text(field, style: const TextStyle(fontSize: 16)),
      ),
      DataCell(
        Text(value!, style: const TextStyle(fontSize: 16)),
      ),
    ],
  );
}
