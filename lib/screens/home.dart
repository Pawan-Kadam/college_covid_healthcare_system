import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:college_covid_healthcare_system/screens/staff.dart';
import 'admin.dart';
import 'student.dart';
import 'ngo.dart';
import 'package:college_covid_healthcare_system/components/homepage_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _saving = false;
  Future<void> _launchVaccineSlot(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  final String _vaccineURL = 'https://selfregistration.cowin.gov.in/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        width: size.width * 0.28,
        height: size.height * 0.04,
        color: Colors.white70,
        child: const Text(
          "A DBMS Mini-Project By Pawan Kadam",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('College Covid Healtcare System'),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage('assets/images/pccoecampus.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Welcome To The PCCOE \n Covid Healtcare System",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(5.0, 10.0),
                              blurRadius: 3.0,
                              color: Colors.black87,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      HomePageWidget(
                        sectionName: "STAFF",
                        sectionIcon: Icons.people_outline,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StaffPage()));
                        },
                      ),
                      HomePageWidget(
                        sectionName: "STUDENTS",
                        sectionIcon: Icons.people_outline,
                        onPress: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StudentPage()));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      HomePageWidget(
                        sectionName: "ADMIN",
                        sectionIcon: Icons.admin_panel_settings_outlined,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPage()));
                        },
                      ),
                      HomePageWidget(
                        sectionName: "NGO's",
                        sectionIcon: Icons.ac_unit_outlined,
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NGOPage()));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  const Text(
                                    "Not Vaccinated ?\n",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Text(
                                    "Book Your Slot Now!!!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.grey[400]),
                                    child: const Text(
                                      "Click Here To Book",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        _saving = true;
                                      });
                                      await _launchVaccineSlot(_vaccineURL);
                                      setState(() {
                                        _saving = false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
