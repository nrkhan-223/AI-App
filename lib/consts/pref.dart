import 'package:chatgpt/consts/export.dart';

class Pref{

  static late Box _box;
  static Future<void> initialize()async{

    Hive.defaultDirectory=(await getApplicationDocumentsDirectory()).path;
    _box=Hive.box(name: "MyData");
  }
 static bool get onboardEnd=>_box.get("onboardEnd",defaultValue: false);
  static set onboardEnd(bool v)=>_box.put("onboardEnd", v);
}