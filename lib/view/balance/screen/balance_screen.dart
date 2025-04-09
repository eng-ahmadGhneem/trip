import 'package:flutter/material.dart';

import '../widget/balance_card.dart';
import '../widget/service_button.dart';


class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back),
                    Spacer(),
                    Text("الرصيد", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 12),
              BalanceCard(),
              SizedBox(height: 8),
              Center(
                child: Text(
                  "ارسل هدية لإعادة تنشيط مكافآتك",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("الخدمات", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(child: ServiceButton(title: "المعاملات", icon: Icons.receipt_long)),
                    SizedBox(width: 10),
                    Expanded(child: ServiceButton(title: "المساعدات والملاحظات", icon: Icons.support_agent)),
                  ],
                ),
              ),
              Spacer(),
              Center(child: Text("سحب", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
