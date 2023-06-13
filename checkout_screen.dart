import 'package:demo_doan_flutter/src/const/app_colors.dart';
import 'package:demo_doan_flutter/src/const/app_font.dart';
import 'package:demo_doan_flutter/src/router/router_path.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Checkout",
          style: AppFont.semiBold.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextHeader(title: "Địa chỉ giao hàng"),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(2, 2),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Trường",
                        style: AppFont.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, ChoiceAddressScreens);
                        },
                        child: Text(
                          "Thay đổi",
                          style: AppFont.regular.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: AppColors.primaryColorRed),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "0326216612",
                    style: AppFont.regular.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "9/2 Miếu Bình Đông",
                    style: AppFont.regular.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Phuong Bình Hưng Hoà A quận Bình Tân",
                    style: AppFont.medium.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                buildTextHeader(title: "Chi Trả"),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "Thay đổi",
                    style: AppFont.regular.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: AppColors.primaryColorRed),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Đặt hàng",
                  style: AppFont.medium.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: AppColors.primaryColorGray),
                ),
                Spacer(),
                Text(
                  "110.000 đồng",
                  style: AppFont.semiBold.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Vận chuyển",
                  style: AppFont.medium.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: AppColors.primaryColorGray),
                ),
                Spacer(),
                Text(
                  "210.000 đồng",
                  style: AppFont.semiBold.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Bản tóm tắt",
                  style: AppFont.medium.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.primaryColorGray),
                ),
                Spacer(),
                Text(
                  "320.000 đồng",
                  style: AppFont.semiBold.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              height: 49,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColorRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                    textStyle: AppFont.medium.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),),
                onPressed: () => Navigator.pushNamed(context, OrderSuccessScreens),
                child: Text('Gửi đơn đặt hàng'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextHeader({required String title}) {
    return Text(
      title,
      style:
          AppFont.semiBold.copyWith(fontWeight: FontWeight.bold, fontSize: 17),
    );
  }
}
