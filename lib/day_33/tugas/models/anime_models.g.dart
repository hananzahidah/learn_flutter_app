// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeResponse _$AnimeResponseFromJson(Map<String, dynamic> json) =>
    AnimeResponse(
      pagination: Pagination.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
      data: (json['data'] as List<dynamic>)
          .map((e) => AnimeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimeResponseToJson(AnimeResponse instance) =>
    <String, dynamic>{
      'pagination': instance.pagination.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  lastVisiblePage: (json['last_visible_page'] as num).toInt(),
  hasNextPage: json['has_next_page'] as bool,
  currentPage: (json['current_page'] as num).toInt(),
  items: PaginationItems.fromJson(json['items'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'last_visible_page': instance.lastVisiblePage,
      'has_next_page': instance.hasNextPage,
      'current_page': instance.currentPage,
      'items': instance.items,
    };

PaginationItems _$PaginationItemsFromJson(Map<String, dynamic> json) =>
    PaginationItems(
      count: (json['count'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationItemsToJson(PaginationItems instance) =>
    <String, dynamic>{
      'count': instance.count,
      'total': instance.total,
      'per_page': instance.perPage,
    };

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
  malId: (json['mal_id'] as num).toInt(),
  url: json['url'] as String,
  images: Images.fromJson(json['images'] as Map<String, dynamic>),
  trailer: Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
  approved: json['approved'] as bool,
  title: json['title'] as String,
  titleEnglish: json['title_english'] as String?,
  titleJapanese: json['title_japanese'] as String?,
  type: json['type'] as String,
  source: json['source'] as String,
  episodes: (json['episodes'] as num?)?.toInt(),
  status: json['status'] as String,
  airing: json['airing'] as bool,
  duration: json['duration'] as String,
  rating: json['rating'] as String?,
  score: (json['score'] as num?)?.toDouble(),
  scoredBy: (json['scored_by'] as num?)?.toInt(),
  rank: (json['rank'] as num?)?.toInt(),
  popularity: (json['popularity'] as num).toInt(),
  members: (json['members'] as num).toInt(),
  favorites: (json['favorites'] as num).toInt(),
  synopsis: json['synopsis'] as String?,
  background: json['background'] as String?,
  season: json['season'] as String?,
  year: (json['year'] as num?)?.toInt(),
  genres: (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  themes: (json['themes'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      'images': instance.images.toJson(),
      'trailer': instance.trailer.toJson(),
      'approved': instance.approved,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'title_japanese': instance.titleJapanese,
      'type': instance.type,
      'source': instance.source,
      'episodes': instance.episodes,
      'status': instance.status,
      'airing': instance.airing,
      'duration': instance.duration,
      'rating': instance.rating,
      'score': instance.score,
      'scored_by': instance.scoredBy,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'members': instance.members,
      'favorites': instance.favorites,
      'synopsis': instance.synopsis,
      'background': instance.background,
      'season': instance.season,
      'year': instance.year,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
      'themes': instance.themes.map((e) => e.toJson()).toList(),
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
  jpg: ImageType.fromJson(json['jpg'] as Map<String, dynamic>),
  webp: ImageType.fromJson(json['webp'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
  'jpg': instance.jpg.toJson(),
  'webp': instance.webp.toJson(),
};

ImageType _$ImageTypeFromJson(Map<String, dynamic> json) => ImageType(
  imageUrl: json['image_url'] as String,
  smallImageUrl: json['small_image_url'] as String,
  largeImageUrl: json['large_image_url'] as String,
);

Map<String, dynamic> _$ImageTypeToJson(ImageType instance) => <String, dynamic>{
  'image_url': instance.imageUrl,
  'small_image_url': instance.smallImageUrl,
  'large_image_url': instance.largeImageUrl,
};

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
  youtubeId: json['youtube_id'] as String?,
  url: json['url'] as String?,
  embedUrl: json['embed_url'] as String?,
);

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
  'youtube_id': instance.youtubeId,
  'url': instance.url,
  'embed_url': instance.embedUrl,
};

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
  malId: (json['mal_id'] as num).toInt(),
  type: json['type'] as String,
  name: json['name'] as String,
  url: json['url'] as String,
);

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
  'mal_id': instance.malId,
  'type': instance.type,
  'name': instance.name,
  'url': instance.url,
};
