



import 'package:flutter/material.dart';
import 'package:pro1/Task/User_Information/Controller/User_Controllers.dart';
import 'package:get/get.dart';

class UserAddress extends StatefulWidget {
   UserAddress ({super.key});

  @override
  State<UserAddress> createState() => _UserAddressState();
}

class _UserAddressState extends State<UserAddress> {
       final _formKey = GlobalKey<FormState>();
       UserAddressController _userAddressController=Get.put(UserAddressController());

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(        
        leading: BackButton(),
        title: Text("Your Address", style: TextStyle(fontFamily: 'assets/font/Montserrat-Regular.ttf', fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              _sectionTitle("Enter Your Address",),
              _buildTextField("Email Address"),
              _buildTextField("Mobile Number"),
              _buildTextField("Enter Your Address"),
              _buildTextField("city"),
              _buildTextField("State"),
              _buildTextField("Country"),
              _buildTextField("PinCode"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text("Save", style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label,) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}