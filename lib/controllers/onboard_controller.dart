import 'package:get/get.dart';

class OnboardController extends GetxController{
  var indexs=0.obs;
  changePage(var index)async{
    indexs.value=index;
  }
}