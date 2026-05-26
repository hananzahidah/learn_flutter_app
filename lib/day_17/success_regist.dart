import 'package:flutter/material.dart';
import 'package:flutter_application_1/day15/tugas8.dart';
import 'package:flutter_application_1/extension/navigator.dart';

class SuccessRegist extends StatelessWidget {
  const SuccessRegist({super.key, required this.name, required this.city});

  final String name;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9FD),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1, color: const Color(0xffEDEEF1)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.verified, color: Colors.green, size: 80),
                  Text(
                    "Selamat Bergabung!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Terima kasih, $name dari $city telah mendaftar",
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F7FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffEDEEF1),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        const Icon(Icons.info_outline),

                        Expanded(
                          child: Column(
                            spacing: 4,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Langkah Selanjutnya",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),

                              Text(
                                "Tim kami akan meninjau profil Anda dan menghubungi Anda melalui email dalam waktu 2x24 jam.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () {
                      context.pushReplacement(Tugas8());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF005BBF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                    ),
                    child: Text(
                      "Kembali ke Beranda",
                      style: TextStyle(color: Colors.white),
                    ),
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
