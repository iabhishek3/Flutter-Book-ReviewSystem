import 'dart:async';
import 'dart:convert';
import 'package:book_rating/util-model/booklist.dart';
import './../constant.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<Booklist>> fetchHomeData() async {
    final response = await http.get(CONSTANTS.HOME_SERVICE_URL);
    if (response.statusCode == 200) {
      List<Booklist> list = parsePostsForHome(response.body);
      print("###reponse::");
      print(list);
      return list;
    } else {
      throw Exception(CONSTANTS.INTERNET_ERROR);
    }
  }

  static List<Booklist> parsePostsForHome(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Booklist>((json) => Booklist.fromJson(json)).toList();
  }
}
