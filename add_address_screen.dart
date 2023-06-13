import 'package:demo_doan_flutter/src/const/app_colors.dart';
import 'package:demo_doan_flutter/src/const/app_font.dart';
import 'package:demo_doan_flutter/src/data/model/address.dart';
import 'package:demo_doan_flutter/src/view/screen/component/addaddress/text_field_address.dart';
import 'package:demo_doan_flutter/src/viewmodel/address_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class AddAddressScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressDetailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final addressViewModel = Provider.of<AddressViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Thêm địa chỉ giao hàng",
          style: AppFont.semiBold.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFieldAddress(
              textEditingController: nameController,
              lableText: "Họ Tên Đầy Đủ",
            ),
            SizedBox(
              height: 18,
            ),
            TextFieldAddress(
              textEditingController: phoneController,
              lableText: "Số Điện Thoại",
            ),
            SizedBox(
              height: 18,
            ),
            TextFieldAddress(
              textEditingController: addressDetailController,
              lableText: "Địa chỉ",
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
                  ),
                ),
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      addressDetailController.text.isNotEmpty) {
                    addressViewModel.addAddress(Address(
                      id: "",
                      userName: nameController.text,
                      phone: phoneController.text,
                      addressTitle1: addressDetailController.text,
                      addressTitle2: "",
                    ));
                    Navigator.of(context).pop(); 
                  } else {
                    Fluttertoast.showToast(msg: "Vui lòng điền đầy đủ thông tin");
                  }
                },
                child: Text('Lưu Địa Chỉ'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
