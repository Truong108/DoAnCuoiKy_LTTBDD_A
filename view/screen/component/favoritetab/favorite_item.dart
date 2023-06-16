import 'package:demo_doan_flutter/src/const/app_colors.dart';
import 'package:demo_doan_flutter/src/const/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/image/dtyeuthich.jpeg',
                    fit: BoxFit.cover,
                    width: 190,
                    height: 220,
                  ),

                ),
              ),
              Positioned(
                  top: 5,
                  left: 7,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorRed,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Text(
                      '5%',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )),
              Positioned(
                  top: 5,
                  right: 7,
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  )),
              Positioned(
                  right: 0,
                  bottom: 0,
                  width: 40,
                  height: 40,
                  child: Container(
                      padding: EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColorRed,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.2),
                              offset: Offset(1, 1),
                              spreadRadius: 3,
                              blurRadius: 3),
                        ],
                      ),
                      child: SvgPicture.asset(
                        'assets/image/bag_active.svg',
                        fit: BoxFit.scaleDown,
                        color: Colors.white,
                      ))),
            ],
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
              Text('(9)')
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Dâu Tây',
            style: AppFont.regular.copyWith(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Dâu Tây Đà Lạt chín đỏ',
            style: AppFont.bold.copyWith(
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '379.000 đồng / 1kg',
            style: AppFont.bold
                .copyWith(fontSize: 14, color: AppColors.primaryColorRed),
          ),
        ],
      )),
    );
  }
}
