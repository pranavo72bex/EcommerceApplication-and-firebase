import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:youtube_tutorial_ecommerce/contents.dart';
import 'package:youtube_tutorial_ecommerce/screens/Home_page.dart';
import 'package:youtube_tutorial_ecommerce/screens/login_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text(
                  "error",
                  style: Constants.regularHeading,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                // ignore: missing_return
                builder: (context, streamsnapshot) {
                  if (streamsnapshot.hasError) {
                    return Scaffold(
                      body: Center(
                        child: Text(
                          "error",
                          style: Constants.regularHeading,
                        ),
                      ),
                    );
                  }

                  if (streamsnapshot.connectionState ==
                      ConnectionState.active) {
                    User _user = streamsnapshot.data;
                    if (_user == null) {
                      return LoginPage();
                    } else {
                      return HomePage();
                    }
                  }

                  // return Scaffold(
                  //   body: Center(
                  //     child: Text("Authentication is establish"),
                  //   ),
                  // );
                });
          }
        });
  }
}
