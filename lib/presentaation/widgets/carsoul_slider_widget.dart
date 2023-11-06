import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarsoulSliderWidget extends StatelessWidget {
  const CarsoulSliderWidget({required this.images, Key? key}) : super(key: key);
  final List<String> images;
  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        height: 20.h,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
      ),
      items: images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return CachedNetworkImage(
              imageUrl: i,
              imageBuilder: (ctx, imageProvider) {
                return Container(
                  width: double.infinity,
                  height: 25.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      )),
                );
              },
              placeholder: (_, __) =>
                  const Center(child: CircularProgressIndicator()),
            );
          },
        );
      }).toList(),
    );
  }
}