
import 'dart:convert';

import 'package:http/http.dart';

Future login(String email , password) async {

  try{

    Response response = await post(
        Uri.parse('https://admin.agsat.uz/auth/local'),

        body: {
          'identifier' : email,
          'password' : password
        }
    );
    final data = jsonDecode(response.body);
    if(response.statusCode == 200){

      return data["jwt"];


    }else if(response.statusCode>=400&& response.statusCode<500) {
      return "403";


    }
  }catch(e){
    print(e.toString());
  }
}
