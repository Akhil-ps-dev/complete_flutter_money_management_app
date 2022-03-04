import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final imgUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQSxBSGRCIdRtH9iLLcqqrF2rkldsscdnnJpof42oX4jHIzB_2km7f1n_LOfZv39SCRYI&usqp=CAU";

    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.white),
                margin: EdgeInsets.zero,
                accountName: Text(
                  "Akhil",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                accountEmail: Text(
                  "akhil123@gmail.com",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                ),
              ),
            ),
            ListTile(
              //onTap: ,
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Title(
                  color: Colors.black,
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              title: Title(
                  color: Colors.black,
                  child: Text(
                    'Cart',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.security,
                color: Colors.black,
              ),
              title: Title(
                  color: Colors.white,
                  child: Text(
                    'Privacy',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications_active,
                color: Colors.black,
              ),
              title: Title(
                  color: Colors.white,
                  child: Text(
                    'Notification',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
//? break n
            SizedBox(
              height: 190,
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Title(
                  color: Colors.white,
                  child: Text(
                    'Account',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            // SizedBox(
            //   height: 120,
            // ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Title(
                  color: Colors.white,
                  child: Text(
                    'Settings',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
