import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';

class TailorMainScreen extends StatefulWidget {
  const TailorMainScreen({Key? key}) : super(key: key);

  @override
  State<TailorMainScreen> createState() => _TailorMainScreenState();
}

class _TailorMainScreenState extends State<TailorMainScreen> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = [
    Text('home'),
    Text('2'),
    Text('3'),
    Text('4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: mainColor,
        unSelectedColor: lightColor,
        backgroundColor: darkColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Jasa',
            icon: Icons.list,
          ),
          CustomBottomBarItems(
            label: 'Pesanan',
            icon: Icons.task,
          ),
          CustomBottomBarItems(
            label: 'Profil',
            icon: Icons.person,
          ),
        ],
      ),
    );
  }
}
