import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/img/GOBI NEURO CENTRE FURNISHED-images-6.jpg',
  'assets/img/GOBI NEURO CENTRE FURNISHED-images-1.jpg',
  'assets/img/YUGESH DONE-images-22.jpg',
  'assets/img/YUGESH DONE-images-21.jpg',
  'assets/img/YUGESH DONE-images-20.jpg',
  'assets/img/YUGESH DONE-images-19.jpg',
  'assets/img/YUGESH DONE-images-18.jpg',
  'assets/img/YUGESH DONE-images-17.jpg',
  'assets/img/YUGESH DONE-images-16.jpg',
  'assets/img/YUGESH DONE-images-15.jpg',
  'assets/img/YUGESH DONE-images-14.jpg',
  'assets/img/YUGESH DONE-images-13.jpg',
  'assets/img/GOBI NEURO CENTRE FURNISHED-images-10.jpg',
  'assets/img/GOBI NEURO CENTRE FURNISHED-images-9.jpg',
  'assets/img/GOBI NEURO CENTRE FURNISHED-images-8.jpg',
  'assets/img/GOBI NEURO CENTRE FURNISHED-images-7.jpg',
  'https://images.pexels.com/photos/271816/pexels-photo-271816.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/1776574/pexels-photo-1776574.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/189333/pexels-photo-189333.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/1581554/pexels-photo-1581554.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/2089698/pexels-photo-2089698.jpeg?auto=compress&cs=tinysrgb&w=800'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: imageSliders,
      )
    ]);
  }
}
