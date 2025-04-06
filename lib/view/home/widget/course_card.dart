import 'package:flutter/material.dart';
import '../../../widget/custom_text.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final double rate;
  final bool locked;

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.rate,
    required this.locked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(
                      image,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      locked ? Icons.lock : Icons.lock_open,
                      color: locked ? Colors.red : Colors.green,
                      size: 24,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: title,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          text: description,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 16),
                                const SizedBox(width: 4),
                                CustomText(text: rate.toString(), fontSize: 14),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '90 SAR',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.redAccent,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                CustomText(
                                  text: '30 SAR',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),


          Positioned(
            top: 0,
            left: 0,
            child: Transform.rotate(
              angle: -0.25, // Adjust for a tilted effect
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'خصم %70',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
