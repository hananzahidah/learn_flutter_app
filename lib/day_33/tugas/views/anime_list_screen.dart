import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_33/tugas/models/anime_models.dart';
import 'package:flutter_application_1/day_33/tugas/services/api_anime_services.dart';
import 'package:flutter_application_1/day_33/tugas/services/dio_client.dart';

class AnimeListScreen extends StatefulWidget {
  const AnimeListScreen({super.key});

  @override
  State<AnimeListScreen> createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  late final ApiService _apiService;
  late Future<AnimeResponse> _animesFuture;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _animesFuture = _apiService.getAllAnime();
  }

  void _refreshPosts() {
    setState(() {
      _animesFuture = _apiService.getAllAnime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D0D15),
      // backgroundColor: Color(0xFFFAF9FD),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: _animesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      Text(
                        'Gagal memuat data:\n${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.grey),
                      ), // Text
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _refreshPosts,
                        child: const Text('Coba Lagi'),
                      ), // ElevatedButton
                    ],
                  ), // Column
                ), // Padding
              ); // Center
            }

            if (!snapshot.hasData) {
              return const Center(child: Text('Tidak ada data post.'));
            }

            final animes = snapshot.data!.data;
            return RefreshIndicator(
              onRefresh: () async => _refreshPosts(),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: animes.length,
                itemBuilder: (context, index) {
                  final anime = animes[index];
                  return Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: Colors.white.withValues(alpha: 0.01),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 16,
                      children: [
                        Image.network(
                          anime.images.jpg.imageUrl,
                          height: 112,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Row(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    anime.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "#${anime.rank.toString()}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xff7B7A84),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFB59E),
                                  size: 13,
                                ),
                                Text(
                                  anime.score.toString(),
                                  style: TextStyle(
                                    color: Color(0xffC8C5D1),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Wrap(spacing: 8, runSpacing: 8, children: [

                            ],),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ), // ListView.builder
            ); // RefreshIndicator
          },
        ),
      ),
    );
  }
}
