import 'package:flutter/material.dart';
import 'package:news_app/screens/widgets/newt_item.dart';
import 'package:news_app/screens/widgets/source_item.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

import '../models/source_response.dart';

class NewsTab extends StatefulWidget {
  NewsTab(
      {super.key,
      required this.sources,
      required this.search});

  String search;
  List<Sources> sources;
  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (value) async {
                selectedIndex = value;
                setState(() {});
              },
              isScrollable: true,
              tabs: widget.sources
                  .map((e) => Tab(
                        child: SourceItem(
                          sources: e,
                          selected: widget.sources
                                  .elementAt(
                                      selectedIndex) ==
                              e,
                        ),
                      ))
                  .toList(),
            )),
        Expanded(
          child: FutureBuilder(
            future: ApiManager.getNewsData(
                widget.sources[selectedIndex].id ?? '',
                widget.search),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return Center(
                    child: Text('No Results To Show'));
              }
              var articles = snapshot.data!.articles ?? [];
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(
                        article: articles[index]);
                  },
                  itemCount: articles.length,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
