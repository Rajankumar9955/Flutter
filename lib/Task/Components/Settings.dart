import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Settings"),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            )
          ),
        ),
        
      ),
    );;
  }
}