

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../data/models/house_rules_model.dart';
import '../../data/services/house_rules_service.dart';
import '../widgets/custom_snackbar.dart';

class HomeController extends ChangeNotifier {
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final HouseRulesService _service = HouseRulesService();

  HomeController(){
    getListHouseRules();
  }


  int _currentPage = 1;
  int get currentPage => _currentPage;
  set currentPage(int value){
    _currentPage = value;
    notifyListeners();
  }

  int _itemsPerPage = 10;

  List<Entity> _listEntity = [];
  List<Entity> get listEntity {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    int endIndex = startIndex + _itemsPerPage;
    endIndex = _listEntity.length < endIndex ?  _listEntity.length  : endIndex;
    return _listEntity.sublist(startIndex, endIndex);
  }

  int get numPages => (_listEntity.length / _itemsPerPage).ceil();


  Future<void> getListHouseRules() async {
    try {
      final newItems = await _service.getHouseRules();
      _listEntity = newItems?.data?.entities ?? [];
      _listEntity.sort((a,b) => a.order!.compareTo(b.order!));
      notifyListeners();
    } catch (error) {

    }
  }

  Future<void> addHouseRules( String name, bool isActive) async {
    try {
      final newItem = await _service.postHouseRules(name, isActive);

      if(newItem != null){
        _listEntity.add(newItem);
        notifyListeners();
        CustomSnackbar.priKey(text: 'House Rules add Successful!',
            key: scaffoldKey, color: Colors.green,
            icon: Icon(Icons.check, color: Colors.white,));
      } else {
        CustomSnackbar.priKey(text: 'Unable to add House Rules. Try again!',
            key: scaffoldKey, color: Colors.red);
      }
    } catch (error) {
      CustomSnackbar.priKey(
          text: 'Unable to add House Rules. Try again!',
          key: scaffoldKey, color: Colors.red);
    }
  }

  Future<void> updateHouseRules(int id, String name, bool isActive) async {
    try {
      final result = await _service.putHouseRules(id, name, isActive);

      if(result){
        _listEntity.forEach((element) {
          if(element.id == id){
            element.active = isActive ? 1 : 0;
            element.name = name;
          }
        });
        notifyListeners();
        CustomSnackbar.priKey(text: 'House Rules Update Successful!',
            key: scaffoldKey, color: Colors.green, icon: Icon(Icons.check, color: Colors.white,));
      } else {
        CustomSnackbar.priKey(text: 'Unable to update House Rules, please try again!',
            key: scaffoldKey, color: Colors.red);
      }
    } catch (error) {
      CustomSnackbar.priKey(
          text: 'Unable to update House Rules, please try again!',
          key: scaffoldKey, color: Colors.red);
    }
  }

  Future<void> deleteHouseRules(int id) async {
    try {
      final result = await _service.delHouseRules(id);

      if(result){
        _listEntity.removeWhere((element) => element.id == id);
        notifyListeners();
        CustomSnackbar.priKey(text: 'House rules deleted successfully!',
            key: scaffoldKey, color: Colors.green, icon: Icon(Icons.check, color: Colors.white,));
      } else {
        CustomSnackbar.priKey(text: 'Unable to delete House Rules. Try again!',
            key: scaffoldKey, color: Colors.red);
      }
    } catch (error) {
      CustomSnackbar.priKey(
          text: 'Unable to delete House Rules. Try again!',
          key: scaffoldKey, color: Colors.red);
    }
  }
}