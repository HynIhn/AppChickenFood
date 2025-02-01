import 'package:ChickenFood/page/home_page.dart';
import 'package:ChickenFood/page/my_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../Theme/color_themes.dart';
import '../auth/utils/preference_helper.dart';
import '../components/animation_page.dart';
import '../components/my_InfoCard.dart';
import '../components/my_button.dart';

class FindMorePage extends StatefulWidget {
  const FindMorePage({super.key});

  @override
  State<FindMorePage> createState() => _FindMorePage();
}

class _FindMorePage extends State<FindMorePage> {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _codeController = TextEditingController();
  ValueNotifier<bool> isCodeNotifier =
  ValueNotifier(false); // Khai báo ValueNotifier

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_codeController.dispose();
    isCodeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return SafeArea(
      top: false,
      child: Scaffold(
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
                'Luôn phục vụ bạn',
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
        backgroundColor: Colors.white,
        body: Stack(
            children: [
              // Main content
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: keyboardHeight),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  print('object');
                                },
                                  child: buildUserInfoCard()),
                                UtilitySection(
                                  title: 'Tìm hiểu thêm',
                                  buttons: [
                                    UtilityButton(
                                      color: mainColor,
                                      title: 'Góp ý',
                                      icon: Icons
                                          .local_post_office,
                                      onPressed: () {},
                                    ),
                                    UtilityButton(
                                      color: mainColor,
                                      title: 'Thực đơn',
                                      icon: Icons
                                          .menu_book, // Đổi thành icon phù hợp với "Trung tâm tài khoản"
                                      onPressed: () {},
                                    ),
                                    UtilityButton(
                                      color: mainColor,
                                      title: 'Liên hệ',
                                      icon: Icons
                                          .perm_phone_msg, // Đổi thành icon phù hợp với "Trung tâm tài khoản"
                                      onPressed: () {},
                                    ),
                                    UtilityButton(
                                      color: mainColor,
                                      title: 'FAQ',
                                      icon: Icons
                                          .contact_support,
                                      onPressed: () {},
                                    ),
                                    UtilityButton(
                                      color: mainColor,
                                      title: 'Điều khoản & dịch vụ',
                                      icon: Icons
                                          .account_circle_outlined, // Đổi thành icon phù hợp với "Trung tâm tài khoản"
                                      onPressed: () {},
                                    ),
                                    UtilityButton(
                                      color: mainColor,
                                      title: 'Về chúng tôi',
                                      icon: Icons
                                          .groups,
                                      onPressed: () {},
                                    ),
                                    UtilityButton(title: 'Chế độ và ngôn ngữ',
                                      icon: Icons.public,
                                        onPressed: (){}, color: mainColor,
                                      isExpandable: true,
                                    expandedItems: [
                                      UtilityButton(
                                        trailingIconType: TrailingIconType.toggle,
                                        color: mainColor,
                                        title: 'Chế độ tối',
                                        icon: Icons
                                            .nightlight_round, // Đổi thành icon phù hợp với "Chế độ tối"
                                        onPressed: () {},
                                      ),
                                      UtilityButton(
                                        trailingIconType: TrailingIconType
                                            .toggle, // Sử dụng kiểu toggle cho icon phía sau
                                        color:
                                        mainColor, // Màu của icon và toggle
                                        title: 'Ngôn ngữ', // Tiêu đề của nút
                                        icon: Icons
                                            .translate, // Đổi thành icon phù hợp với "Ngôn ngữ"
                                        isToggled: true,
                                        onPressed: () {
                                          print("Nút 'Ngôn ngữ' đã được nhấn");
                                        },
                                        onToggleChanged: (bool newState) {
                                          print(
                                              "Trạng thái toggle đã thay đổi: $newState");
                                        },
                                      ),
                                    ],),
                                    // UtilityButton(
                                    //   color: mainColor,
                                    //   trailingIconType: TrailingIconType.none,
                                    //   title: 'Đăng xuất',
                                    //   icon: Icons
                                    //       .exit_to_app, // Đổi thành icon phù hợp với "Đăng xuất"
                                    //   onPressed: () {
                                    //     showDialog(
                                    //       context: context,
                                    //       builder: (BuildContext context) {
                                    //         return AlertDialog(
                                    //           title: const Text(
                                    //               'Xác nhận đăng xuất'),
                                    //           content: const Text(
                                    //               'Bạn có muốn đăng xuất không?'),
                                    //           actions: <Widget>[
                                    //             TextButton(
                                    //               onPressed: () {
                                    //                 // Hành động khi người dùng nhấn "Không"
                                    //                 Navigator.of(context)
                                    //                     .pop(); // Đóng hộp thoại
                                    //               },
                                    //               child: const Text('Hủy'),
                                    //             ),
                                    //             TextButton(
                                    //               onPressed: () async {
                                    //                 Navigator.pushAndRemoveUntil(
                                    //                   context,
                                    //                   SlideFromLeftPageRoute(
                                    //                       page: HomePage()),
                                    //                       (Route<dynamic> route) =>
                                    //                   false, // Xóa tất cả các route trước đó
                                    //                 );
                                    //               },
                                    //               child: const Text(
                                    //                 'Đăng xuất',
                                    //                 style: TextStyle(
                                    //                     color: Colors.red),
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         );
                                    //       },
                                    //     );
                                    //   },
                                    // ),
                                  ],
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyButton(
                                  showIcon: true,
                                  text: 'Đăng xuất',
                                  color: mainColor,
                                  isBold: true,
                                  fontsize: 18,
                                  paddingText: 18,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Xác nhận đăng xuất'),
                                          content: const Text(
                                              'Bạn có muốn đăng xuất không?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                // Hành động khi người dùng nhấn "Không"
                                                Navigator.of(context)
                                                    .pop(); // Đóng hộp thoại
                                              },
                                              child: const Text('Hủy'),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  SlideFromLeftPageRoute(
                                                      page: MyHomePage()),
                                                      (Route<dynamic> route) =>
                                                  false,
                                                   //await AuthPrefsHelper.clearAuth();// Xóa tất cả các route trước đó
                                                );
                                                // Clear authentication tokens

                                              },
                                              child: const Text(
                                                'Đăng xuất',
                                                style:
                                                TextStyle(color: Colors.red),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Các phần tử cố định ở cuối màn hình
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget buildUserInfoCard() {
    // Hàm để format số điện thoại từ int thành String
    String formatPhoneNumber(int? phoneNumber) {
      if (phoneNumber == null) return '';

      // Chuyển đổi số điện thoại thành String và thêm số 0 ở đầu
      String phoneString = '0$phoneNumber';

      // Sử dụng RegExp để thêm dấu chấm giữa các nhóm số
      return phoneString.replaceAllMapped(
        RegExp(r'(\d{3})(\d{3})(\d{3,})'),
            (Match match) => '${match[1]}.${match[2]}.${match[3]}',
      );
    }

    return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
    color: Color(0xFFFFC96F),
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
    BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 6,
    offset: const Offset(0, 3),
    ),
    ],
    ),
    child: Row(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: Image.asset(
            'assets/images/hyn.jpg',
            width: 90,
            fit: BoxFit.fitWidth,// Đảm bảo hình ảnh lấp đầy khung
          ),
        ),
      ),
    const SizedBox(width: 10),
    const Expanded(
    child: Column(
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text(
    'Hyn đây zồi :>',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white),
    ),
    Text('hnhi091204@gmail.com',
      style: TextStyle(
          color: Colors.white),),
    ],
    ),
    ),
    const Icon(
    Icons.keyboard_arrow_right_outlined, color: Colors.white),
    ],
    ),
          // Row(
          //   children: [
          //     // Bên trái chứa icon QR và text Trang cá nhân
          //     Expanded(
          //       child: Container(
          //         padding:
          //         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //         decoration: BoxDecoration(
          //           color: Colors.grey[200], // Màu nền xám
          //           borderRadius: const BorderRadius.only(
          //             topLeft: Radius.circular(0),
          //             topRight: Radius.circular(20),
          //             bottomRight: Radius.circular(20),
          //             bottomLeft: Radius.circular(0),
          //           ),
          //         ),
          //         child: InkWell(
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               SlideFromRightPageRoute(
          //                 page: HomePage(),
          //               ),
          //             );
          //           },
          //           child: const Row(
          //             mainAxisAlignment:
          //             MainAxisAlignment.center, // Căn giữa nội dung
          //             children: [
          //               Icon(Icons.qr_code, color: Colors.blue),
          //               SizedBox(width: 8),
          //               Text('Trang cá nhân'),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //     // Spacer để tạo khoảng cách giữa 2 phần
          //     const SizedBox(width: 8),
          //
          //     // Bên phải chứa @username
          //     Expanded(
          //       child: Container(
          //         padding:
          //         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //         decoration: BoxDecoration(
          //           color: Colors.grey[200], // Màu nền xám
          //           borderRadius: const BorderRadius.only(
          //             topLeft: Radius.circular(20),
          //             topRight: Radius.circular(0),
          //             bottomRight: Radius.circular(0),
          //             bottomLeft: Radius.circular(20),
          //           ),
          //         ),
          //         child: Row(
          //           mainAxisAlignment:
          //           MainAxisAlignment.center, // Căn giữa nội dung
          //           children: [
          //             Text('@',
          //                 style: TextStyle(color: Colors.grey)),
          //             SizedBox(width: 8),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
      );
  }
}
