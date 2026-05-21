import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/app_drawer.dart';
import 'package:flutter_application_1/utils/container7.dart';
import 'package:flutter_application_1/utils/ouput7.dart';
import 'package:flutter_application_1/utils/picker_button.dart';
import 'package:flutter_application_1/utils/result_input7.dart';
import 'package:intl/intl.dart';

class Tugas7 extends StatefulWidget {
  const Tugas7({super.key});

  @override
  State<Tugas7> createState() => _Tugas7State();
}

class _Tugas7State extends State<Tugas7> {
  // key input
  final GlobalKey checkboxKey = GlobalKey();
  final GlobalKey switchKey = GlobalKey();
  final GlobalKey dropdownKey = GlobalKey();
  final GlobalKey dateKey = GlobalKey();
  final GlobalKey timeKey = GlobalKey();

  // input variable
  bool isAgree = false;
  bool isSwitch = false;
  String? selectedCategory;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // scroll
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // dropdown
  final List<String> categoryItems = ["Pelapor", "Volunteer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(
        onScroll: scrollToSection,
        checkboxKey: checkboxKey,
        switchKey: switchKey,
        dropdownKey: dropdownKey,
        dateKey: dateKey,
        timeKey: timeKey,
      ),

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
      backgroundColor: isSwitch ? Color(0xff111111) : Color(0xFFFAF9FD),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              spacing: 24,
              children: [
                // Judul
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pendaftaran",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: isSwitch ? Colors.white : Colors.black,
                      ),
                    ),
                    Text(
                      "Lengkapi pengaturan profil dan preferensi Anda untuk mulai membantu hewan",
                      style: TextStyle(
                        fontSize: 14,
                        color: isSwitch ? Colors.white : Color(0xff44474E),
                      ),
                    ),
                  ],
                ),

                // Syarat & Ketentuan
                Container7(
                  key: checkboxKey,

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
                          border: Border.all(
                            width: 1,
                            color: Color(0xffEDEEF1),
                          ),
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

                      // Checkbox
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isAgree,
                            activeColor: Color(0xff3A7BFF),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
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
                          color: isAgree
                              ? Color(0xffF0FDF4)
                              : Color(0xffFEF2F2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isAgree
                              ? "Pendaftaran diperbolehkan"
                              : "Pendaftaran belum tersedia",
                          style: TextStyle(
                            fontSize: 14,
                            color: isAgree
                                ? Color(0xff16A349)
                                : Color(0xffDC2626),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Mode
                Container7(
                  key: switchKey,

                  // Switch
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.nightlight, color: Color(0xff0061FF)),
                          Text(
                            "Mode Tampilan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Aktifkan mode gelap"),
                          Switch(
                            value: isSwitch,
                            activeThumbColor: Color(0xff0061FF),
                            activeTrackColor: Color(0xffBFD4FF),

                            trackOutlineColor: WidgetStatePropertyAll(
                              Color(0xffCFCFCF),
                            ),
                            trackOutlineWidth: WidgetStatePropertyAll(1.5),

                            inactiveThumbColor: Color(0xffCFCFCF),
                            inactiveTrackColor: Color(0xffF6F6F9),

                            onChanged: (bool? value) {
                              setState(() {
                                isSwitch = value ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Kategori
                Container7(
                  key: dropdownKey,

                  // Dropdown
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.category, color: Color(0xff0061FF)),
                          Text(
                            "Kategori",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),

                        decoration: BoxDecoration(
                          color: const Color(0xffF6F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: DropdownButton<String>(
                          value: selectedCategory,

                          isExpanded: true,

                          underline: const SizedBox(),

                          hint: const Text(
                            "Silahkan Pilih Kategori",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),

                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),

                          borderRadius: BorderRadius.circular(15),

                          dropdownColor: Colors.white,

                          items: categoryItems.map((item) {
                            return DropdownMenuItem<String>(
                              value: item,

                              child: Text(
                                item,
                                style: const TextStyle(fontSize: 14),
                              ),
                            );
                          }).toList(),

                          onChanged: (value) {
                            setState(() {
                              selectedCategory = value;
                            });
                          },
                        ),
                      ),

                      Row(
                        children: [
                          Text(
                            selectedCategory == null
                                ? "Anda belum memilih kategori"
                                : "Anda memilih: $selectedCategory",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Pilih Tanggal
                Container7(
                  key: dateKey,

                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.calendar_today, color: Color(0xff0061FF)),
                          Text(
                            "Pilih Tanggal",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      // Date Picker
                      PickerButton(
                        title: "Pilih Tanggal Lahir",
                        onPressed: () async {
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );

                          if (picked != null) {
                            setState(() {
                              selectedDate = picked;
                            });
                          }
                        },
                      ),

                      // output tanggal
                      OutputPicker(
                        child: Center(
                          child: Text(
                            selectedDate == null
                                ? "Tanggal lahir belum diatur"
                                : "Tanggal Lahir: ${DateFormat('EEE, dd MMMM yyyy').format(selectedDate!)}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Atur Pengingat
                Container7(
                  key: timeKey,

                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.timer, color: Color(0xff0061FF)),
                          Text(
                            "Atur Pengingat",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      // Time Picker
                      PickerButton(
                        title: "Pilih Waktu Pengingat",
                        onPressed: () async {
                          final TimeOfDay? picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (picked != null) {
                            setState(() {
                              selectedTime = picked;
                            });
                          }
                        },
                      ),

                      // output waktu
                      OutputPicker(
                        child: Center(
                          child: Text(
                            selectedTime == null
                                ? "Pengingat belum diatur"
                                : "Pengingat diatur: ${selectedTime!.format(context)}",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Result
                Container7(
                  isResult: true,
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Icon(
                            Icons.description_outlined,
                            color: Color(0xff0061FF),
                          ),
                          Text(
                            "Ringkasan Pilihan",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      SummaryItem(
                        title: "Status Persetujuan",
                        value: isAgree ? "Disetujui" : "Belum disetujui",
                      ),

                      SummaryItem(
                        title: "Mode Gelap",
                        value: isSwitch ? "Aktif" : "Nonaktif",
                      ),

                      SummaryItem(
                        title: "Kategori",
                        value: selectedCategory ?? "-",
                      ),

                      SummaryItem(
                        title: "Tanggal Lahir",
                        value: selectedDate == null
                            ? "-"
                            : DateFormat(
                                'EEE, dd MMMM yyyy',
                              ).format(selectedDate!),
                      ),

                      SummaryItem(
                        title: "Waktu Pengingat",
                        value: selectedTime == null
                            ? "-"
                            : selectedTime!.format(context),
                        showDivider: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
