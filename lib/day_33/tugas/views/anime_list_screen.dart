import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_33/tugas/models/anime_models.dart';
import 'package:flutter_application_1/day_33/tugas/services/api_anime_services.dart';
import 'package:flutter_application_1/day_33/tugas/services/dio_client.dart';
import 'package:flutter_application_1/day_33/tugas/views/anime_detail_screen.dart';
import 'package:flutter_application_1/day_33/tugas/views/app_color.dart';
import 'package:flutter_application_1/extension/navigator.dart';
import 'package:lottie/lottie.dart';

class AnimeListScreen extends StatefulWidget {
  const AnimeListScreen({super.key});

  @override
  State<AnimeListScreen> createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  late final ApiService _apiService;
  late Future<AnimeResponse> _animesFuture;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  int? _selectedGenreId;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _animesFuture = _apiService.getAllAnime();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _refreshPosts() {
    setState(() {
      _animesFuture = _apiService.getAllAnime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FutureBuilder(
            future: _animesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 180,
                        child: Lottie.asset(
                          'assets/animations/loading.json',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Loading...",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/animations/empty.json',
                          width: 220,
                          repeat: true,
                        ),
                        Text(
                          "Oops!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Failed to load anime data.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 24),

                        ElevatedButton.icon(
                          onPressed: _refreshPosts,
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          label: Text(
                            "Try Again",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: Text(
                    'Tidak ada data post.',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }

              final animes = snapshot.data!.data;

              final allGenres = animes
                  .expand((anime) => anime.genres)
                  .fold<Map<int, String>>({}, (map, genre) {
                    map[genre.malId] = genre.name;
                    return map;
                  })
                  .entries
                  .toList();

              final filteredAnimes = animes.where((anime) {
                final matchesSearch = anime.title.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                );
                final matchesGenre =
                    _selectedGenreId == null ||
                    anime.genres.any((g) => g.malId == _selectedGenreId);
                return matchesSearch && matchesGenre;
              }).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _searchController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search by title...",
                      hintStyle: TextStyle(
                        color: Colors.white.withValues(alpha: 0.4),
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.white54),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear, color: Colors.white54),
                              onPressed: () {
                                _searchController.clear();
                                setState(() {
                                  _searchQuery = "";
                                });
                              },
                            )
                          : null,
                      filled: true,
                      fillColor: Colors.white.withValues(alpha: 0.05),
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColor.primary,
                          width: 1,
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),

                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allGenres.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          final isSelected = _selectedGenreId == null;
                          return Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedGenreId = null;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColor.primary
                                      : AppColor.cardBg,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.transparent
                                        : Colors.white.withValues(alpha: 0.1),
                                  ),
                                ),
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.white70,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                        final genreEntry = allGenres[index - 1];
                        final genreId = genreEntry.key;
                        final genreName = genreEntry.value;
                        final isSelected = _selectedGenreId == genreId;

                        return Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedGenreId = isSelected ? null : genreId;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColor.primary
                                    : AppColor.cardBg,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.transparent
                                      : Colors.white.withValues(alpha: 0.1),
                                ),
                              ),
                              child: Text(
                                genreName,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.white70,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),

                  Expanded(
                    child: filteredAnimes.isEmpty
                        ? Center(
                            child: Text(
                              "No anime matches your search or filter.",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          )
                        : RefreshIndicator(
                            onRefresh: () async => _refreshPosts(),
                            child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.only(bottom: 16),
                              itemCount: filteredAnimes.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 0.60,
                                  ),
                              itemBuilder: (context, index) {
                                final anime = filteredAnimes[index];

                                return InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    context.push(DetailScreen(id: anime.malId));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.cardBg,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white.withValues(
                                          alpha: 0.02,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                      top: Radius.circular(12),
                                                    ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      anime.images.jpg.imageUrl,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Container(
                                                        color: AppColor.cardBg,
                                                        child: Center(
                                                          child: SizedBox(
                                                            width: 20,
                                                            height: 20,
                                                            child:
                                                                CircularProgressIndicator(
                                                                  strokeWidth:
                                                                      2,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  errorWidget:
                                                      (
                                                        context,
                                                        url,
                                                        error,
                                                      ) => Container(
                                                        color: AppColor.cardBg,
                                                        child: Icon(
                                                          Icons
                                                              .broken_image_rounded,
                                                          color: Colors.white24,
                                                        ),
                                                      ),
                                                ),
                                              ),

                                              Positioned(
                                                left: 8,
                                                top: 8,
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 6,
                                                    horizontal: 10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),

                                                    color: AppColor.primary,
                                                    // .withValues(alpha: 0.5),
                                                  ),
                                                  child: Text(
                                                    anime.type,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: 85,
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                  child: Text(
                                                    anime.title,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.3,
                                                    ),
                                                  ),
                                                ),

                                                Spacer(),

                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xffFFB59E),
                                                      size: 14,
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      anime.score?.toString() ??
                                                          "-",
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xffC8C5D1,
                                                        ),
                                                        fontSize: 12,
                                                      ),
                                                    ),

                                                    Spacer(),

                                                    Text(
                                                      "#${anime.rank ?? "-"}",
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xff7B7A84,
                                                        ),
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
