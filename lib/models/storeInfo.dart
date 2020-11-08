
import 'dart:convert';

StoreModel storeModelFromJson(String str) => StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  StoreModel({
    this.status,
    this.result,
    this.message,
    this.recordCount,
  });

  int status;
  List<Result> result;
  String message;
  String recordCount;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    status: json["Status"],
    result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
    message: json["Message"],
    recordCount: json["RecordCount"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Result": List<dynamic>.from(result.map((x) => x.toJson())),
    "Message": message,
    "RecordCount": recordCount,
  };
}

class Result {
  Result({
    this.dealId,
    this.promoCode,
    this.title,
    this.image,
    this.description,
    this.toc,
    this.dealCategoryId,
    this.discount,
    this.currencySymbol,
    this.validityStart,
    this.validityEnd,
    this.dealType,
    this.isFav,
    this.memberTier,
    this.storeId,
    this.storeName,
    this.towerNumber,
    this.categName,
  });

  String dealId;
  String promoCode;
  String title;
  String image;
  String description;
  String toc;
  String dealCategoryId;
  String discount;
  String currencySymbol;
  ValidityStart validityStart;
  ValidityEnd validityEnd;
  String dealType;
  String isFav;
  MemberTier memberTier;
  String storeId;
  String storeName;
  String towerNumber;
  CategName categName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    dealId: json["DealID"],
    promoCode: json["PromoCode"],
    title: json["Title"],
    image: json["Image"],
    description: json["Description"],
    toc: json["TOC"],
    dealCategoryId: json["DealCategoryID"],
    discount: json["Discount"],
    currencySymbol: json["CurrencySymbol"],
    validityStart: validityStartValues.map[json["ValidityStart"]],
    validityEnd: validityEndValues.map[json["ValidityEnd"]],
    dealType: json["DealType"],
    isFav: json["isFav"],
    memberTier: memberTierValues.map[json["MemberTier"]],
    storeId: json["StoreID"],
    storeName: json["StoreName"],
    towerNumber: json["TowerNumber"],
    categName: categNameValues.map[json["CategName"]],
  );

  Map<String, dynamic> toJson() => {
    "DealID": dealId,
    "PromoCode": promoCode,
    "Title": title,
    "Image": image,
    "Description": description,
    "TOC": toc,
    "DealCategoryID": dealCategoryId,
    "Discount": discount,
    "CurrencySymbol": currencySymbol,
    "ValidityStart": validityStartValues.reverse[validityStart],
    "ValidityEnd": validityEndValues.reverse[validityEnd],
    "DealType": dealType,
    "isFav": isFav,
    "MemberTier": memberTierValues.reverse[memberTier],
    "StoreID": storeId,
    "StoreName": storeName,
    "TowerNumber": towerNumber,
    "CategName": categNameValues.reverse[categName],
  };
}

enum CategName { DINING, SHOPPING, SERVICES }

final categNameValues = EnumValues({
  "Dining": CategName.DINING,
  "Services": CategName.SERVICES,
  "Shopping": CategName.SHOPPING
});

enum MemberTier { THE_123 }

final memberTierValues = EnumValues({
  "1,2,3": MemberTier.THE_123
});

enum ValidityEnd { THE_31_DEC_15 }

final validityEndValues = EnumValues({
  "31 Dec '15": ValidityEnd.THE_31_DEC_15
});

enum ValidityStart { THE_10_JUL_15, THE_09_JUL_15 }

final validityStartValues = EnumValues({
  "09 Jul '15": ValidityStart.THE_09_JUL_15,
  "10 Jul '15": ValidityStart.THE_10_JUL_15
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
