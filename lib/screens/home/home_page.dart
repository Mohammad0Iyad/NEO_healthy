import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:neo/screens/home/widgets/about_us.dart';
import 'package:neo/screens/home/widgets/drawepage/body.dart';
import 'package:neo/screens/home/widgets/g_view.dart';
import 'package:neo/screens/home/widgets/upload.dart';

import 'widgets/appbarpage/body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 0);

  int maxCount = 3;
  final List<Widget> bottomBarPages = [
    const AboutUs(),
    const GView(),
    const UploadProfile(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMain(),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              notchColor: Colors.transparent,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Color.fromARGB(255, 134, 240, 105),
                  ),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.list_alt_rounded,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.list_rounded,
                    color: Color.fromARGB(255, 134, 240, 105),
                  ),
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 134, 240, 105),
                  ),
                ),
              ],
              onTap: (index) {
                /// control your animation using page controller
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
      drawer: Pagedrawer(),
    );
  }
}
