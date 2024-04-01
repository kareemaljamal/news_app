import 'package:flutter/material.dart';
import 'package:news_app/screens/news_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/network/remote/api_manager.dart';

class DataTab extends StatelessWidget {
  DataTab(
      {required this.categoryId,
      super.key,
      required this.search});

  String search;
  String categoryId;
  SharedPreferences? pref;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
              child: Text('something went wrong'));
        }

        var response = snapshot.data?.sources ?? [];
        print(response.length);
        return NewsTab(sources: response, search: search);
      },
    );
  }
}
