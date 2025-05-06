import 'package:comicsawy/src/features/home/data/sound_model.dart';
import 'package:flutter/material.dart';

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
      leading: GestureDetector(
        onTap: _addAndRemoveFromFavorites,
        child: Icon(isInFavorite ? Icons.star : Icons.star_border),
      ),
      title: Text(widget.sound.name),
      trailing: IconButton(
        onPressed: _playSound,
        icon: const Icon(Icons.play_circle_outline, size: 32),
      ),
    );
  }
}
