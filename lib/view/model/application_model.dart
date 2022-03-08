import 'package:application/view/style/k_color.dart';
import 'package:flutter/material.dart';

class ApplicationModel {
  String title;
  String designation;
  String countryName;
  String status;
  String price;
  String image;
  Color backgroundColor;
  Color textColor;

  ApplicationModel(
      {this.title,
      this.designation,
      this.backgroundColor,
      this.status,
      this.price,
      this.image,
      this.textColor,
      this.countryName});
}

final List<ApplicationModel> applicationList = [
  ApplicationModel(
      title: 'Facebook',
      designation: 'UI/UX Designer',
      countryName: 'Toronto, Canada',
      price: '\$4500 Monthly',
      status: 'Delivered',
      image: 'assets/images/facebook.png',
      backgroundColor: KColor.tints,
      textColor: KColor.blue),
  ApplicationModel(
      title: 'Dribbble',
      designation: 'Visual Designer',
      countryName: 'New York, USA',
      price: '\$1200 Monthly',
      status: 'Delivered',
      image: 'assets/images/dribble.png',
      backgroundColor: KColor.pinkish,
      textColor: KColor.pink),
  ApplicationModel(
      title: 'Google',
      designation: 'UI/UX Designer',
      countryName: 'New York, USA',
      price: '\$1200 Monthly',
      status: 'Pending',
      image: 'assets/images/google.png',
      backgroundColor: KColor.backgroundColor,
      textColor: KColor.lightBlue),
  ApplicationModel(
      title: 'Spotify',
      designation: 'UI/UX Designer',
      countryName: 'New York, USA',
      price: '\$1200 Monthly',
      status: 'Pending',
      image: 'assets/images/spoti.png',
      backgroundColor: KColor.greenShade,
      textColor: KColor.green),
];
