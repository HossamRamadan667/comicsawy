import 'package:comicsawy/src/features/home/data/sound_model.dart';
import 'package:comicsawy/src/features/home/widgets/sound_tile.dart';
import 'package:flutter/material.dart';

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
          Text(widget.category),
          IconButton(
              onPressed: _toggleOpen,
              icon: Icon(
                _isOpened
                    ? Icons.arrow_right_rounded
                    : Icons.arrow_drop_down_rounded,
                size: 27,
              ))
        ],
      );

  Widget _customDropDownItemsBuilder() => Column(
        children: widget.soundsByCategory
            .map((sound) => SoundTile(sound: sound))
            .toList(),
      );

  Widget _customDropDown() => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            _titleAndToggler(),
            _customDropDownItemsBuilder(),
          ]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl, child: _customDropDown());
  }
}
