

// To parse this JSON data, do
//
//     final houseRulesModel = houseRulesModelFromMap(jsonString);

import 'dart:convert';

class HouseRulesModel {
  bool? success;
  Data? data;
  String? message;

  HouseRulesModel({
    this.success,
    this.data,
    this.message,
  });

  factory HouseRulesModel.fromJson(String str) => HouseRulesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HouseRulesModel.fromMap(Map<String, dynamic> json) => HouseRulesModel(
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
  List<Entity>? entities;
  Pagination? pagination;

  Data({
    this.entities,
    this.pagination,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    entities: json["entities"] == null ? [] : List<Entity>.from(json["entities"]!.map((x) => Entity.fromMap(x))),
    pagination: json["pagination"] == null ? null : Pagination.fromMap(json["pagination"]),
  );

  Map<String, dynamic> toMap() => {
    "entities": entities == null ? [] : List<dynamic>.from(entities!.map((x) => x.toMap())),
    "pagination": pagination?.toMap(),
  };
}

class Entity {
  int? id;
  String? name;
  int? active;
  int? order;

  Entity({
    this.id,
    this.name,
    this.active,
    this.order,
  });

  factory Entity.fromJson(String str) => Entity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Entity.fromMap(Map<String, dynamic> json) => Entity(
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

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;
  Links? links;

  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(String str) => Pagination.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    links: json["links"] == null ? null : Links.fromMap(json["links"]),
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
    "links": links?.toMap(),
  };
}

class Links {
  dynamic next;
  dynamic prev;

  Links({
    this.next,
    this.prev,
  });

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
    next: json["next"],
    prev: json["prev"],
  );

  Map<String, dynamic> toMap() => {
    "next": next,
    "prev": prev,
  };
}
