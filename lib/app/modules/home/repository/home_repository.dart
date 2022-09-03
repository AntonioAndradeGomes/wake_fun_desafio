import 'package:wakke_fun/app/modules/home/repository/i_home_repository.dart';
import 'package:wakke_fun/app/shared/utils/models/wake.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class HomeRepository extends IHomeRepository {
  @override
  Future<List<Wake>?> getWakes() async {
    try {
      final list = await _parseJsonFromAssets();
      return (list as List).map((e) => Wake.fromJson(e)).toList();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<dynamic> _parseJsonFromAssets() async {
    String data = await rootBundle.loadString('assets/doc/json_wakkefun.json');
    final result = json.decode(data);
    return result;
  }
}
