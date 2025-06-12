import 'package:comicsawy/src/core/networking/api_services.dart';
import 'package:comicsawy/src/core/networking/dio_factory.dart';
import 'package:comicsawy/src/features/home/data/repos/sounds_repo.dart';
import 'package:comicsawy/src/features/home/logic/cubit/favorite_page_cubit.dart';
import 'package:comicsawy/src/features/home/logic/cubit/home_page_cubit.dart';
import 'package:comicsawy/src/features/login/data/repos/login_repo.dart';
import 'package:comicsawy/src/features/login/logic/cubit/login_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // simple local storage
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // sound controller
  final AudioPlayer audioPlayer = AudioPlayer();
  getIt.registerLazySingleton<AudioPlayer>(() => audioPlayer);

  // networking
  final Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  //home
  getIt.registerLazySingleton<SoundsRepo>(
      () => SoundsRepo(apiServices: getIt(), sharedPreferences: getIt()));
  getIt.registerLazySingleton<HomePageCubit>(() => HomePageCubit(getIt()));
  getIt.registerLazySingleton<FavoritesPageCubit>(
      () => FavoritesPageCubit(getIt()));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}
