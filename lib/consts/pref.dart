import 'package:chatgpt/consts/export.dart';
import 'package:hive_flutter/adapters.dart';

class Pref {
  static late Box _box;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('myData');
  }

  static bool get onboardEnd => _box.get("onboardEnd", defaultValue: false);

  static set onboardEnd(bool v) => _box.put("onboardEnd", v);
}
