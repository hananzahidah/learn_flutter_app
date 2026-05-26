import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_13/tugas6.dart';
import 'package:flutter_application_1/day_17/form_field.dart';
import 'package:flutter_application_1/day_17/success_regist.dart';
import 'package:flutter_application_1/extension/navigator.dart';

class Tugas10 extends StatefulWidget {
  const Tugas10({super.key});

  @override
  State<Tugas10> createState() => _Tugas10State();
}

class _Tugas10State extends State<Tugas10> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

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
                    "Create Account",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Join us and help more animals.",
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
                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Full Name",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            FormFieldTemplate(
                              typeForm: "Name",
                              controllerType: nameController,
                            ),
                          ],
                        ),

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

                            FormFieldTemplate(
                              typeForm: "Email",
                              controllerType: emailController,
                            ),
                          ],
                        ),

                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Phone (Optional)",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),

                            FormFieldTemplate(
                              typeForm: "Phone",
                              controllerType: phoneController,
                            ),
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
                              ],
                            ),
                            FormFieldTemplate(
                              typeForm: "Password",
                              controllerType: passwordController,
                            ),
                          ],
                        ),

                        // Form Asal
                        Column(
                          spacing: 8,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "City",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            FormFieldTemplate(
                              typeForm: "City",
                              controllerType: cityController,
                            ),
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
                                            "Are you sure?",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),

                                      content: SizedBox(
                                        height: 100,

                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Your Input",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text("Name: "),
                                                Text(nameController.text),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Email : "),
                                                Text(emailController.text),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text("Phone: "),
                                                Text(
                                                  phoneController
                                                          .text
                                                          .isNotEmpty
                                                      ? phoneController.text
                                                      : "-",
                                                ),
                                              ],
                                            ),

                                            Row(
                                              children: [
                                                Text("City    :"),
                                                Text(cityController.text),
                                              ],
                                            ),
                                          ],
                                        ),
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
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SuccessRegist(
                                                        name:
                                                            nameController.text,
                                                        city:
                                                            cityController.text,
                                                      ),
                                                ),
                                                (route) => false,
                                              );
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
                              "Sign Up",
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
                          "or register with",
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

              // Login
              Text.rich(
                TextSpan(
                  text: "Already have an account?",
                  style: TextStyle(color: Color(0xFF414754), fontSize: 14),

                  children: [
                    TextSpan(text: "   "),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push(Tugas6()),
                      text: "Login",
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
}
