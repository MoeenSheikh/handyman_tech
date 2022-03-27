import 'package:flutter/material.dart';
import 'package:handyman_tech/ui/auth_screens/sign_in_screen.dart';

import 'auth_screens/sign_up_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(130, 180, 100, 80),
                child: Text(
                    "HandyMan",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0,8, 8),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]
                    ),
                    height: 80,
                    width: 200,

                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 20,8, 8),
                child:InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                  },

                child:Container(
                  decoration: BoxDecoration(color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withAlpha(100),
                            blurRadius: 10.0),
                      ]
                  ),
                  height: 80,
                  width: 200,

                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              ),

            ],
          ),

    );
  }
}
