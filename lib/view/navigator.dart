import 'package:appstore_shoe/utils/constants.dart';
import 'package:appstore_shoe/view/bag/bag_view.dart';
import 'package:appstore_shoe/view/user_profile/user_profile_view.dart';
import 'package:appstore_shoe/view/view.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // _pageController.jumpToPage(_selectedIndex);
    _pageController.animateToPage(
      _selectedIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _screens = [
    const HomeView(),
    const BagView(),
    const UserProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 27.0,
        bubbleCurve: Curves.fastLinearToSlowEaseIn,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: const Color(0xffacacac),
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: <CustomNavigationBarItem>[
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.shopping_cart),
          ),
          CustomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
