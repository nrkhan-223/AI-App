import 'package:chatgpt/consts/export.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../models/message.dart';

class ChatController extends GetxController{
  final textc=TextEditingController();
  final list=<Message>[].obs;


  Future<void> question() async {
    if(textc.text.trim().isNotEmpty){
      list.add(Message(messageType: MessageType.user, msg: textc.text));

      var res= await Api.getAnswer(textc.text);

      list.add(Message(messageType: MessageType.bot, msg: res));
      textc.clear();
    }
  }

}
