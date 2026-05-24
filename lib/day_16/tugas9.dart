import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/list_category.dart';

class Tugas9 extends StatefulWidget {
  const Tugas9({super.key});

  @override
  State<Tugas9> createState() => _Tugas9State();
}

class _Tugas9State extends State<Tugas9> {
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

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              spacing: 40,
              children: [
                Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rescure Catalog",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Premium supplies for your rescued companions",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                // 1. List
                SizedBox(
                  height: 42,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: kategoriHewan.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 24,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffEDEEF1),
                          ),
                        ),
                        child: Center(child: Text(kategoriHewan[index])),
                      );
                    },
                  ),
                ),

                // 2. List of Map
                Column(
                  spacing: 20,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Report Category",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                          ),

                      itemCount: kategoriLaporan.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffEDEEF1),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 12,
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xffF2F7FF),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xffEDEEF1),
                                  ),
                                ),
                                child: Icon(
                                  kategoriLaporan[index]["icon"],
                                  size: 25,
                                  color: Color(0xff0061FF),
                                ),
                              ),
                              Text(
                                kategoriLaporan[index]["nama"],
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),

                // 3. Model
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Recent Reports",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: rescueCases.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = rescueCases[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffEDEEF1),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),

                                    child: Image.asset(
                                      data.gambar,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 220,
                                    ),
                                  ),
                                  Positioned(
                                    top: 16,
                                    left: 16,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                        horizontal: 14,
                                      ),
                                      decoration: BoxDecoration(
                                        color: data.status == "Urgent"
                                            ? Colors.red
                                            : data.status == "Medium"
                                            ? Colors.orange
                                            : data.status == "Low"
                                            ? Colors.green
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(50),
                                      ),

                                      child: Text(
                                        data.status,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: EdgeInsets.all(26),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 10,
                                      children: [
                                        Text(
                                          data.nama,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(data.deskripsi),

                                        Row(
                                          spacing: 6,
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                            ),
                                            Text(
                                              data.lokasi,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 20),

                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xffF1F7FF,
                                          ),
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          child: Row(
                                            spacing: 6,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "View Details",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                              Icon(
                                                Icons.arrow_forward,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
