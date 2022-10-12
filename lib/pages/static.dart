library my_prj.globals;

import 'package:shared_preferences/shared_preferences.dart';

int roll = 0;
int logState = 0;
int signState = 0;
String? accessToken;

setToken(String t) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  preferences.setString('accessToken', t);
  var x = preferences.getString('accessToken');
}

setLog() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt('logState', 1);
  var y = preferences.getInt('logState');
  print(y);
}

setSign() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt('signState', 1);
}

setRoll(int r) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt('roll', r);
  var e = preferences.getInt('roll');
  print(e);
}
