import 'package:dio/dio.dart';
import 'package:flutter_application_1/day_33/tugas/models/anime_detail_models.dart';
import 'package:flutter_application_1/day_33/tugas/models/anime_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_anime_services.g.dart';

@RestApi(baseUrl: 'https://api.jikan.moe/v4/anime')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/')
  Future<AnimeResponse> getAllAnime();

  @GET('/{id}')
  Future<AnimeDetailResponse> getDetailAnime(@Path('id') int id);
}
