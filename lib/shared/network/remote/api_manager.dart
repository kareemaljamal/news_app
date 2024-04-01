import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_data_model.dart';
import 'package:news_app/models/source_response.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/network/remote/end_points.dart';

class ApiManager {
  static Future<SourceResponse> getSources(
      String category) async {
    Uri url =
        Uri.https(Constants.BASE_URL, EndPoints.sources, {
      'category': category,
      Constants.API_KEY: Constants.API_KEY_VALUE
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future<NewsDataModel> getNewsData(
      String sourceId, String search) async {
    Uri url =
        Uri.https(Constants.BASE_URL, EndPoints.newsData, {
      Constants.API_KEY: Constants.API_KEY_VALUE,
      'sources': sourceId,
      'q': search,
      'searchIn': 'title'
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    print(
        '${NewsDataModel.fromJson(json).articles!.elementAt(0).title} sadfasdfasdfasdfasdf');
    return NewsDataModel.fromJson(json);
  }
}
