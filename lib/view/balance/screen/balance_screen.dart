import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/balance_card.dart';
import '../widget/service_button.dart';


class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  InkWell(
                      onTap:(){
                      Get.back();
                      },
                      child: const Icon(Icons.arrow_back)),
                  const Spacer(),
                  const Text("الرصيد", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const BalanceCard(),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "ارسل هدية لإعادة تنشيط مكافآتك",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("الخدمات", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(child: ServiceButton(title: "المعاملات", icon: Icons.receipt_long)),
                  SizedBox(width: 10),
                  Expanded(child: ServiceButton(title: "المساعدات والملاحظات", icon: Icons.support_agent)),
                ],
              ),
            ),
            const Spacer(),
            const Center(child: Text("سحب", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
