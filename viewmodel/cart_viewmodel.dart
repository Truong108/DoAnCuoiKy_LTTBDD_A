import 'package:demo_doan_flutter/src/data/model/address.dart';
import 'package:demo_doan_flutter/src/data/model/inventory.dart';
import 'package:demo_doan_flutter/src/data/model/cart.dart';
import 'package:demo_doan_flutter/src/data/model/order.dart';
import 'package:demo_doan_flutter/src/data/model/product.dart';
import 'package:flutter/cupertino.dart';

class CartViewModel extends ChangeNotifier {
  List<Cart> listCart = [];
  int curr = 1;
  bool isFound = true;
  String message = '';
  double total = 0;
  int productCount = 0;
  List<Order> listOrder = [];

  addToCart(Product product, Inventory inventoryy) {
    productCount = 0;
    if (listCart.isEmpty) {
      listCart.add(
        Cart().copyWith(
          product: product.copyWith(inventory: [inventoryy]),
        ),
      );
      productCount = listCart.length;
      print('TRỐNG $productCount');
    } else {
      for (int i = 0; i < listCart.length; i++) {
        var index = listCart[i]
            .product
            ?.inventory
            ?.indexWhere((element) => element.id == inventoryy.id);
        debugPrint("MỤC $index");
        if (index != -1) {
          if (listCart[i].quantity < inventoryy.stockQuantity!) {
            listCart[i].quantity++;
          } else {
            message = "Số lượng không đủ";
          }
        } else {
          isFound = false;
        }
      }
      if (!isFound) {
        listCart.add(
          Cart().copyWith(
            product: product.copyWith(inventory: [inventoryy]),
          ),
        );
        notifyListeners();
      }

      productCount += listCart.length;
      print('Không Rỗng $productCount');
    }
    calculatePrice();
    notifyListeners();
  }

  void calculatePrice() {
    total = 0;
    listCart.forEach((element) {
      total += element.product!.price! * element.quantity;
    });
    notifyListeners();
  }

  Future increQuantity(Cart order, Inventory inventory) async {
    if (order.quantity < inventory.stockQuantity!) {
      order.quantity++;
    } else {
      message = "Số lượng ko đủ";
    }
    calculatePrice();
    notifyListeners();
  }

  void deceQuanity(Cart order) {
    if (order.quantity > 1) {
      order.quantity--;
    } else {}
    calculatePrice();
    notifyListeners();
  }

  void removeCart(int index) {
    listCart.removeAt(index);
    if (productCount != 0) {
      productCount--;
    }
    calculatePrice();
    notifyListeners();
  }

  void checkOutCart() {
    listOrder.add(Order(
        createAt: "12-10-2012",
        total: total.toString(),
        listItemCart: listCart,
        address: Address(
            userName: "TRƯỜNG",
            addressTitle1: "NGUYỄN XUÂN TRƯỜNG",
            addressTitle2: "0909090920",
            phone: "0326216612"),
        orderNumber: "0977723345"));
  }
}
