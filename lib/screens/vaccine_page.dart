import 'package:flutter/material.dart';
import 'package:college_covid_healthcare_system/components/reusable_block.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VaccineDetails extends StatefulWidget {
  VaccineDetails(this.userName, {Key? key}) : super(key: key);
  String userName;

  @override
  _VaccineDetailsState createState() => _VaccineDetailsState();
}

class _VaccineDetailsState extends State<VaccineDetails> {
  final _firestore = FirebaseFirestore.instance;
  bool _saving = false;

  TextEditingController certificateId = TextEditingController();
  TextEditingController vaccineName = TextEditingController();
  TextEditingController dose1Date = TextEditingController();
  TextEditingController dose2Date = TextEditingController();

  final CollectionReference _vaccine =
      FirebaseFirestore.instance.collection('vaccine');

  Future addDataToVaccine() {
    return _vaccine.add({
      'Vaccine_Name': vaccineName.text,
      'Certificate_ID': certificateId.text,
      'Dose1_Date': dose1Date.text,
      'Dose2_Date': dose2Date.text,
    }).then((value) {
      // confirmation = value;
      print("Vaccine Data Added");
    }).catchError((error) => print("Failed to add vaccine: $error"));
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        children: [
          ReusableBlock(
            blockChild: Container(
              height: 20,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                "Hello, ${widget.userName}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildVaccineName(),
                      _buildCertificateId(),
                      _buildDose1Date(),
                      _buildDose2Date(),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.grey[300]),
                          onPressed: () {
                            setState(() {
                              _saving = true;
                            });

                            addDataToVaccine();
                            Navigator.pop(context);

                            if (!_formKey.currentState!.validate()) {
                              // print(_)
                              return;
                            }
                            _formKey.currentState!.save();

                            setState(() {
                              _saving = false;
                            });
                          },
                          child: const Text(
                            "Submit Vaccine Details",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateId() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Certificate_Id",
          hintText: "Enter Vaccine Certificate_Id",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Certificate_Id is Required";
          }
        },
        controller: certificateId,
        // onSaved: (value) {
        //   _certificateId = value!;
        // },
      ),
    );
  }

  Widget _buildVaccineName() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Vaccine Name",
          hintText: "Enter Vaccine Name",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Vaccine Name is Required";
          }
        },
        controller: vaccineName,
        // onSaved: (value) {
        //   _vaccineName = value!;
        // },
      ),
    );
  }

  Widget _buildDose1Date() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Dose 1 Date",
          hintText: "Enter Dose 1 Date",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Dose 1 Date is Required";
          }
        },
        controller: dose1Date,
        // onSaved: (value) {
        //   _dose1Date = value as DateTime;
        // },
      ),
    );
  }

  Widget _buildDose2Date() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Dose 2 Date",
          hintText: "Enter Dose 2 Date",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Dose 2 Date is Required";
          }
        },
        controller: dose2Date,
        // onSaved: (value) {
        //   _dose2Date = value as DateTime;
        // },
      ),
    );
  }
}
