



import 'package:flutter/material.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 0.8),
                ),
                hintText: "Search any Product...",
                prefixIcon: Icon(Icons.search, size: 30.00,),
                suffixIcon: IconButton(onPressed: (){
                          
                }, icon: Icon(Icons.mic))
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Text("52,082+ Items"),),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,   
                      children: [
                        IconButton(onPressed: (){
                          
                        }, icon: Icon(Icons.sort),),
                        IconButton(onPressed: (){
                             
                        }, icon: Icon(Icons.filter))
                      ],
                   )
                ],
              ),
          )
        ],
      ),
    );
  }
}



/*
 body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(width: 0.8),
                ),
                hintText: "Search any Product...",
                prefixIcon: Icon(Icons.search, size: 30.00,),
                suffixIcon: IconButton(onPressed: (){
                          
                }, icon: Icon(Icons.mic))
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.00),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(child: Text("52,082+ Items"),),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(onPressed: (){
                          
                        }, icon: Icon(Icons.sort),),
                        IconButton(onPressed: (){
                             
                        }, icon: Icon(Icons.filter))
                      ],
                   )
                ],
              ),
          )
        ],
      ),
 */