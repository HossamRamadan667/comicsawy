import 'package:comicsawy/src/core/constants/app_constants.dart';
import 'package:comicsawy/src/core/di/dependency_injection.dart';
import 'package:comicsawy/src/core/theming/app_colors.dart';
import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/sound_model.dart';

class SoundTile extends StatefulWidget {
  final SoundModel sound;
  const SoundTile({super.key, required this.sound});

  @override
  State<SoundTile> createState() => _SoundTileState();
}

class _SoundTileState extends State<SoundTile> {
  late bool isInFavorites;

  @override
  void initState() {
    isInFavorites = widget.sound.favorite ?? false;
    super.initState();
  }

  void _playSound() {}
  void _toggleFavorite() {
    SharedPreferences sharedPreferences = getIt<SharedPreferences>();

    List<String> favoritesIdsList =
        sharedPreferences.getStringList(AppConstants.favoritesListKey) ?? [];

    if (favoritesIdsList.contains(widget.sound.id)) {
      favoritesIdsList =
          favoritesIdsList.where((id) => id != widget.sound.id).toList();
      isInFavorites = false;
    } else {
      favoritesIdsList = [...favoritesIdsList, widget.sound.id!];
      isInFavorites = true;
    }
    widget.sound.setIsFavorite(isInFavorites);
    sharedPreferences.setStringList(
        AppConstants.favoritesListKey, favoritesIdsList);
  }

  void _addAndRemoveFromFavorites() {
    setState(() {
      _toggleFavorite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GestureDetector(
        onTap: _addAndRemoveFromFavorites,
        child: Icon(
          widget.sound.favorite!
              ? Icons.star_rounded
              : Icons.star_border_rounded,
          color: widget.sound.favorite! ? AppColors.gold : AppColors.gray,
          size: 30.sp,
        ),
      ),
      title: Text(
        widget.sound.name,
        style: TextStyles.font17LightGrayW400,
      ),
      trailing: IconButton(
        onPressed: _playSound,
        icon: Icon(Icons.play_circle_outline, size: 36.sp),
        color: AppColors.gray,
      ),
    );
  }
}
