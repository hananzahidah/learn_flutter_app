import 'package:flutter/material.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  bool isAgree = false;
  bool isSwitch = false;
  bool isCheckMeja = false;
  String? selectedCategory;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: isSwitch ? Colors.black12 : Color(0xFFFAF9FD),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            Column(
              spacing: 24,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pendaftaran Relawan",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "Lengkapi pengaturan profil dan preferensi Anda untuk mulai membantu hewan",
                      style: TextStyle(fontSize: 14, color: Color(0xff44474E)),
                    ),
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.gavel, color: Color(0xff0061FF)),
                          Text(
                            "Syarat & Ketentuan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F7FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "KETENTUAN RELAWAN",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff0061FF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Sebagai relawan AnimalResQ, Anda berkomitmen untuk menjunjung tinggi kesejahteraan hewan di atas segalanya. Setiap tindakan penyelamatan harus dilakukan dengan penuh integritas dan transparansi.",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff44474E),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isAgree,
                            onChanged: (bool? value) {
                              setState(() {
                                isAgree = value ?? false;
                              });
                            },
                          ),
                          Text(
                            "Saya meyetujui persyaratan",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isAgree ? Colors.green : Color(0xffFEF2F2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isAgree
                              ? "Pendaftaran diperbolehkan"
                              : "Pendaftaran belum tersedia",
                          style: TextStyle(
                            fontSize: 14,
                            color: isAgree ? Colors.white : Color(0xffDC2626),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Switch
                Row(
                  children: [
                    Text("Aktifkan mode gelap"),
                    Switch(
                      value: isSwitch,
                      onChanged: (bool? value) {
                        setState(() {
                          isSwitch = value ?? false;
                        });
                      },
                    ),
                  ],
                ),

                SizedBox(height: 50),

                // Drop down
                Text("Kategori Produk"),
                DropdownButton(
                  value: selectedCategory,
                  items: ["Kucing", "Anjing", "Kelinci"].map((String val) {
                    return DropdownMenuItem(value: val, child: Text(val));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {});
                    selectedCategory = value;
                  },
                ),
                Text("Anda memilih: $selectedCategory"),
                SizedBox(height: 50),

                // Time picker
                SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
