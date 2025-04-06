import 'package:trip/view/home/widget/course_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../../data/models/courses/courses_model.dart';
import '../../../widget/custom_text.dart';
import '../controller/home_controller.dart';

class HomePageContent extends StatefulWidget {
  HomePageContent({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {


  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        _currentIndex++;
        if (_currentIndex >= sliderItems.length) {
          _currentIndex = 0;
        }
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCarouselSlider(),
          const SizedBox(height: 16),
          // Align(
          //     alignment: Alignment.topRight,
          //     child: TextButton(onPressed: (){ Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const Categories(),
          //       ),
          //     );}, child: Text("جميع الأقسام",style: TextStyle(color: AppColor.dark),))),
          // _buildCourseCategories(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: _buildFeaturedCourses(),
          ),
        ],
      ),
    );
  }

  // Carousel slider
  Widget _buildCarouselSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: sliderItems.length,
              itemBuilder: (context, index) {
                final item = sliderItems[index];
                return _buildSliderItem(
                  item['title']!,
                  item['description']!,
                  item['image']!,
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  sliderItems.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index ? Colors.white : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Slider item
  Widget _buildSliderItem(String title, String description, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            left: 10,
            child: CustomText(
              text: title,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: CustomText(
              text: description,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedCourses() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: "الدورات المميزة",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: 1,
            itemBuilder: (context, index) {
              return _buildCourseCard(index);
            },
          ),
        ],
      ),
    );
  }

  // Featured Course Card
  Widget _buildCourseCard(int index) {
    final course = courses[index];

    return GestureDetector(
      onTap: () {

      },
      child: CourseCard(
        title: course['title'],
        description: course['description'],
        image: course['image'],
        rate: course['rate'],
        locked: course['locked'],
      ),
    );
  }
}
