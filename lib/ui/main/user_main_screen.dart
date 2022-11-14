import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/ui/user/home/home_screen.dart';
import 'package:jahitkeeun/ui/user/pesanan/pesanan_screen.dart';
import 'package:jahitkeeun/ui/user/profil/profil_screen.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions = [
    HomeScreen(),
    PesananScreen(),
    ProfilScreen(),
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
            label: 'Beranda',
            icon: Icons.home,
          ),
          CustomBottomBarItems(
            label: 'Pesanan',
            icon: Icons.list,
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
