import 'package:demo_doan_flutter/src/const/app_font.dart';
import 'package:demo_doan_flutter/src/router/router_path.dart';
// import 'package:demo_doan_flutter/src/view/screen/choice_address_screen.dart';
import 'package:demo_doan_flutter/src/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalTab extends StatefulWidget {
  @override
  _PersonalTabState createState() => _PersonalTabState();
}

class _PersonalTabState extends State<PersonalTab> {
  Map<String, String> listInfomation = {
    'Đơn hàng của tôi': 'Đã có 3 đơn hàng',
     'Địa chỉ giao hàng': '2 địa chỉ',
     'Phương thức thanh toán': 'Visa, Momo ',
     'Đánh giá của tôi': 'Đánh giá cho 4 mặt hàng',
     'Xem gần đây': 'Đánh giá cho 4 mục',
  };

  @override
  Widget build(BuildContext context) {
    var productVM = Provider.of<ProductViewModel>(context,listen: false);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                 image: DecorationImage(
                   image: NetworkImage('https://m.tienganh123.com/file/tienganhcoban/bai8/vocabulary/hinh%20minh%20hoa..jpg'),
                   fit: BoxFit.cover
                 ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nguyễn Xuân Trường",
                      style: AppFont.semiBold.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "xuantruong10082002@gmail.com",
                      style: AppFont.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: listInfomation.length,
              separatorBuilder: (BuildContext context, int index)  => Divider(),
              itemBuilder: (BuildContext context, int index) {
                var title = listInfomation.keys.elementAt(index);
                var subtitle = listInfomation.values.elementAt(index);
                return InkWell(
                  onTap: () {
                    switch(index){
                      case 0:
                         Navigator.pushNamed(context, MyOrderScreens);
                        break;
                      case 1:
                        Navigator.pushNamed(context, ChoiceAddressScreens);
                        break;
                      case 4:
                        Navigator.pushNamed(context, RecentViewScreens,arguments: productVM.listRecent);
                        break;
                    }
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.all(0.0),
                    title: Text(
                      title,
                      style: AppFont.semiBold.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    subtitle: Text(
                      subtitle,
                      style: AppFont.regular.copyWith(
                          fontWeight: FontWeight.w100,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                );
              },

            ),
          )
        ],
      ),
    );
  }
}
