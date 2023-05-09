import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ui_13/core/color.dart';
import 'package:ui_13/page/forgot_password.dart';
import 'package:ui_13/page/form_signup.dart';
import 'package:ui_13/widgets/bottom_nav.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
       const Padding(padding: EdgeInsets.only(top: 50.0),),
      Title(color: Colors.green,
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.green,
                ),
              ),
            ),
    SizedBox(
            height: 450,
            width: 450,
            child: Image.asset('assets/images/dangnhap.png'),
          ),
    TextFormField(
      decoration: const InputDecoration(
        labelText: 'Tài Khoản',
        prefixIcon: Icon(Icons.person_outline),
        border: OutlineInputBorder(),
      ),
    ),
    const SizedBox(height: 10),
    TextFormField(
      decoration: const InputDecoration(
        labelText: 'Mật Khẩu',
        prefixIcon: Icon(Icons.lock_outline),
        border: OutlineInputBorder(),
      ),
      obscureText: true,
    ),
    const SizedBox(height: 10),
     GestureDetector(
      onTap: () {
        Navigator.push(
            context,
       MaterialPageRoute(
       builder: (builder) => const BottomNavBar()));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 80.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Đăng Nhập',
          style: TextStyle(
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    ElevatedButton(
    onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
    },
  child: const Text('Tạo tài khoản'),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[200],
        onPrimary: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    const SizedBox(height: 25),
    TextButton(
      onPressed: () {
        Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
     );
      },
      child: Text(
        'Quên Mật Khẩu?',
        style: TextStyle(
          color: black.withOpacity(0.4),
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  ],
),
    );
  }
  }
