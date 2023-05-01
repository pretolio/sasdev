// To parse this JSON data, do
//
//     final houseRulesDetailModel = houseRulesDetailModelFromMap(jsonString);

import 'dart:convert';

class HouseRulesDetailModel {
  bool? success;
  Data? data;
  String? message;

  HouseRulesDetailModel({
    this.success,
    this.data,
    this.message,
  });

  factory HouseRulesDetailModel.fromJson(String str) => HouseRulesDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HouseRulesDetailModel.fromMap(Map<String, dynamic> json) => HouseRulesDetailModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "data": data?.toMap(),
    "message": message,
  };
}

class Data {
  int? id;
  String? name;
  int? active;
  int? order;

  Data({
    this.id,
    this.name,
    this.active,
    this.order,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    active: json["active"],
    order: json["order"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "active": active,
    "order": order,
  };
}
