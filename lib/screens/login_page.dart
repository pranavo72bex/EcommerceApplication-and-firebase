import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/custom_form_fill_login.dart';
import 'package:youtube_tutorial_ecommerce/custom_widgets/custom_login_buttons.dart';
import 'package:youtube_tutorial_ecommerce/screens/register_page.dart';

import '../contents.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  // Create a new user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = await _loginAccount();

    // If the string is not null, we got error while create account.
    if (_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);

      // [loding ?? not loading].
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  bool _loginFormLoading = false;

  String _loginEmail = "";
  String _loginPassword = "";

  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 70.0,
                ),
                child: Text(
                  "Login Page",
                  textAlign: TextAlign.center,
                  style: Constants.regularHeading,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email...",
                    onChanged: (value) {
                      _loginEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    hintText: "Password...",
                    onChanged: (value) {
                      _loginPassword = value;
                    },
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                    onSubmitted: (value) {
                      _submitForm();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomBtn(
                    text: "Login",
                    onPressed: () {
                      _submitForm();
                    },
                    isLoading: _loginFormLoading,
                  )
                ],
              ),
              SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: CustomBtn(
                    text: "Create New Account",
                    outlineBtn: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
