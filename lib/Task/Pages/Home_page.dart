import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({super.key});

  @override
  State<TaskHomePage> createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  int _selecteIndex=0;

static final List<Widget> _screen=[
  Container(),
  Placeholder(),
  Placeholder(),
  Placeholder(),
  Placeholder(),
];

  void _onItemTapped(int index){
     setState(() {
          _selecteIndex=index;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Stylish", style: TextStyle(
          fontSize: 25, fontFamily: "monserrat",fontWeight: FontWeight.bold, color:Colors.cyan
        ),),
        centerTitle: true,
        actions: [  
          IconButton(onPressed: (){
             ///////////////////////////////////////////////////////
          }, icon: Icon(Icons.admin_panel_settings_sharp)),
        ],
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          //////////////////////////////
        },
       icon: IconButton(onPressed: (){
//////////////////////////////////////////////////
       }, icon: Icon(Icons.menu),
       ),
       ),
       ),


       body: _screen[_selecteIndex],
           


    bottomNavigationBar: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavBarItem(CupertinoIcons.home, 'Home', 0),
          buildNavBarItem(CupertinoIcons.heart_solid, 'Wishlist', 1),
         const SizedBox(width: 20),
          buildNavBarItem(CupertinoIcons.search, 'Search', 3),
          buildNavBarItem(CupertinoIcons.settings, 'Settings', 4),

          ],
      ),
    ),
    floatingActionButton: ClipOval(
      child: Material(
        color: Color(0xFF7861FF),
        elevation: 10,
        child: InkWell(
          child: SizedBox(
            height: 56,
            width: 56,
            child: Icon(CupertinoIcons.cart, size: 28,color: Colors.white,),          
            ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,



    );
  }
  
  buildNavBarItem(IconData icon, String label, int index) {
    return InkWell(
      onTap: ()=>  _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selecteIndex == index ? Colors.red: Colors.black87,
            ),
            Text(
              label,
              style: TextStyle(
                 color: _selecteIndex == index ? Colors.red: Colors.black87,
              ),
              ),
        ],
      ),
    );
  }
}