import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {required this.model,
      required this.index,
      super.key});
  CategoryModel model;
  int index;

  TextStyle style = GoogleFonts.exo(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: model.color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            topLeft: Radius.circular(25),
            bottomRight: index.isEven
                ? Radius.circular(25)
                : Radius.circular(0),
            bottomLeft: index.isOdd
                ? Radius.circular(25)
                : Radius.circular(0),
          )),
      child: Column(
        children: [
          Expanded(
              child: Image(image: AssetImage(model.img))),
          Container(
            margin: EdgeInsets.all(5.0),
            child: Text(
              model.title,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
