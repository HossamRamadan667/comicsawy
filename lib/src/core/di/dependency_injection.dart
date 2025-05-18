import 'package:comicsawy/src/core/networking/api_services.dart';
import 'package:comicsawy/src/core/networking/dio_factory.dart';
import 'package:comicsawy/src/features/home/data/repos/sounds_repo.dart';
import 'package:comicsawy/src/features/home/logic/cubit/sounds_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //home
  getIt.registerLazySingleton<SoundsRepo>(() =>
      SoundsRepo(apiServices: getIt(), sharedPreferences: sharedPreferences));
  getIt.registerLazySingleton<SoundsCubit>(() => SoundsCubit(getIt()));
}
