import 'package:ChickenFood/Theme/color_themes.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  final ValueNotifier<double> _scrollNotifier = ValueNotifier<double>(0.0);
  final double _maxBottomNavHeight = 100.0;

  void _onItemTapped(int index) {
    setState(() {
      _page = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.skip_next, color: Colors.white, size: 24),
            // Đồng bộ kích thước
            const SizedBox(width: 8),
            // Khoảng cách giữa icon và text
            Text(
              'Gà giòn cho bạn',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Lato',
              ),
            ),

          ],
        ),
        centerTitle: false, // Căn lề trái cho title
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag, color: Colors.white,),
            onPressed: () {
              print('Giỏ hàng');
              // Hành động khi nhấn nút search
            },
          ),

        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 3),
                Image.asset(
                  'assets/images/postersale.jpg',
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/postersale2.jpg',
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
          Positioned(
            bottom: -10, // Đảm bảo button luôn nằm dưới cùng
            left: 0,
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Nhập mã khuyến mãi',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: Text('Hủy'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            // Xử lý mã khuyến mãi ở đây
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 30),
                // Chiều rộng vô hạn và chiều cao cố định
                side: BorderSide.none,
                // Loại bỏ border
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Góc vuông
                ),
                backgroundColor: Colors.yellow, // Màu nền
              ),
              child: const Text(
                'Nhập mã khuyến mãi tại đây ➦',
                style: TextStyle(color: Colors.black, fontFamily: 'Lato'),
              ),
            ),
          ),
        ],
      ),
    );
  }



}