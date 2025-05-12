import 'package:comicsawy/src/core/theming/app_colors.dart';
import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/core/widgets/app_card.dart';
import 'package:comicsawy/src/features/home/ui/widgets/sound_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/sound_model.dart';

class SoundByCategoryDropDown extends StatefulWidget {
  final List<SoundModel> soundsByCategory;
  final String category;
  const SoundByCategoryDropDown(
      {super.key, required this.soundsByCategory, required this.category});

  @override
  State<SoundByCategoryDropDown> createState() =>
      _SoundByCategoryDropDownState();
}

class _SoundByCategoryDropDownState extends State<SoundByCategoryDropDown> {
  bool _isOpened = false;

  void _toggleOpen() {
    setState(() {
      _isOpened = !_isOpened;
    });
  }

  Widget _titleAndToggler() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.category,
            style: TextStyles.font20LightGrayW700,
          ),
          IconButton(
              onPressed: _toggleOpen,
              icon: Icon(
                _isOpened
                    ? Icons.arrow_right_rounded
                    : Icons.arrow_drop_down_rounded,
                size: 27.sp,
                color: AppColors.gray,
              ))
        ],
      );

  Widget _customDropDownItemsBuilder() => Column(
        children: _isOpened
            ? widget.soundsByCategory
                .map((sound) => SoundTile(sound: sound))
                .toList()
            : [],
      );

  Widget _customDropDown() => AppCard(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          _titleAndToggler(),
          _isOpened ? const Divider() : Container(),
          _customDropDownItemsBuilder(),
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl, child: _customDropDown());
  }
}
