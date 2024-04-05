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
  int id = DrawerTab.CategoryId;
  String search = '';
  CategoryModel? model;

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
          // custom drawr
          drawer: DrawerTab(
            onClick: onMenuItemClicked,
          ),
          backgroundColor: Colors.transparent,
          //custom appBars
          appBar: CustomAppBar(
            sKey: key,
            model: model,
            searchIconClicked: SearchIconClicked,
          ),
          // Body will change according to the ID
          body: id == DrawerTab.CategoryId
              ? CategoriesTab(
                  onCategoryClicked: onCategoryClicked)
              : id == DrawerTab.SettingsId
                  ? SettingsTab()
                  : DataTab(
                      categoryId: model!.id,
                      search: search)),
    );
  }

  onCategoryClicked(CategoryModel categoryModel) {
    model = categoryModel;
    search = '';
    id = 0;
    setState(() {});
  }

  onMenuItemClicked(val) {
    if (val == DrawerTab.CategoryId) {
      model = null;
    }
    id = val;
    Navigator.pop(context);
    setState(() {});
  }

  SearchIconClicked(String searchWord) {
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
      search = searchWord;
      id = 0;
      setState(() {});
    }
  }
}
