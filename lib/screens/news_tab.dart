import 'package:flutter/material.dart';
import 'package:news_app/screens/bloc/cubit.dart';
import 'package:news_app/screens/widgets/newt_item.dart';
import 'package:news_app/screens/widgets/source_item.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: HomeCubit.get(context).sources.length,
            child: TabBar(
              onTap: (value) async {
                HomeCubit.get(context)
                    .ChangeSelectedIndex(value);
              },
              isScrollable: true,
              tabs: HomeCubit.get(context)
                  .sources
                  .map((e) => Tab(
                        child: SourceItem(
                          sources: e,
                          selected: HomeCubit.get(context)
                                  .sources
                                  .elementAt(
                                      HomeCubit.get(context)
                                          .selectedIndex) ==
                              e,
                        ),
                      ))
                  .toList(),
            )),
        Expanded(
          child: ListView.builder(
            itemCount:
                HomeCubit.get(context).articles.length,
            itemBuilder: (context, index) {
              return NewsItem(
                  article: HomeCubit.get(context)
                      .articles[index]);
            },
          ),
        )
      ],
    );
  }
}
