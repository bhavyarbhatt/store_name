import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:store_name/constants/strings.dart';
import 'package:store_name/models/storeInfo.dart';

class API_Manager{

  Future<StoreModel> getStore() async{

    var client = http.Client();
    var storeModel;

    try{

      var response = await client.get(Strings.store_url);
      if(response.statusCode == 200){
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        storeModel = StoreModel.fromJson(jsonMap);

      }

    }catch(Exception) {
      return storeModel;
    }

    return storeModel;
  }

}