import 'package:comicsawy/src/core/constants/app_constants.dart';
import 'package:comicsawy/src/core/di/dependency_injection.dart';
import 'package:comicsawy/src/core/widgets/app_card.dart';
import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:comicsawy/src/features/home/logic/cubit/favorite_page_cubit.dart';
import 'package:comicsawy/src/features/home/logic/cubit/sounds_state.dart';
import 'package:comicsawy/src/features/home/ui/widgets/sound_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  SharedPreferences sharedPreferences = getIt<SharedPreferences>();

  @override
  void initState() {
    BlocProvider.of<FavoritesPageCubit>(context).emitFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesPageCubit, SoundsState<List<SoundModel>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const CircularProgressIndicator(),
          success: (sounds) => _buildSuccessBody(sounds),
          fail: (errorMessage) => Center(
            child: Text(errorMessage),
          ),
        );
      },
    );
  }

  ListView _buildSuccessBody(List<SoundModel> sounds) {
    List<String>? favoritesIdsList =
        sharedPreferences.getStringList(AppConstants.favoritesListKey);
    favoritesIdsList ??= [];
    return ListView.builder(
      padding: EdgeInsets.only(top: 10.h),
      itemCount: sounds.length,
      itemBuilder: (context, index) => Container(
          margin:
              EdgeInsets.only(bottom: index + 1 >= sounds.length ? 80.h : 0),
          child: AppCard(child: SoundTile(sound: sounds[index]))),
    );
  }
}
