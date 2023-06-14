// import 'package:demo_doan_flutter/src/data/model/order.dart';
import 'package:demo_doan_flutter/src/router/router_path.dart';
import 'package:demo_doan_flutter/src/data/model/product.dart';

import 'package:demo_doan_flutter/src/view/screen/change_pass_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/add_address_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/checkout_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/choice_address_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/detail_product_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/forgot_pass_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/login_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/my_order_screen.dart';
// import 'package:demo_doan_flutter/src/view/screen/order_detail_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/order_success_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/recent_view_screen.dart';
// import 'package:demo_doan_flutter/src/view/screen/register_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routerr{
  static RouteFactory onGenerateRouter = (RouteSettings settings){
    switch(settings.name){
      case DetailProductScreens:
        final arg = settings.arguments! as Product;
        return _generateMaterialRoute(DetailProductScreen(product: arg,));
      case CheckoutScreens:
        return _generateMaterialRoute(CheckoutScreen());
      case ChoiceAddressScreens:
        return _generateMaterialRoute(ChoiceAddressScreen());
      case AddAddressScreens:
        return _generateMaterialRoute(AddAddressScreen());
      case OrderSuccessScreens:
        return _generateMaterialRoute(OrderSuccessScreen());
      case MyOrderScreens:
        return _generateMaterialRoute(MyOrderScreen());
      // case OrderDetailScreens:
      //   final arg = settings.arguments! as Order;
      //   return _generateMaterialRoute(OrderDetailScreen(order: arg,));
      case RecentViewScreens:
        final arg = settings.arguments! as List<Product>;
        return _generateMaterialRoute(RecentViewScreen(listRecentProduct: arg,));
      case SplashScreens:
        return _generateMaterialRoute(SplashScreen());
      case LoginScreens:
        return _generateMaterialRoute(LoginScreen());
      // case RegisterScreens:
      //   return _generateMaterialRoute(RegisterScreen());
      case ForgotPassScreens:
        return _generateMaterialRoute(ForgotPassScreen());
      case ChangePassScreens:
        return _generateMaterialRoute(ChangePassScreen());
      // case OtpScreens:
      //   return _generateMaterialRoute(OtpScreen());
      default:
        return _generateMaterialRoute(Center(child: Text("Trên bộ định tuyến không xác định",style: TextStyle(
          color: Colors.red,
          fontSize: 25,
        ),),));
    }
  };
}

PageTransition _generateMaterialRoute(Widget screen) {
  return PageTransition(child: screen,type: PageTransitionType.fade);
}