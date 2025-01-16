import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../Theme/color_themes.dart';
import '../components/animation_page.dart';
import 'my_page.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  int _page = 1;

  final List<Map<String, String>> rewards = [
    {
      'image': 'assets/images/postersale2.jpg',
      'title': 'Loyalty - 1 Set 3 bao lì xì Tết Ất Tỵ',
      'points': '1000 điểm',
    },
    {
      'image': 'assets/images/postersale.jpg',
      'title': 'Loyalty - Miễn Phí 1 Đồ Chơi Bất Kỳ',
      'points': '250 điểm',
    },
    {
      'image': 'assets/images/postersale2.jpg',
      'title': 'Loyalty - Phiếu Giảm Giá 50%',
      'points': '500 điểm',
    },
    {
      'image': 'assets/images/postersale.jpg',
      'title': 'Loyalty - Miễn Phí 1 Đồ Chơi Bất Kỳ',
      'points': '250 điểm',
    },
    {
      'image': 'assets/images/postersale2.jpg',
      'title': 'Loyalty - Phiếu Giảm Giá 50%',
      'points': '500 điểm',
    },
  ];

  final List<Map<String, dynamic>> discounts = [
    {
      'image': 'assets/images/postersale2.jpg',
      'title': 'Chicken Day - Mua 2 Tặng 2 Gà rán',
      'description': 'Hạn sử dụng 31-12-2025',
      'status': 'Hiện không có sẵn',
    },
    {
      'image': 'assets/images/postersale2.jpg',
      'title': '[Ưu Đãi Thứ Năm] Mua 1 EVM Tặng 1 Cheeseburger',
      'description': 'Hạn sử dụng 31-12-2025',
      'status': '',
    },
    {
      'image': 'assets/images/postersale2.jpg',
      'title': 'Chicken Day - Mua 2 Tặng 2 Gà rán',
      'description': 'Hạn sử dụng 31-12-2025',
      'status': 'Hiện không có sẵn',
    },
    {
      'image': 'assets/images/postersale2.jpg',
      'title': '[Ưu Đãi Thứ Năm] Mua 1 EVM Tặng 1 Cheeseburger',
      'description': 'Hạn sử dụng 31-12-2025',
      'status': '',
    },
  ];

  Widget _buildSectionHeader(String title, Widget page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              SlideFromRightPageRoute(page: page),
            );
          },
          child: const Text(
            'Xem tất cả',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: mainColor,
              color: mainColor,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRewardSection() {
    return SizedBox(
      height: 100, // Chiều cao tổng thể của phần thưởng
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: rewards.length,
        itemBuilder: (context, index) {
          final reward = rewards[index];
          return GestureDetector(
            onTap: () {
              // Tạo hiệu ứng "slide" cho phần thưởng
              Navigator.push(
                context,
                SlideFromRightPageRoute(page: MyHomePage()), // Chuyển hướng đến trang khác
              );
            },

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
            width: 220,
            child: RewardCard(
                image: reward['image']!,
                title: reward['title']!,
                points: reward['points']!,
              ),),
          )
          );
        },
      ),
    );
  }

  Widget _buildDiscountSection() {
    return ListView.builder(
      shrinkWrap: true, // Để ListView.builder hoạt động bên trong SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn độc lập
      itemCount: discounts.length,
      itemBuilder: (context, index) {
        final discount = discounts[index];
        return
           Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: 300,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14), // Bo góc ảnh
                    child: Image.asset(
                      discount['image'], // Đường dẫn ảnh
                      height: 120,
                      width: double.infinity, // Đảm bảo ảnh full width
                      fit: BoxFit.cover, // Điều chỉnh hiển thị ảnh
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    discount['title'],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    discount['description'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
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
              'Khao bạn khuyến mãi',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.yellow[800],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: const [
                      Icon(Icons.qr_code, size: 100, color: Colors.black),
                      SizedBox(height: 3),
                      Text(
                        'M 423 624',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 3),
                      Text(
                        'Quét mã để tích điểm.',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildSectionHeader('Phần thưởng', const MyHomePage()),
              _buildRewardSection(),
              const SizedBox(height: 16),
              Text(
                'Ưu đãi',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              _buildDiscountSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final String image;
  final String title;
  final String points;

  const RewardCard({
    required this.image,
    required this.title,
    required this.points,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(image,
              height: 80, // Chiều cao của hình ảnh
              width: 80, // Chiều rộng của hình ảnh
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(points,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}