import 'package:demo_doan_flutter/src/const/app_font.dart';
import 'package:demo_doan_flutter/src/data/model/product.dart';
import 'package:demo_doan_flutter/src/router/router_path.dart';
import 'package:demo_doan_flutter/src/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_product.dart';


class BodyPage extends StatefulWidget {
  @override
  _BodyPageState createState() => _BodyPageState();
}
class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    ProductViewModel prductVM = Provider.of(context,listen: false);
    double cardWidth = ((MediaQuery.of(context).size.width - 40) / 2);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderBody(title: "Mới", description: "Thực Phẩm Mới"),
          SizedBox(
            height: 20,
          ),
         SizedBox(
            height: cardWidth / 0.59,
            child: ListView.builder(
              itemCount:  prductVM.listProduct?.length,
              padding: EdgeInsets.all(0.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_,index){
                Product? product = prductVM.listProduct![index];
                return InkWell(
                  onTap: (){
                    prductVM.addRecentView(product);
                    Navigator.pushNamed(context,DetailProductScreens,arguments: product);
                  },
                  child: CartProduct(
                    index: index,
                    product: product,

                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }
  Widget buildHeaderBody({required String title,required String description}){
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,style: AppFont.bold.copyWith(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 8,
            ),
            Text(description,style: AppFont.regular.copyWith(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),),
          ],
        ),
        Spacer(),
       InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
        },
        child: Text(
          'Xem Tất Cả',
          style: AppFont.regular.copyWith(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      ],
    );
  }
}
