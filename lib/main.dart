import 'package:flutter/material.dart';
import 'package:pro1/Task/Pages/NavbarSlider_page.dart';
// import 'package:pro1/3rd%20day/Layout_widget.dart';
// import 'package:pro1/4th%20day/Ecommerce_Layout.dart';
// import 'package:pro1/2nd%20day/secondDay.dart';
import 'package:pro1/Task/Task.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home:HomePage(),
      //  home: ProductPage(),
      home: TaskBySir(),
      // :NavbarSlider(),
       
 
          );
  }
  
 
}

