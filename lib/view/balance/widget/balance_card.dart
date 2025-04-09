import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage("assets/images/balance_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // ======= Top row =======
           Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side: الحصول على عملات
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios, size: 10, color: AppColor.white),
                    const SizedBox(width: 4),
                    Text(
                      "الحصول على عملات",
                      style: TextStyle(color: AppColor.white, fontSize: 10),
                    ),
                  ],
                ),

                // Right side: البصمات 0 + بصمة
                Row(
                  children: [
                    Text(
                      "البصمات",
                      style: TextStyle(color: AppColor.white, fontSize: 12),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "0",
                      style: TextStyle(color: AppColor.white, fontSize: 12),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.fingerprint, size: 14, color: AppColor.appColor),
                  ],
                ),
              ],
            ),
          ),

          // ======= Divider =======
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Container(height: 0.5, color: Colors.white30),
          ),

          // ======= Bottom content =======
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left arrow
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.arrow_back_ios, size: 14, color: AppColor.white),
                ),

                // "غير ذلك"
                 Expanded(
                  child: Center(
                    child: Text(
                      "غير ذلك",
                      style: TextStyle(color: AppColor.white, fontSize: 12),
                    ),
                  ),
                ),

                // Vertical Divider
                Container(
                  height: 30,
                  width: 0.5,
                  color: AppColor.white,
                ),

                // "مكافآت LIVE" and amount
                 Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "مكافآت LIVE",
                          style: TextStyle(color: AppColor.white, fontSize: 12),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "0.00 ر.س.",
                          style: TextStyle(color: AppColor.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),

                // Right arrow
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.arrow_forward_ios, size: 14, color: AppColor.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
