import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_17/form_field.dart';
import 'package:flutter_application_1/day_20/database/db_helper.dart';
import 'package:flutter_application_1/day_20/models/user_model_sql.dart';
import 'package:flutter_application_1/day_20/views/home.dart';
import 'package:flutter_application_1/day_20/views/register.dart';
import 'package:flutter_application_1/extension/navigator.dart';
import 'package:flutter_application_1/utils/app_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passVisible = false;

  void login() async {
    final inputEmail = emailController.text.trim();
    final inputPass = passwordController.text.trim();

    if (inputEmail.isEmpty || inputPass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final user = await DBHelper().loginUser(
      UserModelSql(email: inputEmail, password: inputPass),
    );

    if (!mounted) return;

    if (user != null) {
      // await PreferenceHandler.setLogin(true);
      // Navigator.pop(context);
      context.pushAndRemoveAll(Home());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal! email atau Password salah.'),
        ),
      );
    }
  }

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
                  Image.asset(AppImage.logoBlue, height: 80),

                  Text(
                    "Welcome Back",
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

                            FormFieldTemplate(
                              typeForm: "Email",
                              controllerType: emailController,
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

                            FormFieldTemplate(
                              typeForm: "Password",
                              controllerType: passwordController,
                            ),
                          ],
                        ),

                        // Button Login
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: login,

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
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.push(RegisterScreen()),
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
}
