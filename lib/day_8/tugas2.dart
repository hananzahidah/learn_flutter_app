import 'package:flutter/material.dart';

class ProfileLayout extends StatelessWidget {
  const ProfileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "My Profile",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),

        backgroundColor: Color(0xFF327af4),
      ),
      backgroundColor: Color(0xFFF8F8F8),
      body: Column(
        children: [
          // Identitas Utama
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/profile.jpeg"),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Text("Hanan Zahidah Robbani", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),

          // Detail Kontak
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 10),
                  Text("charlieephy@gmail.com"),
                ],
              ),
            ),
          ),

          // Informasi Pendukung
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 10),
                    Text("0813456789"),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 10),
                    Text("Jakarta Pusat"),
                  ],
                ),
              ],
            ),
          ),

          // Statistik Data
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF327af4),
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "12",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Reports",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFF327af4),
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "4",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Animal Helped",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Deskriptif
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Animal rescue volunteer focused on emergency response, rehabilitation, and rehoming of stray and injured animals. Committed to building a safer world for animals.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),

          // Visual Branding
          Container(
            margin: const EdgeInsets.all(16),
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage("assets/images/animal_rescue.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
