import 'package:comicsawy/src/core/theming/app_colors.dart';
import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/sound_model.dart';

class SoundTile extends StatefulWidget {
  final SoundModel sound;
  const SoundTile({super.key, required this.sound});

  @override
  State<SoundTile> createState() => _SoundTileState();
}

class _SoundTileState extends State<SoundTile> {
  bool isInFavorite = false;

  void _playSound() {}

  void _addAndRemoveFromFavorites() {
    // just for now
    setState(() {
      isInFavorite = !isInFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: GestureDetector(
        onTap: _addAndRemoveFromFavorites,
        child: Icon(
          isInFavorite ? Icons.star_rounded : Icons.star_border_rounded,
          color: isInFavorite ? AppColors.gold : AppColors.gray,
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
