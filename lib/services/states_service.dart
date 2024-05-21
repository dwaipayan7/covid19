import 'dart:convert';

import 'package:covid19/Utils/app_url.dart';
import 'package:http/http.dart' as http;

import '../Models/WorldStatesModel.dart';


class StatesServices {

    Future<WorldStatesModel> fetchWorldStatesRecords() async{

      final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

      if(response.statusCode == 200){

        var data = jsonDecode(response.body);
        return WorldStatesModel.fromJson(data);
      }else{
            throw Exception("Error");
      }

    }

}