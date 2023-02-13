import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;

import 'package:desafio_gen/utils/constants.dart';

void main() {
  group("api flow test", () {
    test("on - response url mock", () async {
      final response = await http.get(Uri.parse(envBaseURLMock));
      expect(response.statusCode, 200);
    });
    test("not found - response url image", () async {
      final response = await http.get(
          Uri.parse("$envBaseURLImageBackground/df15df56g1FEdds6516s5dfn.jpg"));
      expect(response.statusCode, 404);
    });
    test("on - response url image", () async {
      final response = await http.get(Uri.parse(
          "$envBaseURLImageBackground/yFuKvT4Vm3sKHdFY4eG6I4ldAnn.jpg"));
      expect(response.statusCode, 200);
    });
  });
}
