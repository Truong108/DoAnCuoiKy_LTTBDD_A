import 'package:demo_doan_flutter/src/const/app_colors.dart';
import 'package:demo_doan_flutter/src/const/app_font.dart';
import 'package:demo_doan_flutter/src/data/model/cart.dart';
import 'package:demo_doan_flutter/src/router/router_path.dart';
import 'package:demo_doan_flutter/src/viewmodel/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_item.dart';

class CartScroll extends StatelessWidget {
  final List<Cart> listCart;
  const CartScroll({Key? key, required this.listCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context, listen: true);
    int priceShip = 26;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextHeader(title: "Địa chỉ giao hàng"),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.1),
                        blurRadius: 4,
                        spreadRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Nguyễn Xuân Trường",
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
                                fontSize: 12,
                                color: AppColors.primaryColorRed),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "0326216612",
                      style: AppFont.regular.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "9/2 Miếu Bình Đông",
                      style: AppFont.regular.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(0.0),
                itemCount: listCart.length,
                itemBuilder: (_, index) {
                  Cart order = listCart[index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (value) {
                      cartViewModel.removeCart(index);
                    },
                    background: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    child: CartItem(
                      order: order,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  buildTextHeader(title: "Chi Trả"),
                  Spacer(),
                  Text(
                    "Số Tiền",
                    style: AppFont.regular.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: AppColors.primaryColorRed),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    "Đơn hàng",
                    style: AppFont.medium.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: AppColors.primaryColorGray),
                  ),
                  Spacer(),
                  Text(
                    "${cartViewModel.total} Đồng",
                    style: AppFont.semiBold.copyWith(
                      fontWeight: FontWeight.w600,
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
                    "Phí Vận chuyển",
                    style: AppFont.medium.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: AppColors.primaryColorGray),
                  ),
                  Spacer(),
                  Text(
                    "$priceShip Đồng",
                    style: AppFont.semiBold.copyWith(
                      fontWeight: FontWeight.w600,
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
                    "Tổng Cộng",
                    style: AppFont.medium.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColors.primaryColorGray),
                  ),
                  Spacer(),
                  Text(
                    "${cartViewModel.total + priceShip} Đồng",
                    style: AppFont.semiBold.copyWith(
                      fontWeight: FontWeight.w600,

                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tổng Cộng",
                    style: AppFont.medium.copyWith(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${cartViewModel.total + priceShip} Đồng",
                    style: AppFont.semiBold
                        .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColorRed,
                      textStyle: AppFont.medium.copyWith(
                      fontSize: 15, fontWeight: FontWeight.normal)),
                  onPressed: (){
                    cartViewModel.checkOutCart();
                    Navigator.pushNamed(context, OrderSuccessScreens);
                  },
                  child: Text('Thanh Toán'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextHeader({required String title}) {
    return Text(
      title,
      style:
      AppFont.semiBold.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
    );
  }
}
