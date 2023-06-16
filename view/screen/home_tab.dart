
import 'package:demo_doan_flutter/src/view/screen/component/hometab/body_page.dart';
import 'package:demo_doan_flutter/src/view/screen/component/hometab/header_page.dart';
import 'package:demo_doan_flutter/src/view/screen/component/hometab/settings_screen.dart';
import 'package:demo_doan_flutter/src/view/screen/component/hometab/support.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isDarkModeEnabled = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CartEmptyScreen()),
              // );
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 57, 39, 124),
                ),
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      CupertinoIcons.person_crop_square_fill,
                      color: Colors.white,
                      ),),
                      title: Text(
                        'Xuan Truong',
                        style: TextStyle(color: Colors.white),
                        ),
                      subtitle: Text(
                        "App Food" ,
                      style: TextStyle(color: Colors.white),
                  ),
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_business_outlined,
                          color: Colors.white,
                          size: 40,
                        ),                        
                      ],
                    ),
                  ],
                ),
              ),
            ListTile(
             leading: const Icon(Icons.home_rounded),
              title: const Text('Home'),
              onTap: () {
              //   Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => BodyPage()),
              // );
              },
            ),
            ListTile(
               leading: const Icon(Icons.account_circle),
              title: const Text('Hồ Sơ'),
              onTap: () {
              //   Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => PersonalTab()),
              // );
              },
            ),
            ListTile(
             leading: const Icon(Icons.favorite),
              title: const Text('Yêu Thích'),
              onTap: () {
              //   Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => FavoriteEmpty()),
              // );
              },
            ),
            InkWell(
              onTap: () {},
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey, 
                      width: 1.0, 
                    ),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text('Hỗ Trợ'),
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderPage()),
                   );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 250,
            ),
           ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dart Mode'),
              trailing: Switch(
                value: isDarkModeEnabled,
                onChanged: (bool newValue) {
                  setState(() {
                    isDarkModeEnabled = newValue;
                  });
                },
                activeColor: Colors.blue, 
                activeTrackColor: Color.fromARGB(255, 189, 4, 4), 
                inactiveThumbColor: Colors.grey, 
                inactiveTrackColor: Colors.grey[300], 
              ),
              onTap: () {},
            ),

           InkWell(
            onTap: () {

            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey, 
                    width: 1.0, 
                  ),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Cài Đặt'),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
                },
              ),
            ),
          ),
          ],
        ),
      ),
    body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            HeaderPage(),
            SizedBox(
              height: 10,
            ),
            BodyPage(),
          ],
        ),
      ),
    ),
  );
}
}
