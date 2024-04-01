import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/categories_tab.dart';
import 'package:news_app/screens/data_tab.dart';
import 'package:news_app/screens/drawer_tab.dart';

import '../screens/settings_tab.dart';
import '../screens/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchWord = '';
  int id = DrawerTab.CategoryId;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> key = GlobalKey();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/news_background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          key: key,
          drawer: DrawerTab(
            onClick: onMenuItemClicked,
          ),
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            sKey: key,
            model: model,
            searchIconClicked: SearchIconClicked,
          ),
          body: id == DrawerTab.CategoryId
              ? CategoriesTab(
                  onCategoryClicked: onCategoryClicked)
              : id == DrawerTab.SettingsId
                  ? SettingsTab()
                  : DataTab(
                      categoryId: model!.id,
                      search: searchWord)),
    );
  }

  CategoryModel? model;

  onCategoryClicked(CategoryModel categoryModel) {
    model = categoryModel;
    id = 0;
    setState(() {});
  }

  onMenuItemClicked(val) {
    searchWord = '';
    if (val == DrawerTab.CategoryId) {
      model = null;
    }
    id = val;
    Navigator.pop(context);
    setState(() {});
  }

  SearchIconClicked(String search) {
    if (model == null) {
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Container(
              height: 100,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(30))),
              child: Center(
                child: Text(
                  'Please Select a Category First',
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      );
      return;
    } else {
      id = 0;
      searchWord = search;
      setState(() {});
    }
  }
}
