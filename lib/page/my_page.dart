import 'package:ChickenFood/Theme/color_themes.dart';
import 'package:ChickenFood/page/disscount_page.dart';
import 'package:ChickenFood/page/home_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  bool _isLoading = true;
  final ValueNotifier<double> _scrollNotifier = ValueNotifier<double>(0.0);
  final double _maxBottomNavHeight = 50.0;

  @override
  void initState() {
    super.initState();
    // Chờ 3 giây trước khi tắt loading
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _page,
        children: [
          HomePage(),
          DiscountPage(),
        ],
      ),
      bottomNavigationBar: _buildAnimatedBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar(double navBarHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_navigatorItems.length, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _page = index; // Cập nhật trang hiện tại
            });
            print(index);
          },
          child: _navigatorItems[index],
        );
      }),
    );
  }


  List<Widget> get _navigatorItems {
    return [
      _buildNavItem(Icons.home, 'Trang chủ', 0,),
      _buildNavItem(Icons.local_offer, 'Khuyến mãi', 1,),
      _buildNavItem(Icons.delivery_dining, 'Giao hàng', 2,),
      _buildNavItem(Icons.location_on, 'Nhà hàng', 3),
      _buildNavItem(Icons.person, 'Tôi', 4,),
    ];
  }

  Widget _buildAnimatedBottomNavBar() {
    return ValueListenableBuilder<double>(
      valueListenable: _scrollNotifier,
      builder: (context, scrollValue, child) {
        double navBarHeight =
        (_maxBottomNavHeight - scrollValue).clamp(0.0, _maxBottomNavHeight);
        return AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: navBarHeight,
          child: navBarHeight > 0
              ? FractionallySizedBox(
            heightFactor: navBarHeight / _maxBottomNavHeight,
            child: _buildBottomNavBar(
                navBarHeight), // Truyền chiều cao vào đây
          )
              : SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = index == _page;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.symmetric(vertical: isSelected ? 8.0 : 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isSelected ? 20 : 18, // Zoom icon khi được chọn
            color: isSelected ? mainColor : Color(0xFFFFC96F),
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isSelected ? 10 : 8, // Zoom text khi được chọn
              color: isSelected ? mainColor : Color(0xFFFFC96F),
            ),
          ),
        ],
      ),
    );
  }
}