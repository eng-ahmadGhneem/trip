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
        backgroundColor: AppColor.dark,
        body: ConstData.screens[_currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      const Icon(Icons.fingerprint , size: 33,),
                      const SizedBox(height: 2),
                      _currentIndex == 0
                          ? Container(
                              width: 30,
                              height: 1,
                              color: AppColor.appColor,
                            )
                          : const SizedBox(height: 1),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const Icon(Icons.card_giftcard , size: 33,),
                      const SizedBox(height: 2),
                      _currentIndex == 1
                          ? Container(
                              width: 30,
                              height: 1,
                              color: AppColor.appColor,
                            )
                          : const SizedBox(height: 1),
                    ],
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const Icon(Icons.person,size: 33,),
                      const SizedBox(height: 2),
                      _currentIndex == 2
                          ? Container(
                              width: 30,
                              height: 2,
                              color: AppColor.appColor,
                            )
                          : const SizedBox(height: 1),
                    ],
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
