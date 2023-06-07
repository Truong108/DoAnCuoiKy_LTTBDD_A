import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class OrderItem {
  String name;
  String address;
  double price;
  String phoneNumber;

  OrderItem(this.name, this.address, this.price, this.phoneNumber);
}

class _OrderPageState extends State<OrderPage> {
  List<OrderItem> orders = [
    OrderItem('Pizza', 'Trường, 9/2 Tô Hiến Thành Hcm', 499, '0326216612'),
    OrderItem('Burger', 'Trường, 9/2 Tô Hiến Thành Hcm', 199, '0326216612'),
    OrderItem('Dâu Tây', 'Trường, 9/2 Tô Hiến Thành Hcm', 299, '0326216612'),
  ];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _priceController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đơn Hàng'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(orders[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Địa chỉ: ${orders[index].address}'),
                Text('Số điện thoại: ${orders[index].phoneNumber}'),
                Text('Giá: ${orders[index].price.toStringAsFixed(2)} VNĐ'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  orders.removeAt(index); // Xóa đơn hàng
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog(); // Hiển thị hộp thoại thêm đơn hàng
        },
      ),
    );
  }

  void _showDialog() {
    String name = '';
    String address = '';
    double price = 0.0;
    String phoneNumber = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thêm đơn hàng'),
          content: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Tên đơn hàng'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Địa chỉ'),
                onChanged: (value) {
                  address = value;
                },
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Số điện thoại'),
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Giá tiền'),
                onChanged: (value) {
                  price = double.tryParse(value) ?? 0.0;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Thêm'),
              onPressed: () {
                setState(() {
                  if (name.isNotEmpty &&
                      address.isNotEmpty &&
                      phoneNumber.isNotEmpty &&
                      price > 0) {
                    orders.add(OrderItem(name, address, price, phoneNumber)); // Thêm đơn hàng mới
                  }
                });
                _nameController.clear();
                _addressController.clear();
                _phoneNumberController.clear();
                _priceController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
