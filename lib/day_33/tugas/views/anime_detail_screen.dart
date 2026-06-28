import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/day_33/tugas/models/anime_detail_models.dart';
import 'package:flutter_application_1/day_33/tugas/services/api_anime_services.dart';
import 'package:flutter_application_1/day_33/tugas/services/dio_client.dart';
import 'package:flutter_application_1/day_33/tugas/views/app_color.dart';
import 'package:flutter_application_1/extension/navigator.dart';
import 'package:lottie/lottie.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  const DetailScreen({super.key, required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final ApiService _apiService;
  late Future<AnimeDetailResponse> _detailsFuture;
  bool _isSynopsisExpanded = false;
  bool _isBookmarked = false;

  @override
  void initState() {
    super.initState();
    final dio = createDioClient();
    _apiService = ApiService(dio);
    _detailsFuture = _apiService.getDetailAnime(widget.id);
  }

  void _refreshPosts() {
    setState(() {
      _detailsFuture = _apiService.getDetailAnime(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
        children: [
          FutureBuilder(
            future: _detailsFuture,
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
                return const Center(child: Text('Tidak ada data post.'));
              }

              final detail = snapshot.data!.data;
              return RefreshIndicator(
                onRefresh: () async => _refreshPosts(),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 450,
                              width: double.infinity,
                              child: ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl: detail.images.jpg.largeImageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: AppColor.cardBg,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        color: AppColor.cardBg,
                                        child: Center(
                                          child: Icon(
                                            Icons.broken_image_rounded,
                                            color: Colors.white24,
                                            size: 48,
                                          ),
                                        ),
                                      ),
                                ),
                              ),
                            ),

                            Container(
                              height: 450,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    AppColor.background,
                                    AppColor.background.withValues(alpha: 0.0),
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 16,
                              left: 16,
                              right: 16,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detail.type,
                                    style: TextStyle(
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    detail.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    detail.titleJapanese!,
                                    style: TextStyle(
                                      color: Colors.white.withValues(
                                        alpha: 0.5,
                                      ),
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Row(
                                  spacing: 16,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusGeometry.circular(
                                                  12,
                                                ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                          backgroundColor: AppColor.primary,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 4,
                                          children: [
                                            Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            Text(
                                              "Watch Trailer",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _isBookmarked = !_isBookmarked;
                                        });
                                        ScaffoldMessenger.of(
                                          context,
                                        ).hideCurrentSnackBar();
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              _isBookmarked
                                                  ? 'Added to Bookmark'
                                                  : 'Removed from Bookmark',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            backgroundColor:
                                                AppColor.bottomSheetBg,
                                            behavior: SnackBarBehavior.floating,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(12),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 14,
                                        ),
                                        backgroundColor: AppColor.cardBg,
                                      ),
                                      child: Icon(
                                        _isBookmarked
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24),

                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColor.cardBg,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Score",
                                              style: TextStyle(
                                                color: Colors.white.withValues(
                                                  alpha: 0.5,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              detail.score.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      VerticalDivider(
                                        color: Colors.white.withValues(
                                          alpha: 0.2,
                                        ),
                                        thickness: 1,
                                        width: 24,
                                      ),

                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Rank",
                                              style: TextStyle(
                                                color: Colors.white.withValues(
                                                  alpha: 0.5,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '#${detail.rank}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      VerticalDivider(
                                        color: Colors.white.withValues(
                                          alpha: 0.2,
                                        ),
                                        thickness: 1,
                                        width: 24,
                                      ),

                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Popularity",
                                              style: TextStyle(
                                                color: Colors.white.withValues(
                                                  alpha: 0.5,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '#${detail.popularity}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: detail.genres.map((genre) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: Color(
                                            0xff929096,
                                          ).withValues(alpha: 0.2),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        genre.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),

                              SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Synopsis",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        final textStyle = TextStyle(
                                          color: Colors.white.withValues(
                                            alpha: 0.5,
                                          ),
                                        );

                                        final synopsis =
                                            detail.synopsis ??
                                            'No synopsis available.';

                                        final textPainter =
                                            TextPainter(
                                              text: TextSpan(
                                                text: synopsis,
                                                style: textStyle,
                                              ),
                                              maxLines: 8,
                                              textDirection: TextDirection.ltr,
                                            )..layout(
                                              maxWidth: constraints.maxWidth,
                                            );

                                        final hasOverflow =
                                            textPainter.didExceedMaxLines;

                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AnimatedSize(
                                              duration: Duration(
                                                milliseconds: 250,
                                              ),
                                              curve: Curves.easeInOut,
                                              child: Text(
                                                synopsis,
                                                maxLines: _isSynopsisExpanded
                                                    ? null
                                                    : 8,
                                                overflow: _isSynopsisExpanded
                                                    ? TextOverflow.visible
                                                    : TextOverflow.ellipsis,
                                                style: textStyle,
                                              ),
                                            ),

                                            if (hasOverflow)
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  onTap: () {
                                                    setState(() {
                                                      _isSynopsisExpanded =
                                                          !_isSynopsisExpanded;
                                                    });
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 6,
                                                        ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          _isSynopsisExpanded
                                                              ? "Read Less"
                                                              : "Read More",
                                                          style: TextStyle(
                                                            color: AppColor
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        SizedBox(width: 2),
                                                        Icon(
                                                          _isSynopsisExpanded
                                                              ? Icons
                                                                    .keyboard_arrow_up
                                                              : Icons
                                                                    .keyboard_arrow_down,
                                                          color:
                                                              AppColor.primary,
                                                          size: 18,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Information",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 2,
                                      children: [
                                        Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColor.cardBg,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Episodes",
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.5),
                                                ),
                                              ),
                                              Text(
                                                detail.episodes.toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColor.cardBg,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Status",
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.5),
                                                ),
                                              ),
                                              Text(
                                                detail.status,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColor.cardBg,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Rating",
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.5),
                                                ),
                                              ),
                                              Text(
                                                detail.rating!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: AppColor.cardBg,
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Studios",
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withValues(alpha: 0.5),
                                                ),
                                              ),

                                              Text(
                                                detail.studios.isNotEmpty
                                                    ? detail.studios[0].name
                                                    : "N/A",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),

          Positioned(
            top: 48,
            left: 20,
            child: InkWell(
              onTap: () {
                context.pop();
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
