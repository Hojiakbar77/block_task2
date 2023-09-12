import 'dart:convert';

import 'package:http/http.dart';

Future addCart(String cartName ,String cartNumber, String cartDate) async {
  try {
    Response response = await post(
      Uri.parse('https://fir-app-35c83-default-rtdb.firebaseio.com/email.json'),
      body: jsonEncode({"name":cartName,"email": cartNumber, "password": cartDate}),
    );

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data["jwt"];
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      return "sjsj";
    }
  } catch (e) {
    print(e.toString());
  }
}
