import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  // bool rememberMe = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    super.initState();
    // loadSavedCredentials();
  }

  // void loadSavedCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     rememberMe = prefs.getBool("rememberMe") ?? false;
  //     if (rememberMe) {
  //       email.text = prefs.getString("email") ?? "";
  //       password.text = prefs.getString("password") ?? "";
  //     }
  //   });
  // }

  // void saveCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (rememberMe) {
  //     await prefs.setBool("rememberMe", true);
  //     await prefs.setString("email", email.text);
  //     await prefs.setString("password", password.text);
  //   } else {
  //     await prefs.remove("rememberMe");
  //     await prefs.remove("email");
  //     await prefs.remove("password");
  //   }
  // }


  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  @override
  Widget build(BuildContext context) {
    // TextEditingController username = TextEditingController();

    // final isPasswordVisible = useState(false);

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
              controller: email,
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
              controller: password,
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

    // Widget buildForgetPasswordBtn() {
    //   return Container(
    //     alignment: Alignment.centerRight,
    //     child: TextButton(
    //       onPressed: () => print("Forgot Password Button Pressed"),
    //       child: Text(
    //         "Forget password?",
    //         style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
    //       ),
    //     ),
    //   );
    // }
    //
    // Widget buildRememberMeCheckBox() {
    //   return Container(
    //     height: 20,
    //     child: Row(
    //       children: <Widget>[
    //         Theme(
    //           data: ThemeData(unselectedWidgetColor: Colors.white),
    //           child: Checkbox(
    //             value: rememberMe,
    //             checkColor: Colors.green,
    //             activeColor: Colors.white,
    //             side: BorderSide(color: Colors.white, width: 2),
    //             onChanged: (val) {
    //               setState(() {
    //                 rememberMe = val!;
    //                 print("value=$val");
    //               });
    //             },
    //           ),
    //         ),
    //         Text(
    //           "Remember me",
    //           style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget buildLoginBtn() {
      return Padding(
        padding: EdgeInsets.only(top: 15, bottom: 15), // Adds margin at the top
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
            onPressed: () async {
              print("Login Button Pressed");

              // Check if email or password is empty
              if (email.text.isEmpty || password.text.isEmpty) {
                if (context.mounted) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    dialogBackgroundColor: Colors.white,
                    title: 'Error',
                    desc: 'Enter your email and password',
                    btnOkOnPress: () {},
                  ).show();
                }
                return;
              }

              try {
                final credential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: email.text.trim(),
                  password: password.text.trim(),
                );

                print("Login Successful: ${credential.user?.email}");

                if (context.mounted) {
                  Navigator.of(context).pushReplacementNamed("home");
                }
              } on FirebaseAuthException catch (e) {
                print("FirebaseAuthException: ${e.code}");

                String errorTitle = "Login Failed";
                String errorMessage =
                    "An unexpected error occurred. Please try again.";

                if (e.code == 'user-not-found') {
                  errorTitle = "Wrong Email";
                  errorMessage = "No user found with this email.";
                } else if (e.code == 'wrong-password') {
                  errorTitle = "Incorrect Password";
                  errorMessage = "The password you entered is incorrect.";
                } else if (e.code == 'invalid-email') {
                  errorTitle = "Invalid Email";
                  errorMessage = "Please enter a valid email format.";
                } else if (e.code == 'too-many-requests') {
                  errorTitle = "Too Many Attempts";
                  errorMessage =
                  "Too many failed login attempts. Try again later.";
                } else if (e.code == 'network-request-failed') {
                  errorTitle = "Network Error";
                  errorMessage = "Please check your internet connection.";
                } else if (e.code == 'user-disabled') {
                  errorTitle = "Account Disabled";
                  errorMessage =
                  "This account has been disabled. Contact support.";
                } else {
                  errorMessage = e.message ?? "Authentication failed.";
                }

                // Show error dialog if context is still available
                if (context.mounted) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    animType: AnimType.rightSlide,
                    title: errorTitle,
                    desc: errorMessage,
                    btnOkOnPress: () {},
                  ).show();
                }
              } catch (e) {
                print("Unexpected error: $e");

                if (context.mounted) {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.error,
                    title: 'Error',
                    desc: 'Something went wrong. Please try again.',
                    btnOkOnPress: () {},
                  ).show();
                }
              }
            },
            child: Text(
              "Login",
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

    Widget buildSignInText() {
      return Column(
        children: [
          Text(
            "-OR-",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(height: 20),
          Text("Sign in with"),
        ],
      );
    }

    Widget buildSocialBtn(Function onTap, String logo) {
      return GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            // Adjust padding if needed
            child: SvgPicture.asset(
              logo, // Correctly loads the SVG
            ),
          ),
        ),
      );
    }

    Widget buildSocialRow() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSocialBtn(
                  () async {
                    print("pressed");
                UserCredential? user = await signInWithGoogle();
                if (user != null) {
                  print("Google Sign-In Successful: ${user.user?.email}");
                  Navigator.of(context).pushReplacementNamed("home");
                }
              },
              "assets/images/google.svg",
            ),

          ],
        ),
      );
    }

    Widget buildSignUp() {
      return GestureDetector(
        onTap: () {
          print("Sign Up button Pressed");
          Navigator.of(context).pushReplacementNamed("signup");
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Don\'t have an Account? ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "Sign Up",
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
                        height: 70,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Image.asset(
                          "assets/images/ecommerce1.jpg",
                          width: 60,
                          height: 60,
                          // fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      buildEmailTF(),
                      SizedBox(height: 20),
                      buildPasswordTF(),
                      //buildForgetPasswordBtn(),
                     // buildRememberMeCheckBox(),
                      buildLoginBtn(),
                      buildSignInText(),
                      buildSocialRow(),
                      buildSignUp(),
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