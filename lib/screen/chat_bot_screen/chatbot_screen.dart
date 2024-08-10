import 'package:chatgpt/consts/export.dart';
import 'package:chatgpt/controllers/chat_controller.dart';
import 'package:chatgpt/screen/chat_bot_screen/message_card.dart';
import 'package:get/get_instance/get_instance.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  var controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "AI CHAT".text.semiBold.make(),
        ),
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(

            children: [
              Expanded(
                child: TextField(
                  controller: controller.textc,
                  onTapOutside: (e) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.orange.shade500, width: 2.0),
                        borderRadius: BorderRadius.circular(
                          30.0,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          30.0,
                        )),
                    hintText: 'Enter your message',
                  ),
                ),
              ),
              7.widthBox,
              IconButton(
                      icon: const Icon(
                        Icons.rocket_launch,
                        color: Colors.blue,
                        size: 35,
                      ),
                      onPressed: () {
                        controller.question();
                      })
                  .box
                  .size(50, 50)
                  .roundedFull
                  .color(Colors.orange.shade400)
                  .make(),
            ],
          ),
        ),
        body: SizedBox(
          height: context.screenHeight * .773,
          child: Obx(
            () => ListView(
              children:
                  controller.list.map((e) => MessageCard(message: e)).toList(),
            ),
          ),
        ));
  }
}
