import 'package:flutter/material.dart';
import 'package:trip/core/constant/color.dart';
import 'package:trip/core/constant/const_data.dart';

class CustomBottomNavigationWidget extends StatefulWidget {
  const CustomBottomNavigationWidget({super.key});

  @override
  State<CustomBottomNavigationWidget> createState() =>
      _CustomBottomNavigationWidgetState();
}

class _CustomBottomNavigationWidgetState
    extends State<CustomBottomNavigationWidget> {
  int _currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstData.screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Colors.black,
            selectedItemColor: AppColor.appColor,
            unselectedItemColor: AppColor.appColor,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    const Icon(Icons.fingerprint),
                    const SizedBox(height: 4),
                    _currentIndex == 0
                        ? Container(
                            width: 20,
                            height: 3,
                            color: AppColor.appColor,
                          )
                        : const SizedBox(height: 3),
                  ],
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    const Icon(Icons.card_giftcard),
                    const SizedBox(height: 4),
                    _currentIndex == 1
                        ? Container(
                            width: 20,
                            height: 3,
                            color: AppColor.appColor,
                          )
                        : const SizedBox(height: 3),
                  ],
                ),
                label: 'الهدايا',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(height: 4),
                    _currentIndex == 2
                        ? Container(
                            width: 20,
                            height: 3,
                            color: AppColor.appColor,
                          )
                        : const SizedBox(height: 3),
                  ],
                ),
                label: 'الملف الشخصي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
