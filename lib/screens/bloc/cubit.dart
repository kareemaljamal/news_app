import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/bloc/states.dart';
import 'package:news_app/screens/repo/remote_repo.dart';

import '../../models/news_data_model.dart';
import '../../models/source_response.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.repo) : super(HomeInitState());
  RemoteRepo repo;
  static HomeCubit get(context) {
    return BlocProvider.of(context);
  }

  List<Sources> sources = [];
  int selectedIndex = 0;
  List<Articles> articles = [];

  void ChangeSelectedIndex(int index) {
    selectedIndex = index;
    emit(SelectedIndexState());
  }

  Future<void> getSources(String category) async {
    try {
      emit(HomeGetSourcesLoadingState());
      var sourceResponse = await repo.getSources(category);
      sources = sourceResponse.sources ?? [];
      emit(HomeGetSourcesSuccessState());
    } catch (e) {
      emit(HomeGetSourcesErrorState(e.toString()));
    }
  }

  Future<void> getNewsData(String searchWord) async {
    try {
      emit(HomeGetNewsLoadingState());
      var newsDataModel = await repo.getNewsData(
          sources[selectedIndex].id ?? '', searchWord);
      articles = newsDataModel.articles ?? [];
      emit(HomeGetNewsSuccessState());
    } catch (e) {
      print(e.toString());
      emit(HomeGetNewsErrorState(e.toString()));
    }
  }
}
