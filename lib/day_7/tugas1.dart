import 'package:flutter/material.dart';

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: Text(
          "Profil Saya",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: const Color(0xFFF6BBDD),
      ),
      backgroundColor: const Color(0xFFFBF5E7),

      body: Padding(
        padding: EdgeInsets.all(25),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Nama: Hanan Zahidah Robbani",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: const Color.fromARGB(255, 202, 136, 175),
                ),
                Text("Jakarta Timur", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Mahluk sosial yang berbaik hati, rajin menabung (walaupun lebih rajin ngabisinnya), dan tidak sombong.",
              style: TextStyle(
                fontSize: 14,
                color: const Color.fromARGB(255, 139, 84, 117),
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
