import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro1/Task/Check-Out/Personal_Information.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ElevatedButton(onPressed: (){
                Get.to(PersonalInformation());
        }, child: Text('click to check the personal Details')),
      )
    );
  }
}