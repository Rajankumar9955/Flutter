import 'package:flutter/material.dart';

class NavbarSlider extends StatelessWidget {
  const NavbarSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Rajan Kumar"), 
                  accountEmail: Text("Krajan92946@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset("assets/MyImage.jpg",fit: BoxFit.cover,),
                    ),
                  ),
                  ),
            ],
          ),
    );
  }
}