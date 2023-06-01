import 'package:demo_doan_flutter/src/data/model/inventory.dart';
import 'package:demo_doan_flutter/src/data/model/product.dart';

class ProductService {
  List<Product> listProduct = [
    Product(
        id: "1",
        title: "Bông Cải",
        description: "Đẹp",
        price: 58.000,
        amountProduct: 20,
        createAt: "10/10/2021",
        isLike: false,
        urlImage: [
          'https://media.istockphoto.com/id/1321421458/vi/anh/b%C3%B4ng-c%E1%BA%A3i-xanh-v%C3%A0-s%C3%BAp-l%C6%A1-%C4%91%E1%BB%83-b%C3%A1n.jpg?s=612x612&w=0&k=20&c=trxgr-SyGawYFlsRDjH5zf455PdhF_G0uqkUecFw8J0='
        ],
        category: "Bắp cải/Súp lơ/58 Đ/1kg",
        inventory: [
          Inventory(
            id: "1",
            color: "600 Gam",
            size: "Bông Cải",
            stockQuantity: 20,
          ),
          Inventory(
            id: "2",
            color: "2 KG",
            size: "Súp lơ",
            stockQuantity: 20,
          ),
          // Inventory(
          //   id: "4",
          //   color: "Đen",
          //   size: "S",
          //   stockQuantity: 1,
          // ),
          // Inventory(
          //   id: "5",
          //   color: "Đỏ",
          //   size: "XL",
          //   stockQuantity: 5,
          // ),
        ]),
    Product(
        id: "2",
        title: "Bơ Tươi",
        description: "Đẹp 1",
        price: 129.000,
        amountProduct: 20,
        createAt: "21/2/2020",
        isLike: false,
        urlImage: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYi2RSEmYwno5HZwNMqU0qIVTQjVga96hFyg&usqp=CAU'
        ],
        category: "Bơ Tươi/129 Đ/1kg",
        inventory: [
          Inventory(
            id: "8",
            color: "1 Kg",
            size: "Bơ Sống",
            stockQuantity: 10,
          ),
          Inventory(
            id: "9",
            color: "3 Kg",
            size: "Bơ Chín",
            stockQuantity: 2,
          ),
        ]),
    Product(
        id: "3",
        title: "Dâu Tươi",
        description: "Đẹp 2",
        price: 255.000,
        amountProduct: 20,
        createAt: "10/10/2012",
        isLike: false,
        urlImage: [
          'https://duyendangvietnam.net.vn/public/uploads/files/dau%20tay%202.jpg'
        ],
        category: "Dâu Tươi Đà Lạt/255 Đ/1kg",
        inventory: [
          Inventory(
            id: "8",
            color: "3 Kg",
            size: "Dâu Nhỏ Chưa Đỏ",
            stockQuantity: 10,
          ),
          Inventory(
            id: "9",
            color: "5 Kg",
            size: "Dâu Bự Chín Đỏ",
            stockQuantity: 2,
          ),
        ]
        ),
        
    Product(
        id: "4",
        title: "Cà Chua",
        description: "Đẹp 3",
        price: 30.000,
        amountProduct: 20,
        createAt: "10/10/2029",
        isLike: false,
        urlImage: [
          'https://vinmec-prod.s3.amazonaws.com/images/20200729_051027_700925_Lycopene-6.max-800x800.jpg'
        ],
        category: "Cà Chua/30 Đ/1kg",
        inventory: [
          Inventory(
            id: "8",
            color: "2 kG",
            size: "Cà Chua Chín Đỏ",
            stockQuantity: 10,
          ),
          Inventory(
            id: "9",
            color: "4 Kg",
            size: "Cà Chua Sống",
            stockQuantity: 2,
          ),
        ]
        ),
    Product(
        id: "5",
        title: "Pizaa",
        description: "Đẹp 4",
        price: 399.000,
        amountProduct: 10,
        createAt: "10/10/2014",
        isLike: false,
        urlImage: [
          'https://tranhopic.com/wp-content/uploads/2022/04/Tranh-We-love-pizza-dep-cho-quan-an-nha-hang-OP_17604490.jpg'
        ],
        category: "Pizza Napoli"),
    Product(
        id: "6",
        title: "Hamburger",
        description: "Đẹp 5 ",
        price: 190.000,
        amountProduct: 2,
        createAt: "10/10/2011",
        isLike: false,
        urlImage: [
          'https://chianui.vn/wp-content/uploads/2019/06/B%C3%92-2-T%E1%BA%A6NG_resize_min-800x800.jpg'
        ],
        category: "Hamburger có tên là Big Mac"),
    //   Product(
    //       id: "7",
    //       title: "Sầu Riêng",
    //       description: "Đẹp 6 ",
    //       price: 520.000,
    //       amountProduct: 10,
    //       createAt: "24/02/2012",
    //       isLike: false,
    //       urlImage: [
    //         'https://tincay.com/wp-content/uploads/2023/02/cach-do-do-ngot-sau-rieng-01.jpg'
    //       ],
    //       category: "Sầu Riêng"),
    //   Product(
    //     id: "8",
    //     title: "Sầu Riêng",
    //     description: "Đẹp 7 ",
    //     price: 520.000,
    //     amountProduct: 8,
    //     createAt: "24/02/2012",
    //     isLike: false,
    //     urlImage: [
    //       'https://tincay.com/wp-content/uploads/2023/02/cach-do-do-ngot-sau-rieng-01.jpg'
    //     ],
    //     category: "Sầu Riêng"),
  ];

  Future<List<Product>> getListProduct() async {
    return listProduct;
  }

Future likeProduct(int isLike) async {
  if (isLike == 0) {
    isLike = 1;

  }
}
}
