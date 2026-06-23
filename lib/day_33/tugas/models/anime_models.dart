import 'package:json_annotation/json_annotation.dart';

part 'anime_models.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeResponse {
  final Pagination pagination;
  final List<AnimeModel> data;

  AnimeResponse({required this.pagination, required this.data});

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeResponseToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: 'last_visible_page')
  final int lastVisiblePage;

  @JsonKey(name: 'has_next_page')
  final bool hasNextPage;

  @JsonKey(name: 'current_page')
  final int currentPage;

  final PaginationItems items;

  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class PaginationItems {
  final int count;
  final int total;

  @JsonKey(name: 'per_page')
  final int perPage;

  PaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });

  factory PaginationItems.fromJson(Map<String, dynamic> json) =>
      _$PaginationItemsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeModel {
  @JsonKey(name: 'mal_id')
  final int malId;

  final String url;

  final Images images;

  final Trailer trailer;

  final bool approved;

  final String title;

  @JsonKey(name: 'title_english')
  final String? titleEnglish;

  @JsonKey(name: 'title_japanese')
  final String? titleJapanese;

  final String type;

  final String source;

  final int? episodes;

  final String status;

  final bool airing;

  final String duration;

  final String? rating;

  final double? score;

  @JsonKey(name: 'scored_by')
  final int? scoredBy;

  final int? rank;

  final int popularity;

  final int members;

  final int favorites;

  final String? synopsis;

  final String? background;

  final String? season;

  final int? year;

  final List<Genre> genres;

  final List<Genre> themes;

  AnimeModel({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.type,
    required this.source,
    this.episodes,
    required this.status,
    required this.airing,
    required this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    required this.genres,
    required this.themes,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Images {
  final ImageType jpg;
  final ImageType webp;

  Images({required this.jpg, required this.webp});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class ImageType {
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'small_image_url')
  final String smallImageUrl;

  @JsonKey(name: 'large_image_url')
  final String largeImageUrl;

  ImageType({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  factory ImageType.fromJson(Map<String, dynamic> json) =>
      _$ImageTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ImageTypeToJson(this);
}

@JsonSerializable()
class Trailer {
  @JsonKey(name: 'youtube_id')
  final String? youtubeId;

  final String? url;

  @JsonKey(name: 'embed_url')
  final String? embedUrl;

  Trailer({this.youtubeId, this.url, this.embedUrl});

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);

  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Genre {
  @JsonKey(name: 'mal_id')
  final int malId;

  final String type;
  final String name;
  final String url;

  Genre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
