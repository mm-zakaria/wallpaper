import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List wallpaperimages = ["images/w1.jpg", "images/w2.jpg", "images/w3.jpg"];
  int activeIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 10, 31),
      body: Container(
        margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Trending Now",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            SizedBox(height: 30.0),
            CarouselSlider.builder(
              itemCount: wallpaperimages.length,
              itemBuilder: (context, index, realIndex) {
                final res = wallpaperimages[index];
                return buildImage(res, index);
              },
              options: CarouselOptions(
                autoPlay: true,
                height: MediaQuery.of(context).size.height / 1.5,
               // viewportFraction: 1, // if i can turn it it will be show just one by one picture thats why i just turn off the fetures
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,onPageChanged: (index ,reason){
                  setState(() {
                    activeIndex=index;
                  });
                }
                
              ),
              
            ),SizedBox(height: 15.0),
            Center(child: buildIndicator(),)
          ],
        ),
      ),
    );
  }
Widget buildIndicator() =>AnimatedSmoothIndicator(activeIndex: activeIndex, count: 3,effect: ScrollingDotsEffect(
  dotWidth: 15, dotHeight: 15 ,activeDotColor: Colors.pink
),);


  Widget buildImage(String urlImage, int index) => Container(
    height: MediaQuery.of(context).size.height / 1.5,
    width: MediaQuery.of(context).size.width,
    child: ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(30),
      child: Image.asset(urlImage, fit: BoxFit.cover),
    ),
  );
}
