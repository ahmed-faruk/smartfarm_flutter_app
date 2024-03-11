import 'package:flutter/material.dart';
import 'package:smartfarm_flutter_app/screens/authentication/signup_screen.dart';
import 'package:smartfarm_flutter_app/services/authentication_service.dart';
import 'package:smartfarm_flutter_app/screens/dashboard_screen.dart';
import 'package:animate_do/animate_do.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthenticationService _authenticationService = AuthenticationService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Login", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),)),
                      SizedBox(height: 20,),
                      FadeInUp(duration: Duration(milliseconds: 1200), child: Text("Login to your account", style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700]
                      ),)),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeInUp(duration: Duration(milliseconds: 1200), child: makeInput(label: "Email", controller: _emailController)),
                        FadeInUp(duration: Duration(milliseconds: 1300), child: makeInput(label: "Password", obscureText: true, controller: _passwordController)),
                      ],
                    ),
                  ),
                  if (_errorMessage.isNotEmpty)
                    FadeInUp(duration: Duration(milliseconds: 1400), child: Text(
                      _errorMessage,
                      style: TextStyle(color: Colors.red),
                    )),
                  FadeInUp(duration: Duration(milliseconds: 1400), child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          _signIn();
                        },
                        color: Colors.greenAccent,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: Text("Login", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),
                      ),
                    ),
                  )),
                  FadeInUp(duration: Duration(milliseconds: 1500), child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?"),
                      GestureDetector(
                        onTap: () {
                          // Navigate to the signup screen
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                        },
                        child: Text(" Sign up", style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18
                        )),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            FadeInUp(duration: Duration(milliseconds: 1200), child: Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover
                  )
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget makeInput({required String label, required TextEditingController controller, bool obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        SizedBox(height: 5,),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }

  Future<void> _signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      // Attempt to sign in
      final user = await _authenticationService.logIn(email, password);

      if (user != null) {
        // Navigate to the dashboard screen upon successful login
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
      } else {
        setState(() {
          _errorMessage = 'Invalid email or password. Please try again.';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Please enter your email and password.';
      });
    }
  }
}
