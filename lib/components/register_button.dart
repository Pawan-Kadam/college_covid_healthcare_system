import 'package:flutter/material.dart';
import 'reusable_block.dart';
import 'package:college_covid_healthcare_system/screens/register.dart';

class RegisterButton extends StatelessWidget {
  RegisterButton({Key? key, required this.sectionName}) : super(key: key);

  String sectionName;
  @override
  Widget build(BuildContext context) {
    bool isAdmin = false;
    if (sectionName == 'Admin') {
      isAdmin = true;
    }
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: isAdmin
          ? SizedBox(
              height: size.height * 0.01,
            )
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "New User ?",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPage(sectionName)),
                    );
                  },
                  child: SizedBox(
                    height: size.height * 0.08,
                    width: size.width * 0.5,
                    child: ReusableBlock(
                      blockChild: const Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
