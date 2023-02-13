import 'dart:convert';

import 'package:desafio_gen/utils/constants.dart';
import 'package:http/http.dart' as http;

import 'package:desafio_gen/data/models/mcu_model.dart';

import 'package:desafio_gen/data/repositories/mcu/interface.dart';

class McuRepository implements McuInterface {
  @override
  Future<McuModel> getList() async {
    final response = await http.get(Uri.parse(envBaseURLMock));
    if (response.statusCode == 200) {
      var responseData = McuModel.fromMap(jsonDecode(response.body));
      return responseData;
    } else {
      throw Exception("Ocorreu um erro ao requisitar o Mock.");
    }
  }
}
