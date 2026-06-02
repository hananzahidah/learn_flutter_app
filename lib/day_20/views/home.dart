import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_17/form_field.dart';
import 'package:flutter_application_1/day_19/database/preference_handler.dart';
import 'package:flutter_application_1/day_20/database/db_helper.dart';
import 'package:flutter_application_1/day_20/models/user_model_sql.dart';
import 'package:flutter_application_1/day_20/views/login.dart';
import 'package:flutter_application_1/extension/navigator.dart';
import 'package:sqlite_viewer2/sqlite_viewer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final _editFormKey = GlobalKey<FormState>();
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
    final String inputRole = roleController.text.trim().toLowerCase();

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

      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Gagal membuat akun!',
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,

              children: [
                Image.asset("assets/images/logo_blue.png", height: 32),
                Text(
                  "ResQare",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff0061FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () async {
                await PreferenceHandler.logOut();
                context.pushAndRemoveAll(LoginScreen());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Logout successful!",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xFF005BBF),
                  ),
                );
              },
              child: Row(
                spacing: 4,
                children: [
                  Icon(Icons.login, color: Colors.red),
                  Text("Logout", style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFFAF9FD),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 14,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: const Color(0xffEDEEF1)),
              ),
              child: Column(
                spacing: 16,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      spacing: 12,
                      children: [
                        FormFieldTemplate(
                          typeForm: "Name",
                          controllerType: nameController,
                        ),

                        FormFieldTemplate(
                          typeForm: "Email",
                          controllerType: emailController,
                        ),

                        FormFieldTemplate(
                          typeForm: "Phone",
                          controllerType: phoneController,
                        ),

                        FormFieldTemplate(
                          typeForm: "Password",
                          controllerType: passwordController,
                        ),

                        FormFieldTemplate(
                          typeForm: "Role",
                          controllerType: roleController,
                        ),

                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF005BBF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Create User",
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
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Registered Users",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                ElevatedButton.icon(
                  onPressed: () {
                    context.push(DatabaseList());
                  },
                  icon: const Icon(Icons.storage, color: Color(0xFF327AF4)),
                  label: const Text(
                    "Database",
                    style: TextStyle(color: Color(0xFF327AF4)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),

            FutureBuilder<List<UserModelSql>>(
              future: DBHelper().getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada data pengguna.'));
                }

                final daftarPengguna = snapshot.data!;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffEDEEF1),
                        ),
                      ),

                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),

                        leading: CircleAvatar(
                          radius: 26,
                          backgroundColor: const Color(0xFFEAF2FF),

                          child: Icon(Icons.person, color: Color(0xFF005BBF)),
                        ),

                        title: Text(
                          user.fullName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),

                            Text(user.email),

                            if (user.phone != null) Text(user.phone!),
                          ],
                        ),

                        trailing: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Color(0xFF005BBF),
                          ),
                          onPressed: () => _showBottomSheet(context, user),
                        ),

                        onTap: () => _showBottomSheet(context, user),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, UserModelSql user) {
    final emailController = TextEditingController(text: user.email);
    final passwordController = TextEditingController(text: user.password);
    final nameController = TextEditingController(text: user.fullName);
    final phoneController = TextEditingController(text: user.phone);

    final roleController = TextEditingController(text: user.role);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Kelola Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Column(
                spacing: 16,
                children: [
                  Form(
                    key: _editFormKey,
                    child: Column(
                      spacing: 12,
                      children: [
                        FormFieldTemplate(
                          typeForm: "Name",
                          controllerType: nameController,
                        ),

                        FormFieldTemplate(
                          typeForm: "Email",
                          controllerType: emailController,
                        ),

                        FormFieldTemplate(
                          typeForm: "Phone",
                          controllerType: phoneController,
                        ),

                        FormFieldTemplate(
                          typeForm: "Password",
                          controllerType: passwordController,
                        ),

                        FormFieldTemplate(
                          typeForm: "Role",
                          controllerType: roleController,
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (!_editFormKey.currentState!.validate()) {
                        return;
                      }
                      if (user.id != null) {
                        final role = roleController.text.toLowerCase().trim();

                        if (role != 'general' && role != 'volunteer') {
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

                        final updatedUser = UserModelSql(
                          id: user.id,
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),

                          phone: phoneController.text.trim().isEmpty
                              ? null
                              : phoneController.text.trim(),

                          fullName: nameController.text.trim(),

                          role: role,
                        );

                        bool success = await DBHelper().updateUser(updatedUser);

                        if (success && context.mounted) {
                          Navigator.pop(context);

                          setState(() {});

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Data berhasil diperbarui',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(0xFF005BBF),
                            ),
                          );
                        }
                      }
                    },
                  ),

                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (user.id != null) {
                        await DBHelper().deleteUser(user.id!);
                        if (context.mounted) {
                          Navigator.pop(context);
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Data berhasil dihapus',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Color(0xFF005BBF),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
