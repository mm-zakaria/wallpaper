import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/model/photo_model.dart';

Widget wallpaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: GridView.count(
      padding: EdgeInsets.all(4.0),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: listPhotos.map((PhotosModel photosModel){
        return GridTile(child: Hero(tag:photosModel.src!.portrait!, child: Container(

          child:CachedNetworkImage(imageUrl: photosModel.src!.portrait!,fit: BoxFit.cover,) ,



        )));
      },).toList()
    ),
  );
}
 