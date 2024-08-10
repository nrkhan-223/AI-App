import 'package:chatgpt/consts/export.dart';
import 'package:chatgpt/consts/pref.dart';
import 'package:chatgpt/screen/widgets/card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.onboardEnd = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: "AI Assistant".text.blue700.semiBold.size(20).make(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.brightness_4_outlined,
                  color: Colors.blue,
                  size: 27,
                )),
            10.widthBox,
          ],
        ),
        body: ListView(
            padding: const EdgeInsets.only(left:  15.0,right: 15.0, top: 20),
            children: CardType.values
                .map((e) => CardView(
                      cardType: e,
                    ))
                .toList()),
      ),
    );
  }
}
