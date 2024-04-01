import 'package:flutter/material.dart';

class CategoryModel {
  String title;
  String id;
  String img;
  Color color;

  CategoryModel(
      {required this.title,
      required this.id,
      required this.img,
      required this.color});

  static List<CategoryModel> getCategory() {
    return [
      CategoryModel(
          title: 'Business',
          id: 'business',
          img: 'assets/bussines.png',
          color: Color(0XffCF7E48)),
      CategoryModel(
          title: 'Politics',
          id: 'general',
          img: 'assets/Politics.png',
          color: Color(0Xff003E90)),
      CategoryModel(
          title: 'Health',
          id: 'health',
          img: 'assets/health.png',
          color: Color(0XffED1E79)),
      CategoryModel(
          title: 'Science',
          id: 'science',
          img: 'assets/science.png',
          color: Color(0XffF2D352)),
      CategoryModel(
          title: 'Sports',
          id: 'sports',
          img: 'assets/sports.png',
          color: Color(0XffC91C22)),
      CategoryModel(
          title: 'Technology',
          id: 'technology',
          img: 'assets/entertainment.png',
          color: Color(0Xff4882CF)),
      CategoryModel(
          title: 'Entertainment',
          id: 'entertainment',
          img: 'assets/entertainment.png',
          color: Color(0XffCF7E48)),
    ];
  }
}
