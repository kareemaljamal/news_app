import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static SharedPreferences? sharedPreferences;
  static getInst() async {
    print('pref not yet');

    sharedPreferences =
        await SharedPreferences.getInstance();
    print('pref initiated');
  }

  static Future<void> setSourceId(String source) async {
    if (sharedPreferences == null) {
      print('sh null');
      getInst();
    }
    sharedPreferences!.setString('source', source);
  }

  String getSourceId() {
    return sharedPreferences!.getString('source') ?? '';
  }
}
