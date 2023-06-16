// // import 'package:demo_doan_flutter/src/view/screen/login_screen.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// // import 'package:provider/provider.dart';

// // import '../../const/app_colors.dart';
// // import '../../const/app_font.dart';
// // import '../../viewmodel/auth_viemodel.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';

import '../../const/app_font.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isShowPass = false;

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Future<void> signUpUser() async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      final user = userCredential.user;
      await firestore.collection('users').doc(user?.uid).set({
        'userId': user?.uid,
        'userEmail': user?.email,
      });
      Navigator.pop(context);
    } catch (error) {
      print('Lỗi khi đăng ký tài khoản hoặc lưu thông tin người dùng: $error');
    }
  }

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
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Đăng Ký",
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
                  height: 10,
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
                    onPressed: signUpUser,
                    child: Text(
                      "Đăng Ký".toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 70,
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
