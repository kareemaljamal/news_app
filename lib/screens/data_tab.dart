import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/bloc/cubit.dart';
import 'package:news_app/screens/bloc/states.dart';
import 'package:news_app/screens/repo/remote_repo.dart';

import 'news_tab.dart';

class DataTab extends StatelessWidget {
  DataTab(
      {required this.categoryId,
      super.key,
      required this.search});
  String categoryId;
  String search;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(RemoteRepo())..getSources(categoryId),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is HomeGetSourcesLoadingState ||
              state is HomeGetNewsLoadingState) {
          } else if (state is HomeGetSourcesSuccessState ||
              state is SelectedIndexState) {
            HomeCubit.get(context).getNewsData(search);
          }
        },
        builder: (context, state) {
          return NewsTab();
        },
      ),
    );
  }
}
