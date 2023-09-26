import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../assignment1/data.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7일차 과제 2번'),
        centerTitle: false,
      ),
      body: Center(
        child: CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 4.5,
            autoPlay: true,
            autoPlayInterval: Duration(milliseconds: 2500),
          ),
          items: imageUrl.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
