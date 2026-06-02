import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_17/form_field.dart';
import 'package:flutter_application_1/day_20/database/db_helper.dart';
import 'package:flutter_application_1/day_20/models/user_model_sql.dart';
import 'package:flutter_application_1/day_20/views/login.dart';
import 'package:flutter_application_1/extension/navigator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  void register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final inputEmail = emailController.text.trim();
    final inputPass = passwordController.text.trim();
    final inputFullname = nameController.text.trim();
    final inputPhone = phoneController.text.isEmpty
        ? null
        : phoneController.text.trim();
    final inputRole = roleController.text.trim().toLowerCase();

    if (inputEmail.isEmpty ||
        inputPass.isEmpty ||
        inputFullname.isEmpty ||
        inputRole.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Isi field yang wajib!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF005BBF),
        ),
      );
      return;
    }

    final emailExists = await DBHelper().checkEmailExists(inputEmail);

    if (emailExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Email sudah terdaftar!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF005BBF),
        ),
      );
      return;
    }

    if (inputPhone != null) {
      final phoneExists = await DBHelper().checkPhoneExists(inputPhone);

      if (phoneExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Nomor HP sudah digunakan!',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFF005BBF),
          ),
        );
        return;
      }
    }

    if (inputRole.toLowerCase() != 'general' &&
        inputRole.toLowerCase() != 'volunteer') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Role hanya boleh general atau volunteer!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF005BBF),
        ),
      );

      return;
    }

    final user = UserModelSql(
      email: inputEmail,
      password: inputPass,
      fullName: inputFullname,
      phone: inputPhone,
      role: inputRole,
    );

    bool success = await DBHelper().registerUser(user);

    if (!mounted) return;

    if (success) {
      emailController.clear();
      passwordController.clear();
      nameController.clear();
      phoneController.clear();
      roleController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Akun berhasil dibuat',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF005BBF),
        ),
      );
      context.push(LoginScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Email sudah terdaftar!',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF005BBF),
        ),
      );
    }
  }

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
                                  "Role",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            FormFieldTemplate(
                              typeForm: "Role",
                              controllerType: roleController,
                            ),
                          ],
                        ),

                        // Button Login
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: register,

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
                        ..onTap = () => context.push(LoginScreen()),
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
