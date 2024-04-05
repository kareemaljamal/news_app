import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/news_data_model.dart';
import '../../models/source_response.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/remote/end_points.dart';

class RemoteRepo {
  Future<NewsDataModel> getNewsData(
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
    NewsDataModel newsDataModel =
        NewsDataModel.fromJson(json);
    return newsDataModel;
  }

  Future<SourceResponse> getSources(String category) async {
    Uri url =
        Uri.https(Constants.BASE_URL, EndPoints.sources, {
      'category': category,
      Constants.API_KEY: Constants.API_KEY_VALUE
    });
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    SourceResponse sourceResponse =
        SourceResponse.fromJson(json);
    return sourceResponse;
  }
}
