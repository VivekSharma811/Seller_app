import 'package:flutter/material.dart';

import '../auth/auth_screen.dart';
import '../global/global.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 160,
                      width: 160,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(sharedPreferences!
                                    .getString("sellerProfilePicture") !=
                                null
                            ? sharedPreferences!
                                .getString("sellerProfilePicture")!
                            : ""),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  sharedPreferences!.getString("sellerName") != null
                      ? sharedPreferences!.getString("sellerName")!
                      : "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "TrainOne"),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  title: Text("Home", style: TextStyle(color: Colors.black)),
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.monetization_on,
                    color: Colors.black,
                  ),
                  title: Text("My Earnings", style: TextStyle(color: Colors.black)),
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.reorder,
                    color: Colors.black,
                  ),
                  title: Text("New Orders", style: TextStyle(color: Colors.black)),
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.local_shipping,
                    color: Colors.black,
                  ),
                  title: Text("Order History", style: TextStyle(color: Colors.black)),
                ),
                const Divider(
                  height: 10,
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  title: Text("Sign Out", style: TextStyle(color: Colors.black)),
                  onTap: () {
                    firebaseAuth.signOut().then((value) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) => const AuthScreen()));
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
