import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  bool textVisible = false;
  bool favorite = false;
  bool showMore = false;
  bool tampilPesan = false;
  int angka = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 6. FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            angka--;
            print("mengurangi -1 = $angka");
          });
        },

        backgroundColor: Color(0xFF327af4),
        shape: CircleBorder(),

        child: Icon(Icons.exposure_minus_1, color: Colors.white),
      ),

      appBar: AppBar(
        toolbarHeight: 80,
        title: Center(
          child: Text(
            "Detail Informasi",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),

        backgroundColor: Color(0xFF327af4),
      ),
      backgroundColor: Colors.white,

      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/catalog2.jpg",
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),

              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  padding: EdgeInsets.all(4),
                  width: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 250, 150, 0),
                    borderRadius: BorderRadius.circular(50),
                  ),

                  child: Text(
                    "Medium",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Anjing Sakit di Benhil",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    // 2. IconButton
                    Row(
                      children: [
                        Text(favorite ? "Liked!" : " "),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              favorite = !favorite;
                              print("favorite = $favorite");
                            });
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: favorite ? Colors.red : Colors.grey,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // 1. ElevatedButton
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: Colors.grey),
                    // color: Colors.grey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 219, 232, 255),
                            child: Icon(Icons.person, color: Colors.black),
                          ),
                          Text(
                            textVisible
                                ? "Halo, saya Rania!"
                                : "Informasi Pelapor",
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            textVisible = !textVisible;
                            // print("Text muncul = $textVisible");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 219, 232, 255),
                        ),
                        child: Text(
                          "Lihat",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Alamat",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        spacing: 6,
                        children: [
                          Icon(Icons.location_on, color: Colors.grey),
                          Text("Jl. Karet Pasar Baru Barat, Karet Tengsin"),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),

                // 3. TextButton
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Deskripsi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ditemukkan seekor anjing dalam keadaan terkulai lemah di sekitar jalan Benhil. Badan anjing terasa panas. Dibutuhkan bantuan medis secepatnya. ",
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            showMore
                                ? ""
                                : "Ciri-ciri anjing: Berwarna cokelat, besar, mengenakan kalung silver, terdapat corak putih di belakang kepalanya.",
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showMore = !showMore;
                              print("Show more = $showMore");
                            });
                          },
                          child: Text(
                            showMore ? "Show more" : "Show less",
                            style: TextStyle(
                              color: Color(0xFF327af4),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(),

                // 4. InkWell
                Center(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        tampilPesan = !tampilPesan;
                        print("ini pesan rahasia");
                      });
                    },
                    child: Container(
                      // height: 60,
                      width: 200,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: tampilPesan
                            ? Color.fromARGB(255, 219, 232, 255)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          width: 1,
                          color: tampilPesan ? Color(0xFF327af4) : Colors.grey,
                        ),
                      ),
                      child: Text(
                        tampilPesan ? "Sedang ditangani" : "Cek Status",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                // 5. GestureDetector
                GestureDetector(
                  onTap: () {
                    setState(() {
                      angka++;
                      print("menambah +1 = $angka");
                    });
                  },

                  onDoubleTap: () {
                    setState(() {
                      angka = angka + 2;
                      print("menambah +2 = $angka");
                    });
                  },

                  onLongPress: () {
                    setState(() {
                      angka = angka + 3;
                      print("menambah +3 = $angka");
                    });
                  },

                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(14),
                      width: 200,
                      // height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFF327af4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "$angka Donasi",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        textAlign: TextAlign.center,
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
  }
}
