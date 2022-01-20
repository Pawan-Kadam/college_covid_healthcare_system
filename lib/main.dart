import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
    // FutureBuilder(
    //   builder: (context, snapshot) {
    //     // CHeck for Errors
    //     if (snapshot.hasError) {
    //       print("Something went Wrong");
    //     }
    //     // once Completed, show your application
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       print("All OK");
    //       return MaterialApp(
    //         home: Home(),
    //       );
    //       // MaterialApp(
    //       //   title: 'Flutter Firestore CRUD',
    //       //   theme: ThemeData(
    //       //     primarySwatch: Colors.blue,
    //       //   ),
    //       //   debugShowCheckedModeBanner: false,
    //       //   home: Home(),
    //       // );
    //     }
    //     return const CircularProgressIndicator();
    //   },
    // );
  }

// void main() async {
//   // To initilize firebase before starting the app
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'College Covid Healtcare System',
//       debugShowCheckedModeBanner: false,
//       home: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.hasError) {
//             print("Something Went Wrong");
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Home();
//           }
//           return CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Home();
//   }
// }
}
