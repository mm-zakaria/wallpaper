import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaper/model/photo_model.dart';
import 'package:http/http.dart'as http;
import 'package:wallpaper/widgect/wallpaper.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();

}

class _SearchState extends State<Search> {

List<PhotosModel> photos = [];
TextEditingController searchcontroller =new TextEditingController();

bool search =false;

getSearchWallpaper(String searchQuery)async{

await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"), headers:{"Authorization":"7XySLvz1lqqR6akWeafYyhxxe2xTlwgFgJsDdDTp9BERK53bdlGDGpHT"}).then((value){

Map<String ,dynamic> jsonData =jsonDecode(value.body);
jsonData["photos"].forEach((element){

PhotosModel photosModel = new PhotosModel();

photosModel = PhotosModel.fromMap(element);
photos.add(photosModel);


});
setState(() {
  search = true;
});



});

   

}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0),

        child: Column(
          children: [
            Center(
              child: Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                ),
            ),
            SizedBox(height: 5.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFececf8),borderRadius: BorderRadius.circular(10),
                
              ),
              child: TextField(
                controller: searchcontroller,
                decoration: InputDecoration(border: InputBorder.none,suffixIcon: 
                 GestureDetector(
                  onTap: () {
                    getSearchWallpaper(searchcontroller.text);
                  },
                  child:search? GestureDetector(
                    onTap: () {
                      photos=[];
                      search = false;
                      setState(() {
                        
                      });
                    },
                    child: Icon(Icons.close,
                    ),
                  ):
                  Icon(Icons.search
                  ),
                  
                  
                  
                  )),
                
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(child: wallpaper(photos, context)),

          ],
        ),
      ),
    );
  }
}