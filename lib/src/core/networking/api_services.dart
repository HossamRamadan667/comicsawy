import 'package:comicsawy/src/core/constants/api_constants.dart';
import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:comicsawy/src/features/upload_sound/data/models/upload_sound_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @GET('/sounds.json')
  Future<Map<String, SoundModel>> getAllSound();

  @POST('/sounds.json')
  Future<UploadSoundResponseModel> uploadSound(
    @Body() SoundModel sound,
    @Query('auth') String auth,
  );
}
