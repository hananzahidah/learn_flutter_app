import 'package:flutter/material.dart';

List<String> kategoriHewan = [
  "Kucing",
  "Anjing",
  "Burung",
  "Kelinci",
  "Hamster",
  "Reptil",
  "Iguana",
  "Musang",
  "Ayam",
  "Landak Mini",
];

List<Map<String, dynamic>> kategoriLaporan = [
  {"nama": "Injured", "icon": Icons.medical_services},
  {"nama": "Missing", "icon": Icons.search},
  {"nama": "Adoption", "icon": Icons.favorite},
  {"nama": "Emergency", "icon": Icons.warning},
  {"nama": "Foster", "icon": Icons.home},
  {"nama": "Neglect", "icon": Icons.report},
  {"nama": "Evacuation", "icon": Icons.local_shipping},
  {"nama": "Medical", "icon": Icons.healing},
  {"nama": "Donation", "icon": Icons.volunteer_activism},
  {"nama": "Street Rescue", "icon": Icons.pets},
];

class RescueCase {
  final String nama;
  final String gambar;
  final String deskripsi;
  final String lokasi;
  final String status;

  RescueCase({
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.lokasi,
    required this.status,
  });
}

List<RescueCase> rescueCases = [
  RescueCase(
    nama: "Kucing Oren",
    gambar: "assets/images/report1.jpg",
    deskripsi:
        "Ditemukan terluka di area pasar dan membutuhkan perawatan medis.",
    lokasi: "Jl. Jendral Sudirman",
    status: "Urgent",
  ),

  RescueCase(
    nama: "Anak Anjing",
    gambar: "assets/images/report2.jpg",
    deskripsi: "Masih kecil dan membutuhkan foster sementara.",
    lokasi: "Jl. Asia Afrika",
    status: "Medium",
  ),

  RescueCase(
    nama: "Burung Merpati",
    gambar: "assets/images/report3.jpg",
    deskripsi: "Sayap kanan terluka dan tidak bisa terbang.",
    lokasi: "Jl. Diponegoro",
    status: "Low",
  ),

  RescueCase(
    nama: "Kucing Hitam",
    gambar: "assets/images/report4.jpg",
    deskripsi: "Terjebak di selokan sempit selama beberapa jam.",
    lokasi: "Jl. Gatot Subroto",
    status: "Urgent",
  ),

  RescueCase(
    nama: "Kelinci Putih",
    gambar: "assets/images/report5.jpg",
    deskripsi: "Ditinggalkan pemilik dan membutuhkan adopter baru.",
    lokasi: "Jl. Braga",
    status: "Medium",
  ),

  RescueCase(
    nama: "Anjing Jalanan",
    gambar: "assets/images/report6.jpg",
    deskripsi: "Mengalami luka di kaki akibat kecelakaan kendaraan.",
    lokasi: "Jl. Merdeka",
    status: "Urgent",
  ),

  RescueCase(
    nama: "Hamster Coklat",
    gambar: "assets/images/report7.jpg",
    deskripsi: "Ditemukan lemas dan membutuhkan perawatan.",
    lokasi: "Jl. Cihampelas",
    status: "Low",
  ),

  RescueCase(
    nama: "Iguana Hijau",
    gambar: "assets/images/report8.jpg",
    deskripsi: "Berhasil dievakuasi dari area banjir.",
    lokasi: "Jl. Pasteur",
    status: "Medium",
  ),

  RescueCase(
    nama: "Musang Kecil",
    gambar: "assets/images/report9.jpg",
    deskripsi:
        "Ditemukan kelaparan di pinggir jalan. Membutuhkan rumah sementara setelah operasi.",
    lokasi: "Jl. Setiabudi",
    status: "Urgent",
  ),

  RescueCase(
    nama: "Kucing Belang",
    gambar: "assets/images/report10.jpg",
    deskripsi: "Membutuhkan rumah sementara setelah operasi.",
    lokasi: "Jl. Ir. H. Juanda",
    status: "Low",
  ),
];
