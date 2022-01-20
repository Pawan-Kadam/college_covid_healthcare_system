import 'dart:convert';
import 'package:college_covid_healthcare_system/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:college_covid_healthcare_system/components/reusable_block.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_covid_healthcare_system/components/form_widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage(this.sectionName, {Key? key}) : super(key: key);
  String sectionName;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  bool _saving = false;

  // late String _firstName;
  // late String _lastName;
  late String _id;
  late String _email;
  late String _ngoRegId;
  // late String _department;
  // late int _phoneNumber;
  // late int _aadharNumber;
  // late String _bloodGroup;
  // late String _willToDonatePlasma;

  TextEditingController idController = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController aadharNumber = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController willToDonatePlasma = TextEditingController();
  TextEditingController ngoRegistrationId = TextEditingController();
  TextEditingController ngoName = TextEditingController();
  TextEditingController ngoAddress = TextEditingController();

  final CollectionReference _students =
      FirebaseFirestore.instance.collection('student');
  final CollectionReference _staff =
      FirebaseFirestore.instance.collection('staff');
  final CollectionReference _ngo = FirebaseFirestore.instance.collection('ngo');

  Future addDataToStudent() {
    return _students.add({
      // 'Roll_No': _id,
      // 'First_Name': _firstName,
      // 'Last_Name': _lastName,
      // 'Department': _department,
      // 'Aadhaar_No': _firstName,
      // 'Mobile_No': _phoneNumber,
      // 'Email': _email,
      // 'Blood_Group': _bloodGroup,
      // 'Plasma_Will': _willToDonatePlasma

      'Roll_No': idController.text,
      'First_Name': firstName.text,
      'Last_Name': lastName.text,
      'Department': department.text,
      'Aadhaar_No': aadharNumber.text,
      'Mobile_No': phoneNumber.text,
      'Email': email.text,
      'Blood_Group': bloodGroup.text,
      'Plasma_Will': willToDonatePlasma.text
    }).then((value) {
      // confirmation = value;
      print("Student Data Added");
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Future addDataToStaff() {
    return _staff.add({
      // 'Staff_ID': _id,
      // 'First_Name': _firstName,
      // 'Last_Name': _lastName,
      // 'Department': _department,
      // 'Aadhaar_No': _aadharNumber,
      // 'Mobile_No': _phoneNumber,
      // 'Email': _email,
      // 'Blood_Group': _bloodGroup,
      // 'Plasma_Will': _willToDonatePlasma

      'Staff_ID': idController.text,
      'First_Name': firstName.text,
      'Last_Name': lastName.text,
      'Department': department.text,
      'Aadhaar_No': aadharNumber.text,
      'Mobile_No': phoneNumber.text,
      'Email': email.text,
      'Blood_Group': bloodGroup.text,
      'Plasma_Will': willToDonatePlasma.text
    }).then((value) {
      // confirmation = value;
      print("Staff Data Added");
    }).catchError((error) => print("Failed to add staff: $error"));
  }

  Future addDataToNGO() {
    return _ngo.add({
      'Reg_ID': ngoRegistrationId.text,
      'Name': ngoName.text,
      'Address': ngoAddress.text,
      'Contact_No': phoneNumber.text,
      'Email': email.text,
      'Password': willToDonatePlasma.text
    }).then((value) {
      // confirmation = value;
      print("NGO Data Added");
    }).catchError((error) => print("Failed to add ngo: $error"));
  }

  //           if (value) {
  //   Fluttertoast.showToast(
  //     msg: "User Already Registered",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // } else {
  //   Fluttertoast.showToast(
  //     msg: "Registration Successful",
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.CENTER,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );

  // String emailid = "Email";
  // String id = "Roll No / Staff Id";
  // String fname = "First Name";
  // String lname = "First Name";
  // String dept = "Department";
  // String number = "Phone Number";
  // String aadhar = "Aadhar Card Number";
  // String blood = "Blood Group";
  // String will = "Will To Donate Plasma";

  // String idLabelText = "Roll No / Staff ID";
  // String idHintText = "Enter Complete Roll No / Staff ID";
  // String fnameLabelText = "First Name";
  // String lnameLabelText = "Last Name";
  // String deptLabelText = "Department";
  // String aadharLabelText = "Aadhar Card Number";
  // String phoneLabelText = "Phone Number";
  // String emailLabelText = "Email";
  // String bloodLabelText = "Blood Group";
  // String plasmaLabelText = "Will To Donate Plasma";
  // String bloodHintText = "Ex. B Positive";
  // String plasmaHintText = "Y or N";

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
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Column(
          children: [
            ReusableBlock(
              blockChild: Container(
                height: size.height * 0.04,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Please Fill the Complete Registration Form",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: (widget.sectionName == 'NGO')
                        ? widgetNGO()
                        : widgetNonNGO(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget widgetNGO() {
    return Column(
      children: [
        _buildNGOName(),
        _buildNGORegId(),
        _buildPhoneNumber(),
        _buildEmail(),
        _buildNGOAdd(),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
            onPressed: () async {
              setState(() {
                _saving = true;
              });

              if (!_formKey.currentState!.validate()) {
                return;
              }

              _formKey.currentState!.save();

              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: _email, password: _ngoRegId);

                if (newUser != null) {
                  addDataToNGO();

                  Navigator.pop(context);
                }
              } catch (e) {
                print(e);
              }
              setState(() {
                _saving = false;
              });
            },
            child: const Text(
              "Submit Form",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget widgetNonNGO() {
    return Column(
      children: [
        _buildId(),
        _buildFirstName(),
        _buildLastName(),
        _buildDepartment(),
        _buildAadharNumber(),
        _buildPhoneNumber(),
        _buildEmail(),
        _buildBloodGroup(),
        _buildWill(),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.grey[400]),
            onPressed: () async {
              setState(() {
                _saving = true;
              });

              if (!_formKey.currentState!.validate()) {
                return;
              }

              _formKey.currentState!.save();

              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: _email, password: _id);

                if (newUser != null) {
                  if (widget.sectionName == 'Student') {
                    addDataToStudent();
                  } else if (widget.sectionName == 'Staff') {
                    addDataToStaff();
                  }

                  Navigator.pop(context);
                }
              } catch (e) {
                print(e);
              }
              setState(() {
                _saving = false;
              });
            },
            child: const Text(
              "Submit Form",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildId() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Roll No / Staff ID",
          hintText: "Enter Complete Roll No / Staff ID",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "ID is Required";
          }
        },
        controller: idController,
        onSaved: (value) {
          _id = value!;
        },
      ),
    );
  }

  Widget _buildFirstName() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "First Name",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "First Name is Required";
          }
        },
        controller: firstName,
        // onSaved: (value) {
        //   _firstName = value!;
        // },
      ),
    );
  }

  Widget _buildLastName() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Last Name",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Last Name is Required";
          }
        },
        controller: lastName,
        // onSaved: (value) {
        //   _lastName = value!;
        // },
      ),
    );
  }

  Widget _buildDepartment() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Department",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Department is Required";
          }
        },
        controller: department,
        // onSaved: (value) {
        //   _department = value!;
        // },
      ),
    );
  }

  Widget _buildAadharNumber() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Aadhar Number",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Aadhar Number is Required";
          }
        },
        controller: aadharNumber,
        // onSaved: (value) {
        //   _aadharNumber = value! as int;
        // },
      ),
    );
  }

  Widget _buildPhoneNumber() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Phone Number",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Phone Number is Required";
          }
        },
        controller: phoneNumber,
        // onSaved: (value) {
        //   _phoneNumber = value! as int;
        // },
      ),
    );
  }

  Widget _buildEmail() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Email is Required";
          }
          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }
        },
        controller: email,
        onSaved: (value) {
          _email = value!;
        },
      ),
    );
  }

  Widget _buildBloodGroup() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Blood Group",
          hintText: "Ex. B +ve",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Blood Group is Required";
          }
        },
        controller: bloodGroup,
        // onSaved: (value) {
        //   _bloodGroup = value!;
        // },
      ),
    );
  }

  Widget _buildWill() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Plasma Will",
          hintText: "Y or N",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Willingness is Required";
          }
        },
        controller: willToDonatePlasma,
        // onSaved: (value) {
        //   _willToDonatePlasma = value!;
        // },
      ),
    );
  }

  Widget _buildNGORegId() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Registration ID",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Registration ID is Required";
          }
        },
        controller: ngoRegistrationId,
        onSaved: (value) {
          _ngoRegId = value!;
        },
      ),
    );
  }

  Widget _buildNGOName() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "NGO Name",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Name is Required";
          }
        },
        controller: ngoName,
        // onSaved: (value) {
        //   _willToDonatePlasma = value!;
        // },
      ),
    );
  }

  Widget _buildNGOAdd() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.85,
      child: TextFormField(
        cursorColor: Colors.black87,
        decoration: const InputDecoration(
          labelText: "Address",
          labelStyle: TextStyle(fontSize: 18, color: Colors.black),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Adress is Required";
          }
        },
        controller: ngoAddress,
        // onSaved: (value) {
        //   _willToDonatePlasma = value!;
        // },
      ),
    );
  }
}
