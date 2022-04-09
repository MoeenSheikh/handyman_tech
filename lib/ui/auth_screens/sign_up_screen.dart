import 'package:flutter/material.dart';

import 'otp_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final  formKey = GlobalKey<FormState>();
  bool passwordVisible=false;
  bool conPasswordVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 20, 100, 50),
              child: Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 1, 20, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                          child: TextFormField(
                            onChanged: (value){

                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },

                            decoration: const InputDecoration(
                              hintText: 'Full Name',
                              border: InputBorder.none,
                            ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                          child: TextFormField(
                            onChanged: (value){

                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },

                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                              border: InputBorder.none,
                            ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                          child: TextFormField(
                            obscureText: !passwordVisible,

                            onChanged: (value){

                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },

                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                              ),
                            ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                          child: TextFormField(
                            obscureText: !conPasswordVisible,

                            onChanged: (value){

                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },

                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  conPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    conPasswordVisible = !conPasswordVisible;
                                  });
                                },
                              ),
                            ),

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 60, 20, 1),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  VerificationCodeScreen()));
                        },
                        child: Container(
                          height: 60,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),
                                ),
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            )


          ],
        ),
      ),

    );
  }
}
