// import 'dart:math';
import 'dart:ui';

// import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_doan_flutter/src/const/app_colors.dart';
import 'package:demo_doan_flutter/src/const/app_font.dart';
import 'package:demo_doan_flutter/src/data/model/inventory.dart';
import 'package:demo_doan_flutter/src/data/model/product.dart';
// import 'package:demo_doan_flutter/src/router/router_path.dart';
// import 'package:demo_doan_flutter/src/viewmodel/auth_viemodel.dart';
import 'package:demo_doan_flutter/src/viewmodel/cart_viewmodel.dart';
import 'package:demo_doan_flutter/src/viewmodel/choice_chip.dart';
import 'package:demo_doan_flutter/src/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatefulWidget {
  final Product? product;

  const DetailProductScreen({Key? key, this.product}) : super(key: key);

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {

  List<String> listImage = [
   'https://www.huongnghiepaau.com/wp-content/uploads/2020/09/nguoi-viet-ngay-cang-chuong-healthy-food.jpg',
   'https://st4.depositphotos.com/2580781/30307/i/1600/depositphotos_303072166-stock-photo-ingredients-for-the-healthy-foods.jpg',
   'https://www.huongnghiepaau.com/wp-content/uploads/2020/08/thuc-don.png.jpg'
  ];
  Inventory? inventory = Inventory();

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context,listen: true);
    // final authViewModel = Provider.of<AuthViewModel>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
         widget.product!.title!,
          style: AppFont.semiBold,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart_outlined, color: Colors.black),
                Positioned(
                  top: -5,
                  right: -2,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColorRed,
                    ),
                    child: Text(
                      cartViewModel.productCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 330,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  enlargeCenterPage: false,
                ),
                items: listImage
                    .map((e) => Image.network(
                          e,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.product!.title!,
                            style: AppFont.bold.copyWith(fontSize: 23),
                          ),
                        ),
                        Text(
                          widget.product!.price.toString(),
                          style: AppFont.bold.copyWith(fontSize: 23),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.product!.category!,
                      style: AppFont.regular.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 5,
                          direction: Axis.horizontal,
                          itemSize: 15,
                          itemCount: 5,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('(7)')
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Hình ảnh khám phá khoa học về một số loại quả giúp bộ xung phần hình ảnh cho giáo án",
                      style: AppFont.regular.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 1.4,
                          letterSpacing: .2,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        "Xếp hạng và Đánh giá",
                        style: AppFont.bold.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "4.5/5",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Builder(
        builder: (BuildContext ctx) {
          return Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.2),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(2, -2),
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primaryColorRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                onPressed: () {
                  showChooseSize(ctx,widget.product);
                },
                child: Text(
                  "Thêm vào giỏ hàng".toUpperCase(),
                  style: AppFont.medium
                      .copyWith(fontSize: 17, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

   showChooseSize(BuildContext ctx,Product? product){
     return  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        ProductViewModel productViewModel = ProductViewModel(); 
        // ignore: unused_local_variable
        ProductViewModel productViewModel2 = ProductViewModel();
        // ignore: unused_local_variable
        String select = '';
        Inventory?  a;
        return StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
              color: Color(0xffF9F9F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                ListView(
                  children: [
                    Text(
                      "Chọn Thưc Phẩm",
                      style: AppFont.semiBold
                          .copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, bottom: 15),
                              child: ChangeNotifierProvider.value(
                                value: productViewModel,
                                child: Consumer<ProductViewModel>(
                                  builder: (BuildContext context, productVM, Widget? child) {
                                    return ChoiceOption(
                                      listSize: product!.inventory!.map((e) => e.size!).toSet().toList(),
                                      onSelectCallBack: (value) {
                                        var size = product.inventory!.firstWhere((element) => element.size == value);
                                        // ignore: unnecessary_null_comparison
                                        if(size != null){
                                          inventory?.size = size.size;
                                          print(inventory?.size);
                                        }
                                        var  a  =  product.inventory?.firstWhere((element) => element.color == inventory?.color && element.size == inventory?.size,orElse: ()=> Inventory() );
                                        if(a?.id != null){
                                          print('ok');
                                        }else{
                                          Fluttertoast.showToast(msg: "Thực Phẩm này hết!");
                                        }
                                      },
                                    );
                                  },
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Số Lượng",
                      style: AppFont.semiBold
                          .copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 15, bottom: 15),
                              child: ChangeNotifierProvider.value(
                                value: productViewModel,
                                child: Consumer<ProductViewModel>(
                                  builder: (BuildContext context, productVM, Widget? child) {
                                    return ChoiceOption(
                                      listSize: product!.inventory!.map((e) => e.color!).toSet().toList(),
                                      onSelectCallBack: (value) {
                                        var size = product.inventory!.firstWhere((element) => element.color == value);
                                        // ignore: unnecessary_null_comparison
                                        if(size != null){
                                          inventory?.color = size.color;
                                           print(inventory?.color);
                                        }
                                       a =  product.inventory?.firstWhere((element) => element.color == inventory?.color && element.size == inventory?.size );
                                        print(a?.id);
                                        if(a != null){
                                          print(a?.stockQuantity);
                                        }else{
                                          print('f');
                                        }
                                      },
                                    );
                                  },
                                ),
                              )
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primaryColorRed,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(40.0),
                        ),
                      ),
                      onPressed: () {
                        // ignore: unused_local_variable
                        String? size = product?.inventory![productViewModel.selectIndex].size;
                        // ignore: unused_local_variable
                        String? color = product?.inventory![productViewModel.selectIndex].color;
                         Provider.of<CartViewModel>(ctx,listen: false).addToCart(product!,a!);
                         // ignore: unnecessary_null_comparison
                         if( Provider.of<CartViewModel>(ctx,listen: false).message != null){
                           Fluttertoast.showToast(msg:  Provider.of<CartViewModel>(ctx,listen: false).message);
                         }
                      },
                      child: Text(
                        "Thêm Vào Giỏ Hàng".toUpperCase(),
                        style: AppFont.medium.copyWith(
                            fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },);
      },
    );
  }
  Widget buildText(List<String> list){
    return Wrap(
      children: list.map((e) => Text(e)).toList(),
    );
  }

}
