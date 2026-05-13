import 'package:flutter/material.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Registrasi & Report",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),

        backgroundColor: Color(0xFF327af4),
      ),

      backgroundColor: const Color.fromARGB(255, 240, 240, 240),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              // Form Registrasi
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  // spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Center(
                      child: Text(
                        "Form Registrasi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Field Nama
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Nama",
                            labelStyle: TextStyle(fontSize: 14),
                            hintText: "Masukkan Nama",
                            hintStyle: TextStyle(fontSize: 14),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF327af4)),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 72, 121, 255),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Field Email
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(fontSize: 14),
                            hintText: "Masukkan Email",
                            hintStyle: TextStyle(fontSize: 14),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF327af4)),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 72, 121, 255),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),

                            prefixIcon: Icon(Icons.mail),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Field No Telephone
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Telephone",
                            labelStyle: TextStyle(fontSize: 14),
                            hintText: "Masukkan Nomor Telephone",
                            hintStyle: TextStyle(fontSize: 14),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF327af4)),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 72, 121, 255),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),

                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Field Password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          obscureText: true,
                          obscuringCharacter: "*",

                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(fontSize: 14),
                            hintText: "Masukkan Password",
                            hintStyle: TextStyle(fontSize: 14),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF327af4)),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 72, 121, 255),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),

                            prefixIcon: Icon(Icons.key),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Field Konfirmasi Password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        TextField(
                          obscureText: true,
                          obscuringCharacter: "*",

                          decoration: InputDecoration(
                            labelText: "Konfirmasi Password",
                            labelStyle: TextStyle(fontSize: 14),
                            hintText: "Masukkan Password",
                            hintStyle: TextStyle(fontSize: 14),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF327af4)),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromARGB(255, 72, 121, 255),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),

                            filled: true,
                            fillColor: const Color.fromARGB(255, 243, 243, 243),

                            prefixIcon: Icon(Icons.key),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              // Report
              Column(
                children: [
                  Text(
                    "Our Reports",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),

                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 10,
                    children: [
                      gridItems("catalog1.jpg", "Rescued"),
                      gridItems("catalog2.jpg", "Injured"),
                      gridItems("catalog3.jpg", "Healed"),
                      gridItems("catalog4.jpg", "Rescued"),
                      gridItems("catalog5.jpg", "Rescued"),
                      gridItems("catalog6.jpeg", "Injured"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Grid items
Stack gridItems(String namaImg, String textLabel) {
  return Stack(
    alignment: AlignmentGeometry.bottomCenter,
    clipBehavior: Clip.none,
    children: [
      SizedBox(
        height: double.infinity,
        width: double.infinity,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset("assets/images/$namaImg", fit: BoxFit.cover),
        ),
      ),

      Positioned(
        bottom: -16,
        child: Container(
          padding: EdgeInsets.all(4),
          width: 80,
          decoration: BoxDecoration(
            color: Color(0xFF327af4),
            borderRadius: BorderRadius.circular(8),
          ),

          child: Text(
            textLabel,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}
