import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CustomAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  CustomAppBar(
      {super.key,
      this.model,
      required this.sKey,
      required this.searchIconClicked});

  Function searchIconClicked;
  final GlobalKey<ScaffoldState> sKey;
  CategoryModel? model;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  TextEditingController searchController =
      TextEditingController();

  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return isSearching
        ? Container(
            height: 90,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.only(
                  top: 35, bottom: 10, right: 20, left: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        isSearching = false;
                        setState(() {});
                      },
                      child: Text(
                        'X',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15.0),
                        child: TextField(
                          onSubmitted: (value) {
                            widget.searchIconClicked(
                                searchController.text);
                          },
                          controller: searchController,
                          enableSuggestions: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20),
                              hintText: 'search',
                              hintStyle: TextStyle(
                                  color: Colors.green)),
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          print(searchController.text);

                          widget.searchIconClicked(
                              searchController.text);
                        },
                        child: Icon(Icons.search)),
                  ],
                ),
              ),
            ),
          )
        : AppBar(
            leading: InkWell(
                onTap: () {
                  widget.sKey.currentState!.openDrawer();
                },
                child: Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.white,
                )),
            title: Text(
              widget.model == null
                  ? "News"
                  : widget.model!.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.green,
            shape: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      isSearching = true;
                      setState(() {});
                    },
                    child: Icon(
                      size: 30,
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
            ],
          );
  }
}
