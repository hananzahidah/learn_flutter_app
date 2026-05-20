import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Reports Management",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),

        backgroundColor: Color(0xFF327af4),
      ),

      backgroundColor: const Color.fromARGB(255, 240, 240, 240),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // Form Registrasi
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Center(
                    child: Text(
                      "Report Form",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // TextField data pelapor
                  fieldItem("Nama", "Masukkan Nama", "nama"),
                  SizedBox(height: 20),

                  fieldItem("Email", "Masukkan Email", "email"),
                  SizedBox(height: 20),

                  fieldItem("Telephone", "Masukkan Telephone", "phone"),
                  SizedBox(height: 20),

                  Divider(),
                  SizedBox(height: 20),

                  // TextField isi laporan
                  fieldItem("Judul Laporan", "Masukkan Judul Laporan", "title"),
                  SizedBox(height: 20),

                  fieldItem(
                    "Lokasi Laporan",
                    "Masukkan Lokasi Laporan",
                    "location",
                  ),
                  SizedBox(height: 20),

                  fieldItem(
                    "Deskripsi Laporan",
                    "Masukkan Deskripsi Laporan",
                    "",
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Report ListTile
            Center(
              child: Text(
                "Our Reports",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),

            listItem(
              "catalog1.jpg",
              "Abandoned Kitten",
              "1 Feb 2026",
              "Medium",
              "Resolved",
            ),
            SizedBox(height: 10),
            listItem(
              "catalog2.jpg",
              "Sick Puppy",
              "11 Jan 2026",
              "Low",
              "Resolved",
            ),
            SizedBox(height: 10),
            listItem(
              "catalog3.jpg",
              "Injured Kitten",
              "6 April 2026",
              "Medium",
              "Resolved",
            ),
            SizedBox(height: 10),
            listItem(
              "catalog4.jpg",
              "Injured Rabbit",
              "27 April 2026",
              "High",
              "In Progress",
            ),
            SizedBox(height: 10),
            listItem(
              "catalog5.jpg",
              "Sick Bird",
              "3 May 2026",
              "Medium",
              "Resolved",
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Container listItem(
  String namaImg,
  String textTitle,
  String desc,
  String level,
  String status,
) {
  return Container(
    padding: EdgeInsets.symmetric(),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: ListTile(
      leading: SizedBox(
        height: double.infinity,
        width: 80,

        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),

          child: Image.asset("assets/images/$namaImg", fit: BoxFit.cover),
        ),
      ),
      title: Text(textTitle, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(spacing: 5, children: [Text(desc), Text("-"), Text(level)]),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            decoration: BoxDecoration(
              color: Color(0xFF327af4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
      trailing: Icon(Icons.arrow_outward),
    ),
  );
}

TextField fieldItem(String textLabel, String textHint, String iconName) {
  return TextField(
    maxLines: textLabel == "Deskripsi Laporan" ? 3 : 1,

    decoration: InputDecoration(
      labelText: textLabel,
      labelStyle: TextStyle(fontSize: 14),
      hintText: textHint,
      hintStyle: TextStyle(fontSize: 14),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF327af4)),
        borderRadius: BorderRadius.circular(10),
      ),

      border: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 72, 121, 255)),
        borderRadius: BorderRadius.circular(10),
      ),

      filled: true,
      fillColor: const Color.fromARGB(255, 243, 243, 243),

      prefixIcon: iconName != "" ? (Icon(iniIcon(iconName))) : null,
    ),
  );
}

IconData iniIcon(String namaIcon) {
  switch (namaIcon) {
    case "nama":
      return Icons.person;
    case "email":
      return Icons.mail_outline;
    case "phone":
      return Icons.phone;
    case "password":
      return Icons.lock_outline;
    // case "title":
    //   return Icons.keyboard;
    case "location":
      return Icons.location_on;
    default:
      return Icons.keyboard;
  }
}
