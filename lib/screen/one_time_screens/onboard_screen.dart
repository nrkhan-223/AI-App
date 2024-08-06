import 'package:chatgpt/consts/export.dart';
import 'package:chatgpt/controllers/onboard_controller.dart';
import 'package:chatgpt/models/onbording_models.dart';
import 'package:chatgpt/screen/home_page.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OnboardController());
    var c=PageController();
    final list = [
      Onboard(
          p: 0,
          title: "Asked Me Any Thing!",
          sibtitle: "Asked Me Any Thing And I Will Help You",
          lottie: "asked_me"),
      Onboard(
        p: 1,
        title: "Make Imagination To Reality",
        sibtitle:
            "Just Imagine And Told me I Will Crete Some thing Wonderfully For You",
        lottie: "imagination",
      ),
    ];
    return Scaffold(
        backgroundColor: Colors.orangeAccent.shade100,
        body: Obx(
          () => SizedBox(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (index) {
                    controller.changePage(index);
                  },
                  controller: c,
                  pageSnapping: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset("assets/lottie_file/asked_me.json",
                            height: context.screenHeight * .6),
                        "Asked Me Any Thing!"
                            .text
                            .bold
                            .size(20)
                            .align(TextAlign.center)
                            .blue900
                            .make(),
                        5.heightBox,
                        "Asked Me Any Thing And I Will Help You"
                            .text
                            .align(TextAlign.center)
                            .semiBold
                            .size(15)
                            .blue800
                            .make(),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset("assets/lottie_file/imagination.json",
                            height: context.screenHeight * .5),
                        "Make Imagination To Reality!"
                            .text
                            .align(TextAlign.center)
                            .bold
                            .size(20)
                            .blue900
                            .make(),
                        5.heightBox,
                        SizedBox(
                          width: context.screenWidth * 0.8,
                          child:
                              "Just Imagine And Told me,I Will Crete Some thing Wonderfully For You"
                                  .text
                                  .align(TextAlign.center)
                                  .semiBold
                                  .size(16)
                                  .blue800
                                  .make(),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    bottom: 70,
                    child: DotsIndicator(
                      position: controller.indexs.value.toInt(),
                      dotsCount: 2,
                      reversed: false,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          size: const Size.square(9),
                          activeSize: const Size(18, 9),
                          activeColor: Colors.blue,
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    )),
                Positioned(
                  bottom: 15,
                  child: ElevatedButton(
                    onPressed: () {
                      if(controller.indexs.value!=1){
                        c.nextPage(duration:const Duration(milliseconds: 1200), curve: Curves.bounceOut);
                      }else{
                        Get.offAll(()=>HomePage());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        minimumSize: Size(context.screenWidth * .34, 42)),
                    child: controller.indexs.value == 0
                        ? "NEXT".text.color(Colors.orangeAccent).make()
                        : "FINISH".text.color(Colors.orangeAccent).make(),
                  ),
                ),
                15.heightBox
              ],
            ),
          ),
        ));
  }
}
