import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  DrawerTab({required this.onClick, super.key});
  Function onClick;

  static int CategoryId = 1;
  static int SettingsId = 2;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width / 1.7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Color(0XFF39A552),
            height: 110,
            width: width,
            child: Center(
                child: Text(
              'News App',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
          ),
          InkWell(
            onTap: () {
              onClick(CategoryId);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(
                    AssetImage(
                        'assets/icons/menu_categories.png'),
                    size: 40,
                  ),
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              onClick(SettingsId);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(
                    AssetImage('assets/icons/settings.png'),
                    size: 40,
                  ),
                ),
                Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
