import 'package:dio/dio.dart';
import 'package:flutter_application_1/day_35/tugas/models/all_user_response.dart';
import 'package:flutter_application_1/day_35/tugas/models/batches_response.dart';
import 'package:flutter_application_1/day_35/tugas/models/detail_training_response.dart';
import 'package:flutter_application_1/day_35/tugas/models/edit_photo_response.dart';
import 'package:flutter_application_1/day_35/tugas/models/edit_response.dart';
import 'package:flutter_application_1/day_35/tugas/models/login_response.dart';
import 'package:flutter_application_1/day_35/tugas/models/profile_response.dart';
import 'package:flutter_application_1/day_35/tugas/models/register_response.dart';
import 'package:flutter_application_1/day_35/tugas/models/trainings_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_services.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/api/register')
  Future<RegisterModel> register(@Body() Map<String, dynamic> body);

  @POST('/api/login')
  Future<LoginModel> login(@Body() Map<String, dynamic> body);

  @GET('/api/profile')
  Future<ProfileModel> getProfile();

  @PUT('/api/profile')
  Future<EditResponse> updateProfile(@Body() Map<String, dynamic> body);

  @PUT('/api/profile/photo')
  Future<EditPhotoResponse> updateProfilePhoto(
    @Body() Map<String, dynamic> body,
  );

  @GET('/api/users')
  Future<AllUserResponse> getAllUsers();

  @GET('/api/trainings')
  Future<TrainingsResponse> getTrainings();

  @GET('/api/trainings/{id}')
  Future<DetailTrainingResponse> getTrainingDetail(@Path('id') int id);

  @GET('/api/batches')
  Future<BatchesResponse> getBatches();
}
