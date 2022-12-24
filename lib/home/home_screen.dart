import 'package:flutter/material.dart';
import 'package:seller_app/auth/auth_screen.dart';
import 'package:seller_app/global/global.dart';
import 'package:seller_app/upload/menu_upload_screen.dart';
import 'package:seller_app/widgets/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.amber],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp)),
        ),
        title: Text(sharedPreferences!.getString("sellerName")!, style: const TextStyle(fontSize: 30, fontFamily: "Lobster"),),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) => const MenuUploadScreen()));
          }, icon: const Icon(Icons.post_add, color: Colors.white,))
        ],
      ),
      drawer: const HomeDrawer(),
      body: Center(),
    );
  }
}
