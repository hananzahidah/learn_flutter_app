import 'package:dio/dio.dart';
import 'package:flutter_application_1/day_33/materi/models/post_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/posts')
  Future<List<PostModel>> getAllPosts();
}
