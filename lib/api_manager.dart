import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled16/newsmodule.dart';

class ApiManager{

  Future<NewsModule> getData() async{

    var client = http.Client();
    var model = null;

    try {
        var url = Uri.parse(
            'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8a2af2eb24fe43b591e567798fdf441c');
        var response = await client.get(url);

        if (response.statusCode == 200) {
          var jsonString = response.body;
          var jsonMap = json.decode(jsonString);
          model = NewsModule.fromJson(jsonMap);
        }
    }

    catch(Exception){
      return model;
    }

    return model;
    
    
  }

}