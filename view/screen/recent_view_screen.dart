import 'package:demo_doan_flutter/src/const/app_font.dart';
import 'package:demo_doan_flutter/src/data/model/product.dart';
// import 'package:demo_doan_flutter/src/view/screen/component/carttab/cart_item.dart';
import 'package:demo_doan_flutter/src/view/screen/component/hometab/cart_product.dart';
import 'package:flutter/material.dart';

class RecentViewScreen extends StatelessWidget {
  final List<Product>? listRecentProduct;

  const RecentViewScreen({Key? key, this.listRecentProduct}) : super(key: key);

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
          "Sản Phẩm Xem Gần Đây",
          style: AppFont.semiBold.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(0.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 55/140),
        itemCount: listRecentProduct?.length,
        itemBuilder: (_, index) {
          Product? product = listRecentProduct![index];
          return CartProduct(
            product: product,
          );
        },
      ),
    );
  }
}
