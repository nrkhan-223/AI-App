import 'package:chatgpt/consts/export.dart';

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
}

class CardView extends StatelessWidget {
  final CardType cardType;

  const CardView({super.key, required this.cardType});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      color: Colors.blue.shade200,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 0,
      child: cardType.alain
          ? Row(
              children: [
                if(cardType.index==2)
                15.widthBox,
                Lottie.asset("assets/lottie_file/${cardType.lottie}.json",
                    width:cardType.index==2? context.screenWidth * .32:context.screenWidth*.43),
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
                const Spacer(flex: 1,),
                Lottie.asset("assets/lottie_file/${cardType.lottie}.json",
                    width: context.screenWidth * .35),
              ],
            ),
    );
  }
}
