import 'package:json_annotation/json_annotation.dart';

part 'anime_detail_models.g.dart';

@JsonSerializable(explicitToJson: true)
class AnimeDetailResponse {
  final AnimeDetail data;

  AnimeDetailResponse({required this.data});

  factory AnimeDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeDetailResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeDetail {
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

  @JsonKey(name: 'title_synonyms')
  final List<String> titleSynonyms;

  final String type;

  final String source;

  final int? episodes;

  final String status;

  final bool airing;

  final Aired? aired;

  final String duration;

  final String? rating;

  final double? score;

  @JsonKey(name: 'scored_by')
  final int? scoredBy;

  final int? rank;

  final int? popularity;

  final int? members;

  final int? favorites;

  final String? synopsis;

  final String? background;

  final String? season;

  final int? year;

  final Broadcast? broadcast;

  final List<AnimeCompany> producers;

  final List<AnimeCompany> licensors;

  final List<AnimeCompany> studios;

  final List<Genre> genres;

  @JsonKey(name: 'explicit_genres')
  final List<Genre> explicitGenres;

  final List<Genre> themes;

  final List<Genre> demographics;

  AnimeDetail({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    this.episodes,
    required this.status,
    required this.airing,
    this.aired,
    required this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });

  factory AnimeDetail.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeDetailToJson(this);
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
class Aired {
  final String? from;

  final String? to;

  final String? string;

  Aired({this.from, this.to, this.string});

  factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);

  Map<String, dynamic> toJson() => _$AiredToJson(this);
}

@JsonSerializable()
class Broadcast {
  final String? day;

  final String? time;

  final String? timezone;

  final String? string;

  Broadcast({this.day, this.time, this.timezone, this.string});

  factory Broadcast.fromJson(Map<String, dynamic> json) =>
      _$BroadcastFromJson(json);

  Map<String, dynamic> toJson() => _$BroadcastToJson(this);
}

@JsonSerializable()
class AnimeCompany {
  @JsonKey(name: 'mal_id')
  final int malId;

  final String type;

  final String name;

  final String url;

  AnimeCompany({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory AnimeCompany.fromJson(Map<String, dynamic> json) =>
      _$AnimeCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeCompanyToJson(this);
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
