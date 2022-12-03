import 'dart:async';
import 'package:http/http.dart' as http;
Future<int> getResult() async {
  final response =
  await http.get(Uri.parse('http://4.show'));
  print(response.statusCode);
  if (response.statusCode == 200) {
    return 200;
  } else {
    return response.statusCode;
  }
}
