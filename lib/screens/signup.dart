import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/screens/Homepage.dart';
import 'package:store/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:flutter_hooks/flutter_hooks.dart';

class Signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signup> {
  bool rememberMe = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  @override
  Widget build(BuildContext context) {


    Widget buildEmailTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Email",
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(),
            height: 60,
            child: TextField(
              controller:email ,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                filled: true,
                // Enable background color
                fillColor: Colors.blue[400],
                // Light blue background
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  ), // Gray border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ), // Blue border on focus
                ),
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: "Enter your Email",
                hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
              ),
            ),
          ),
        ],
      );
    }

    Widget buildPasswordTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Password",
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(),
            height: 60,
            child: TextField(
              controller:password ,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                filled: true,
                // Enable background color
                fillColor: Colors.blue[400],
                // Light blue background
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  ), // Gray border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ), // Blue border on focus
                ),
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: "Enter your Password",
                hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
              ),
            ),
          ),
        ],
      );
    }

    Widget buildConfirmPasswordTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Confirm Password",
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(),
            height: 60,
            child: TextField(
              controller: confirm_password,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
              decoration: InputDecoration(
                filled: true,
                // Enable background color
                fillColor: Colors.blue[400],
                // Light blue background
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.5,
                  ), // Gray border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ), // Blue border on focus
                ),
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                hintText: "Enter your Password Again",
                hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.7)),
              ),
            ),
          ),
        ],
      );
    }



    Widget buildSignUpBtn() {
      return Padding(
        padding: EdgeInsets.only(top: 50, bottom: 15), // Adds margin at the top
        child: SizedBox(
          width: double.infinity, // Full width button
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white, // Button color
              padding: EdgeInsets.symmetric(vertical: 15), // Padding for height
              elevation: 5, // Shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Rounded corners
              ),
            ),
            onPressed: () async{
              print("Signup Button Pressed");
              if(password.text !=confirm_password.text){
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  dialogBackgroundColor: Colors.white,
                  title: 'Error',
                  desc: 'The password and Confirm Password not the same!',
                  btnOkOnPress: () {},
                ).show();

                return ;
              }
              try {
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email.text,
                  password: password.text,
                );
                Navigator.of(context).pushReplacementNamed("home");
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    dialogBackgroundColor: Colors.white,
                    title: 'Error',
                    desc: 'The password provided is too weak.',
                    btnOkOnPress: () {},
                  ).show();
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                  AwesomeDialog(
                  context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              dialogBackgroundColor: Colors.white,
              title: 'Error',
              desc: 'The account already exists for that email.',
              btnOkOnPress: () {},
              ).show();
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text(
              "Sign UP",
              style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                // Text color
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      );
    }


    Widget buildSignIn() {
      return GestureDetector(
        onTap: () {
         print("Sign In  Pressed");
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Loginpage()));
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Do you have an Account? ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login Page"),
      // ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => Focus.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.black,
                        borderRadius: BorderRadius.circular(100)
                        ),
                        child: Image.asset("assets/images/ecommerce1.jpg",
                        width: 60,
                        height: 60,
                        // fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        "Sign UP",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      buildEmailTF(),
                      SizedBox(height: 30),
                      buildPasswordTF(),
                      SizedBox(height: 20),
                      buildConfirmPasswordTF(),
                      buildSignUpBtn(),
                      // buildSignInText(),
                      // buildSocialRow(),
                      buildSignIn(),
                    ],
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
