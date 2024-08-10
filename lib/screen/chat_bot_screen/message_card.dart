import 'package:chatgpt/consts/export.dart';
import 'package:chatgpt/models/message.dart';
import 'package:get/get_utils/get_utils.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
        message.messageType == MessageType.user ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if(message.messageType == MessageType.bot)
          Image.asset(
            "assets/icons/robot.png",
            scale: 15,
          ).paddingOnly(top: 12),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7),
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7),
            decoration: BoxDecoration(
              color: message.messageType == MessageType.user
                  ? Colors.orange.shade100
                  : Colors.blue.shade100,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(15.0),
                topRight: const Radius.circular(15.0),
                bottomLeft: message.messageType == MessageType.user
                    ? const Radius.circular(15.0)
                    : const Radius.circular(0.0),
                bottomRight: message.messageType == MessageType.user
                    ? const Radius.circular(0.0)
                    : const Radius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  message.msg,
                  style: TextStyle(
                    color: message.messageType ==MessageType.user
                        ? Colors.blue.shade900
                        : Colors.orange.shade900,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          if(message.messageType == MessageType.user)
            Image.asset(
              "assets/usericon/girl.png",
              scale: 13,
            ).paddingOnly(top: 12),
        ],
      ),
    );
  }
}
