import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';

class SourceItem extends StatelessWidget {
  SourceItem(
      {super.key,
      required this.sources,
      required this.selected});

  Sources sources;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Text(
        sources.name ?? '',
        style: TextStyle(
            color: selected ? Colors.white : Colors.black),
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(25),
          color:
              selected ? Colors.green : Colors.transparent),
    );
  }
}
