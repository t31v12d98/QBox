import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:qbox/model/account.dart';

class NetworkRequest {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static List<Account> parsePost(String reponseBody) {
    var list = json.decode(reponseBody) as List<dynamic>;
    List<Account> accounts =
        list.map((model) => Account.fromJson(model)).toList();
    return accounts;
  }

  static Future<List<Account>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse('$url'));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}
