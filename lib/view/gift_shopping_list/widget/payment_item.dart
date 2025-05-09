import 'package:flutter/material.dart';



class PaymentItemWidget extends StatelessWidget {
  const PaymentItemWidget({super.key, required this.method, required this.date, required this.amount, required this.color, required this.logoPath});
final  String method;final String date;final String amount;final Color color;final String logoPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(logoPath, width: 50, height: 30),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(method, style: const TextStyle(color: Colors.white, fontSize: 16)),
              Text(date, style: const TextStyle(color: Colors.white38, fontSize: 12)),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
