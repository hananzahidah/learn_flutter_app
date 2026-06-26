import 'package:dio/dio.dart';
import 'package:flutter_application_1/day_33/tugas/models/anime_detail_models.dart';
import 'package:flutter_application_1/day_33/tugas/models/anime_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_anime_services.g.dart';

@RestApi(baseUrl: 'https://api.jikan.moe/v4/anime')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/')
  Future<AnimeResponse> getAllAnime({
    @Query('q') String? query,
    @Query('genres') String? genres,
    @Query('status') String? status,
    @Query('type') String? type,
    @Query('rating') String? rating,
    @Query('order_by') String? orderBy,
    @Query('sort') String? sort,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sfw') bool? sfw,
  });

  @GET('/{id}')
  Future<AnimeDetailResponse> getDetailAnime(@Path('id') int id);
}
