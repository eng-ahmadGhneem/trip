import 'package:flutter/material.dart';
class ProfileRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool editable;

  const ProfileRow({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.editable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        if (editable)
          const Icon(Icons.edit, size: 16, color: Colors.white70),
      ],
    );
  }
}