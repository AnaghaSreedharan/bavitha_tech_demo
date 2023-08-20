import 'package:bavitha_tech_assignment/features/home/home_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  RemoteService._privateConstructor();
  static final RemoteService _instance = RemoteService._privateConstructor();
  factory RemoteService() => _instance;

  static const String baseUrl = 'https://dev.dasubhashitam.com/api/dasubhashitam/v1';

  Future<HomeModel> getBookDetails() async {
    const url = '$baseUrl/titles?titleId=5a046f458ac73f1fc7011296';
    final response = await http.get(Uri.parse(url));
    print(response.body);
    return homeModelFromJson(response.body);
  }

}
