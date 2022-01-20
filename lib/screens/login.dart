import 'package:college_covid_healthcare_system/components/reusable_block.dart';
import 'package:college_covid_healthcare_system/components/register_button.dart';
import 'package:college_covid_healthcare_system/screens/admin_view.dart';
import 'package:college_covid_healthcare_system/screens/ngo_view.dart';
import 'package:flutter/material.dart';
import 'package:college_covid_healthcare_system/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'login_screen.dart';

class LogInPage extends StatefulWidget {
  String sectionName;
  LogInPage(this.sectionName, {Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _auth = FirebaseAuth.instance;
  bool _saving = false;

  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    bool isNGO = false;
    if (widget.sectionName == 'NGO') {
      isNGO = true;
    }
    bool isAdmin = false;
    if (widget.sectionName == 'Admin') {
      isAdmin = true;
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey,
      //   title: const Text('College Covid Healtcare System'),
      //   centerTitle: true,
      // ),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Column(
          children: [
            ReusableBlock(
              blockChild: Container(
                height: size.height * 0.03,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "You're in ${widget.sectionName} Section",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage('assets/images/pccoelogo.png'),
                      width: size.width * 0.7,
                      height: size.height * 0.3,
                    ),
                    ReusableBlock(
                      blockChild: SizedBox(
                        height: size.height * 0.065,
                        width: size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '${widget.sectionName}\'s Mail ID',
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                    ),
                    ReusableBlock(
                      blockChild: SizedBox(
                        height: size.height * 0.065,
                        width: size.width * 0.8,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: '${widget.sectionName} ID',
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          _saving = true;
                        });
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        try {
                          if (user != null) {
                            if (isNGO) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NGOView()),
                              );
                            } else if (isAdmin) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminView()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LogInScreen(email: email)),
                              );
                            }
                          }
                        } catch (e) {
                          print(e);
                        }
                        setState(() {
                          _saving = false;
                        });
                      },
                      child: SizedBox(
                        height: size.height * 0.08,
                        width: size.width * 0.5,
                        child: ReusableBlock(
                          blockChild: const Text(
                            "Log In",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    RegisterButton(sectionName: widget.sectionName),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
