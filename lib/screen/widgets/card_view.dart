import 'package:chatgpt/consts/export.dart';
import 'package:chatgpt/screen/chat_bot_screen/chatbot_screen.dart';
import 'package:chatgpt/screen/image_genarator/image_screen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../languege_translator/languege_screen.dart';

enum CardType { aiChatBot, aiImage, aiTranslator }

extension MyCardType on CardType {
  String get title => switch (this) {
        CardType.aiChatBot => "AI CHAT BOT",
        CardType.aiImage => "AI IMAGE CREATE",
        CardType.aiTranslator => "AI TRANSLATOR"
      };

  String get lottie => switch (this) {
        CardType.aiChatBot => "ai_bot",
        CardType.aiImage => "circle",
        CardType.aiTranslator => "ai_chat_bot"
      };

  bool get alain => switch (this) {
        CardType.aiChatBot => true,
        CardType.aiImage => false,
        CardType.aiTranslator => true
      };

  VoidCallback get ontap => switch (this) {
        CardType.aiChatBot => () => Get.to(() => const ChatBotScreen()),
        CardType.aiImage => () => Get.to(() => const ImageGeneratorScreen()),
        CardType.aiTranslator => () => Get.to(() => const LanguageScreen())
      };
}

class CardView extends StatelessWidget {
  final CardType cardType;

  const CardView({super.key, required this.cardType});

  @override
  Widget build(BuildContext context) {
    // Animate.restartOnHotReload=true;
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      color: Colors.blue.shade200,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 0,
      child: InkWell(
        onTap: cardType.ontap,
        borderRadius: BorderRadius.circular(15),
        child: cardType.alain
            ? Row(
                children: [
                  if (cardType.index == 2) 15.widthBox,
                  Lottie.asset("assets/lottie_file/${cardType.lottie}.json",
                      width: cardType.index == 2
                          ? context.screenWidth * .32
                          : context.screenWidth * .43),
                  const Spacer(),
                  cardType.title.text.semiBold
                      .size(18)
                      .color(Colors.blueAccent.shade700)
                      .make(),
                  const Spacer(
                    flex: 1,
                  )
                ],
              )
            : Row(
                children: [
                  const Spacer(),
                  cardType.title.text.semiBold
                      .size(18)
                      .color(Colors.blueAccent.shade700)
                      .make(),
                  const Spacer(
                    flex: 1,
                  ),
                  Lottie.asset("assets/lottie_file/${cardType.lottie}.json",
                      width: context.screenWidth * .35),
                ],
              ),
      ),
    ).animate().scale(duration: 1.seconds, curve: Curves.fastOutSlowIn);
  }
}
