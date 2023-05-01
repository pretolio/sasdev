
import 'package:flutter/cupertino.dart';

import '../../config.dart';
import '../models/house_rules_detail_model.dart';
import '../models/house_rules_model.dart';
import 'http/http.dart';

class HouseRulesService {
  final HttpCli _httpCli = HttpCli();


  Future<HouseRulesModel?> getHouseRules() async {
    try {
      String endpoint = 'admin/house_rules';
      final result = await _httpCli.get(
          url: Config.urlAPi + endpoint,
          headers: {
            'Authorization' :  Config.token,
            'Content-Type': 'application/json'
          }
      );
      if(result.isSucess){
        final model = HouseRulesModel.fromMap(result.data);
        return model;
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  Future<HouseRulesDetailModel?> getHouseRulesDetail(int id) async {
    try {
      String endpoint = 'admin/house_rules/${id}';
      final result = await _httpCli.get(
          url: Config.urlAPi + endpoint,
          headers: {
            'Authorization' :  Config.token,
            'Content-Type': 'application/json'
          }
      );
      if(result.isSucess){
        final model = HouseRulesDetailModel.fromMap(result.data);
        return model;
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

  Future<Entity?> postHouseRules(String name, bool active) async {
    try {
      String endpoint = 'admin/house_rules';
      final result = await _httpCli.post(
          url: Config.urlAPi + endpoint,
          body: {
            "house_rules": {
              "name": name,
              "active": active ? 1 : 0
            }
          },
          headers: {
            'Authorization' :  Config.token,
            'Content-Type': 'application/json'
          }
      );
      if(result.isSucess){
        Map data = result.data;
        final bool isSucess = data.containsKey('success') ? data['success'] : false;
        if(isSucess){
          Entity model = Entity.fromMap(data['data']);
          return model;
        }
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }


  Future<bool> putHouseRules(int id, String name, bool isActive) async {
    try {
      String endpoint = 'admin/house_rules/${id}';
      final result = await _httpCli.put(
          url: Config.urlAPi + endpoint,
          body: {
            "house_rules": {
              "name": name,
              "active": isActive ? 1 : 0
            }
          },
          headers: {
            'Authorization' :  Config.token,
            'Content-Type': 'application/json'
          }
      );
      if(result.isSucess){
        Map data = result.data;
        final bool model = data.containsKey('success') ? data['success'] : false;
        return model;
      }
    }catch(e){
      debugPrint(e.toString());
    }
    return false;
  }

  Future<bool> delHouseRules(int id) async {
    try {
      String endpoint = 'admin/house_rules/${id}';
      final result = await _httpCli.del(
          url: Config.urlAPi + endpoint,
          headers: {
            'Authorization' :  Config.token,
            'Content-Type': 'application/json'
          }
      );
      if(result.isSucess){
        Map data = result.data;
        final bool model = data.containsKey('success') ? data['success'] : false;
        return model;
      }
    }catch(e){
      debugPrint(e.toString());
    }
    return false;
  }
}