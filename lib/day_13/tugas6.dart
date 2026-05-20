import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_10/tugas4.dart';
import 'package:flutter_application_1/day_12/tugas5.dart';
import 'package:flutter_application_1/extension/navigator.dart';

class Tugas6 extends StatefulWidget {
  const Tugas6({super.key});

  @override
  State<Tugas6> createState() => _Tugas6State();
}

class _Tugas6State extends State<Tugas6> {
  final _formKey = GlobalKey<FormState>();
  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9FD),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Column(
                spacing: 6,
                children: [
                  Image.asset("assets/images/logo_blue.png", height: 80),

                  Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Sign in to continue helping animals and \nreporting rescues.",
                    style: TextStyle(fontSize: 14, color: Color(0xFF414754)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(height: 32),

              Column(
                spacing: 24,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: 24,
                      children: [
                        // Form Email
                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),

                            formItem("Email"),
                          ],
                        ),

                        // Form Pasword
                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF005BBF),
                                  ),
                                ),
                              ],
                            ),
                            formItem("Password"),
                          ],
                        ),

                        // Button Login
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // print("Sudah memenuhi syarart");
                                showDialog(
                                  context: context,

                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(12),
                                      ),

                                      title: Column(
                                        children: [
                                          Icon(
                                            Icons.verified,
                                            color: Colors.green,
                                            size: 50,
                                          ),
                                          Text(
                                            "Login successful!",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),

                                      backgroundColor: Colors.white,

                                      actions: [
                                        Center(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                0xFF005BBF,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadiusGeometry.circular(
                                                      12,
                                                    ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              context.pushReplacement(Tugas5());
                                            },
                                            child: Text(
                                              "Ok",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                print("Yang bener");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF005BBF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(12),
                              ),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Expanded(
                        child: Container(height: 1, color: Color(0xFFC1C6D6)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "or continue with",
                          style: TextStyle(
                            color: Color(0xFF414754),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(height: 1, color: Color(0xFFC1C6D6)),
                      ),
                    ],
                  ),

                  // Button Login with
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        // side: BorderSide(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: Row(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.apple, color: Colors.black, size: 24),
                          Text(
                            "Continue with Apple",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 32),

              // Sign Up
              Text.rich(
                TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(color: Color(0xFF414754), fontSize: 14),

                  children: [
                    TextSpan(text: "   "),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF005BBF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField formItem(String iconName) {
    return TextFormField(
      keyboardType: iconName == "Email" ? TextInputType.emailAddress : null,

      obscureText: iconName == "Password" ? !passVisible : false,
      obscuringCharacter: "*",

      decoration: InputDecoration(
        hintText: "Enter your ${iconName.toLowerCase()}",
        hintStyle: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFC1C6D6)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFC1C6D6)),
        ),

        filled: true,
        fillColor: Colors.white,

        suffixIcon: iconName == "Password"
            ? IconButton(
                onPressed: () {
                  setState(() {
                    passVisible = !passVisible;
                  });
                },

                icon: Icon(
                  passVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,

                  color: const Color(0xFF727785),
                ),
              )
            : null,

        prefixIcon: iconName.isEmpty
            ? null
            : (Icon(iniIcon(iconName.toLowerCase()), color: Color(0xFF727785))),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFC1C6D6)),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$iconName is required";
        }

        if (iconName == "Password") {
          if (value.length < 8) {
            return "Password less than 8 characters";
          }
        } else if (iconName == "Email") {
          if (!value.contains("@")) {
            return "Incorrect email format";
          }
        }
        return null;
      },
    );
  }
}
