import 'package:flutter/material.dart';

class Infoscreen extends StatelessWidget {
  const Infoscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Row(
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

        toolbarHeight: 64,
      ),

      backgroundColor: Color(0xFFFAF9FD),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                Image.asset("assets/images/logo_blue.png", height: 70),
                Text(
                  "ResQare",
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0xff0061FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "AnimalResQ adalah platform komunitas yang berdedikasi untuk menyelamatkan dan menolong hewan yang membutuhkan bantuan secara cepat dan terorganisir.",
                  style: TextStyle(fontSize: 14, color: Color(0xff475569)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 1, color: Color(0xffEDEEF1)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 15,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffF2F7FF),
                        child: Icon(Icons.person, color: Color(0xff0061FF)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NAMA PEMBUAT",
                            style: TextStyle(
                              color: Color(0xff475569),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Hanan Zahidah",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Icon(Icons.verified_outlined, color: Color(0xffCBD5E1)),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(width: 1, color: Color(0xffEDEEF1)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Icon(
                          Icons.label_important_outline,
                          color: Color(0xff0061FF),
                          size: 24,
                        ),
                        Text(
                          "VERSI",
                          style: TextStyle(
                            color: Color(0xff475569),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "1.0.0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(width: 1, color: Color(0xffEDEEF1)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Color(0xff0061FF),
                          size: 24,
                        ),
                        Text(
                          "RILIS",
                          style: TextStyle(
                            color: Color(0xff475569),
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Mei 2026",
                          style: TextStyle(
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

            Container(
              padding: EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 3, 81, 206), Color(0xff3A7BFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(width: 1, color: Color(0xffEDEEF1)),
              ),
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Misi Kami",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Menghubungkan pecinta hewan dengan mereka yang membutuhkan pertolongan darurat.",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
