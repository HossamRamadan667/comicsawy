import 'package:flutter/material.dart';

class SoundWidget extends StatelessWidget {
  final Function onPlay;
  final String name;
  const SoundWidget({super.key, required this.onPlay, required this.name});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            IconButton(
                onPressed: () => onPlay(),
                icon: const Icon(
                  Icons.play_circle_outlined,
                  size: 35,
                ))
          ],
        ),
      );
}
