import 'package:flutter/material.dart';

class EmoticonCard extends StatelessWidget {
  const EmoticonCard({
    super.key,
    required this.emotion,
  });

  final String emotion;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: Colors.white.withAlpha(40),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image(
              image: AssetImage(
                "assets/emoticons/${emotion.toLowerCase()}/${emotion.toLowerCase()}.png",
              ),
              height: 32,
              width: 32,
            ),
          ),
        ),
        Text(
          emotion,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
