import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/news_data_model.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem({required this.article, super.key});
  TextStyle titleStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  TextStyle sourceStyle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.all(Radius.circular(15)),
            // topLeft: Radius.circular(15),
            // topRight: Radius.circular(15)),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              placeholder: (context, url) =>
                  CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10.0, left: 10),
            child: Text(
              article.source!.name ?? '',
              style: sourceStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              article.title ?? '',
              style: titleStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
