import 'dart:convert';

import 'package:resume_app/domain/entities/contact_model.dart';

class ContactEntity {
  final String contactName;
  final String contactDesc;
  final String imageUrl;
  final String targetUrl;

  const ContactEntity({
    required this.contactName,
    required this.contactDesc,
    required this.imageUrl,
    required this.targetUrl
  });


  factory ContactEntity.fromJson(String str) => ContactEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContactEntity.fromMap(Map<String, dynamic> json) => ContactEntity(
    contactName: json["contactName"] ?? "",
    contactDesc: json["contactDesc"] ?? "",
    imageUrl: json["imageUrl"] ?? "",
    targetUrl: json["targetUrl"] ?? ""
  );

  Map<String, dynamic> toMap() => {
    "contactName": contactName,
    "contactDesc": contactDesc,
    "imageUrl": imageUrl,
    "targetUrl": targetUrl,
  };
}

extension ProjectEntityMapper on ContactEntity {
  ContactModel toModel() {
    return ContactModel(
      contactName: contactName, 
      contactDesc: contactDesc, 
      imageUrl: imageUrl,
      targetUrl: targetUrl
    );
  }
}