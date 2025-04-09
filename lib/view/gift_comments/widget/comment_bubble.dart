import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CommentBubble extends StatelessWidget {
  final String name;
  final String text;
  final String imagePath;

  const CommentBubble({
    super.key,
    required this.name,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF006DFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style:  TextStyle(color: AppColor.dark, fontWeight: FontWeight.bold, fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(text, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20,
          )
        ],
      ),
    );
  }
}
