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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  void register() async {
    final inputEmail = emailController.text.trim();
    final inputPass = passwordController.text.trim();
    final inputFullname = nameController.text.trim();
    final inputPhone = phoneController.text.isEmpty
        ? null
        : phoneController.text.trim();
    final String inputRole = roleController.text.trim();

    if (inputEmail.isEmpty ||
        inputPass.isEmpty ||
        inputFullname.isEmpty ||
        inputRole.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi field yang wajib!')));
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Akun berhasil dibuat')));

      setState(() {});
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email sudah terdaftar!')));
    }
  }

  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {
            PreferenceHandler.logOut();
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
          icon: Icon(Icons.login),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 14,
          children: [
            Column(
              spacing: 10,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 12,
                    children: [
                      Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          FormFieldTemplate(
                            typeForm: "City",
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
              ],
            ),

            Expanded(
              child: FutureBuilder<List<UserModelSql>>(
                future: DBHelper().getAllUsers(),
                builder: (context, snapshot) {
                  // Menampilkan indikator loading saat menunggu data
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // Menangani jika terjadi error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Terjadi kesalahan: ${snapshot.error}'),
                    );
                  }

                  // Menangani jika data kosong atau tidak ada data
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Tidak ada data pengguna.'),
                    );
                  }

                  // Jika data berhasil didapatkan
                  final daftarPengguna = snapshot.data!;

                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: daftarPengguna.length,
                    itemBuilder: (context, index) {
                      final user = daftarPengguna[index];
                      return Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(user.email ?? ""),
                          subtitle: Text('Password: ${user.password}'),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.edit_document,
                              color: Colors.blueGrey,
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
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.push(DatabaseList());
                },
                child: Text("Lihat Database"),
              ),
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
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: roleController,
                decoration: const InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Row untuk Tombol Update dan Delete
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol Update
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    // onPressed: () {},
                    onPressed: () async {
                      if (user.id != null) {
                        final updatedUser = UserModelSql(
                          id: user.id,
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          phone: phoneController.text,
                          fullName: nameController.text,
                          role: roleController.text,
                        );
                        bool success = await DBHelper().updateUser(updatedUser);
                        if (success && context.mounted) {
                          Navigator.pop(context);
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil diperbarui'),
                            ),
                          );
                        }
                      }
                    },
                  ),

                  // Tombol Delete
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
                              content: Text('Data berhasil dihapus'),
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
