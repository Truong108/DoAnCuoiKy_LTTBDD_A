import 'package:demo_doan_flutter/src/data/service/product_service.dart';
import 'package:demo_doan_flutter/src/view/screen/component/hometab/body_page.dart';
import 'package:demo_doan_flutter/src/view/screen/component/hometab/header_page.dart';
import 'package:demo_doan_flutter/src/viewmodel/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              HeaderPage(),
              SizedBox(
                height: 20,
              ),
              BodyPage(
              ),
            ],
          ),
        ),
      ),
    );
  }
}
