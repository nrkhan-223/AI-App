import 'package:chatgpt/consts/export.dart';
import 'package:chatgpt/screen/widgets/loading_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../controllers/translate_controller.dart';
import '../widgets/bottomsheet_laguege.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  var controller = Get.put(TranslateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: "TRANSLATOR".text.make(),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal),
          padding: EdgeInsets.only(
              top: context.screenHeight * 0.03,
              bottom: context.screenHeight * 0.05,
              left: context.screenWidth * 0.04,
              right: context.screenWidth * 0.04),
          child: Column(
            children: [
              Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: context.screenWidth * 0.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue)),
                      child: controller.from.isEmpty
                          ? "From".text.blue700.makeCentered()
                          : controller.from.value.text.makeCentered(),
                    ).onTap(() {
                      Get.bottomSheet(
                          LanguageSheet(c: controller, s: controller.from));
                    }),
                    IconButton(
                        onPressed: () {
                          controller.swapLanguages();
                        },
                        icon: Icon(
                          CupertinoIcons.repeat,
                          color: controller.to.isNotEmpty &&
                                  controller.from.isNotEmpty
                              ? Colors.blue
                              : Colors.grey,
                        )),
                    Container(
                      height: 50,
                      width: context.screenWidth * 0.32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue)),
                      child: controller.to.isEmpty
                          ? "To".text.makeCentered()
                          : controller.to.value.text.makeCentered(),
                    ).onTap(() {
                      Get.bottomSheet(
                          LanguageSheet(c: controller, s: controller.to));
                    }),
                  ],
                ),
              ),
              20.heightBox,
              TextField(
                maxLines: 5,
                controller: controller.textC,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                           BorderSide(color: Colors.orange.shade500, width: 1.2),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(
                        width: 1.2,
                        color: Colors.orange.shade500,
                      ),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      )),
                  hintText: 'Enter your Text...',
                ),
              ),
              20.heightBox,
              _translateResult(),
              30.heightBox,
              ElevatedButton(
                  onPressed: controller.googleTranslate,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade400),
                  child: "TRANSLATE".text.white.make())
            ],
          ),
        ));
  }

  Widget _translateResult() => switch (controller.status.value) {
        Status.none => const SizedBox(),
        Status.complete => TextFormField(
          controller: controller.resultC,
          maxLines: null,
          onTapOutside: (e) => FocusScope.of(context).unfocus(),
          decoration:  InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.blue, width: 1.2),
                  borderRadius: BorderRadius.circular(
                    15.0,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderSide:  const BorderSide(
                    width: 1.2,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(
                    15.0,
                  )),
          ),
        ),
        Status.loading => const Align(child: LoadingScreens())
      };
}
