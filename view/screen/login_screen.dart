
// import 'package:demo_doan_flutter/src/const/app_colors.dart';
// import 'package:demo_doan_flutter/src/const/app_font.dart';
// import 'package:demo_doan_flutter/src/router/router_path.dart';
// import 'package:demo_doan_flutter/src/view/screen/sign_up_screen.dart';
// import 'package:demo_doan_flutter/src/viewmodel/auth_viemodel.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../viewmodel/auth_viemodel.dart';// Thay thế bằng đường dẫn tới file auth_view_model.dart của ứng dụng


import 'package:demo_doan_flutter/src/view/screen/dash_board_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_doan_flutter/src/view/screen/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/app_font.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isShowPass = false;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                      },
                      padding: EdgeInsets.all(0.0),
                      alignment: Alignment.center,
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 50,
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red, 
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                  Text(
                    "Đăng Nhập",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Email",
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.2),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passController,
                    obscureText: !isShowPass,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Mật Khẩu",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowPass = !isShowPass;
                          });
                        },
                        child: Icon(
                          isShowPass ? Icons.visibility : Icons.visibility_off,
                          size: 16,
                        ),
                      ),
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
               SizedBox(
  width: double.infinity,
  height: 50,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
    ),
    onPressed: () async {
      try {
        final email = emailController.text;
        final password = passController.text;

        final UserCredential userCredential =
            await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        final userDoc = await firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();
        final userData = userDoc.data() as Map<String, dynamic>;

        print('Email: ${userData['email']}');
        print('Tên: ${userData['name']}');

        // Chuyển đến trang HomeTab
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeTab()),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => DashBoardScreen()),
        );
      } catch (error) {
        print('Đăng nhập không thành công: $error');
      }
    },
    child: Text(
      "Đăng Nhập".toUpperCase(),
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
    ),
  ),
),

                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SignUpScreen()),
                    );
                  },
                  child: Text(
                    "Chưa có tài khoản?  Đăng ký",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                    ),
                  ),
                ),
                 SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    'Hoặc',
                    style: AppFont.medium.copyWith(
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.1),
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/image/ic_google.svg',
                          width: 10,
                          height: 10,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 65,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.1),
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          'assets/image/ic_fb.svg',
                          width: 10,
                          height: 10,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
   
