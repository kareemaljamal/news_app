abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeGetSourcesLoadingState extends HomeStates {}

class HomeGetSourcesSuccessState extends HomeStates {}

class HomeGetSourcesErrorState extends HomeStates {
  String errorMsg;
  HomeGetSourcesErrorState(this.errorMsg);
}

class HomeGetNewsLoadingState extends HomeStates {}

class HomeGetNewsSuccessState extends HomeStates {}

class HomeGetNewsErrorState extends HomeStates {
  String errorMsg;
  HomeGetNewsErrorState(this.errorMsg);
}

class SelectedIndexState extends HomeStates {}
