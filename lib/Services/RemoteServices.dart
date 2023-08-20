
import 'package:bavitha_tech_assignment/features/home/home_model.dart';
import 'package:bavitha_tech_assignment/utils/common_widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/network_check.dart';

class RemoteService {
  RemoteService._privateConstructor();
  static final RemoteService _instance = RemoteService._privateConstructor();
  factory RemoteService() => _instance;

  static const String baseUrl = 'https://dev.dasubhashitam.com/api/dasubhashitam/v1';

  Future<HomeModel?> getBookDetails() async {
    const url = '$baseUrl/titles?titleId=5a046f458ac73f1fc7011296';
    if (await NetworkCheck().check() == true) {
      try {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          return homeModelFromJson(response.body);
        } else {
          throw(response.statusCode);
        }
      } catch (e) {
        return null;
      }
    }else{
      showDialogInternet();
    }

  }
  showDialogInternet(){
    Get.dialog(getRegulaText('Please check your internet connection and try again '));
  }

}
