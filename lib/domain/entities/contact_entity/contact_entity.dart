import 'dart:convert';
import 'dart:typed_data';

import 'package:contacts_service/contacts_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sicherr/core/utils/phone_formatter.dart';
import 'package:sicherr/domain/entities/rating/rating.dart';

class ContactEntity {
  ContactEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.isEmergency = false,
    this.tags = const [],
    this.ratings = const [],
    this.rating,
    this.image,
  });

  final String id;
  final String name;
  final String phoneNumber;
  final bool isEmergency;
  final List<String> tags;
  final List<Rating> ratings;
  final double? rating;
  final Uint8List? image;

  factory ContactEntity.fromLocalContact(Contact contact) {
    final phoneNumber =
        PhoneFormatter.formatPhone(contact.phones?.first.value ?? '');
    return ContactEntity(
        id: phoneNumber,
        name: contact.displayName ?? '',
        phoneNumber: phoneNumber,
        image: contact.avatar,
        tags: [if (contact.displayName != null) contact.displayName!]);
  }

  factory ContactEntity.fromFirebaseUser(User user) {
    //phone number mustn't be null
    final phoneNumber = user.phoneNumber!;
    return ContactEntity(
      id: phoneNumber,
      name: user.displayName ?? '',
      phoneNumber: phoneNumber,
    );
  }

  factory ContactEntity.fromJson(Map<String, dynamic> json) {
    final String? base64Image = json['imageBase64'];
    return ContactEntity(
      id: json['id'],
      name: json['name'] ?? '',
      phoneNumber: json['phone'] ?? '',
      image: base64Image != null && base64Image.isNotEmpty
          ? base64.decode(base64Image)
          : null,
      isEmergency: json['isEmergencyContact'] ?? false,
      tags: List<String>.from(json['tags'] ?? []),
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJsonSimplified() {
    final imageBase64 = image != null ? base64.encode(image!) : null;
    return {
      'id': id,
      'name': name,
      'phone': phoneNumber,
      'isEmergencyContact': isEmergency,
      'imageBase64': imageBase64,
    };
  }

  Map<String, dynamic> toJson() {
    // final imageBase64 = image != null ? base64.encode(image!) : null;
    return {
      'id': id,
      'name': name,
      'phone': phoneNumber,
      'isEmergencyContact': isEmergency,
      // 'imageBase64': imageBase64,
      'rating': rating,
      'ratings': ratings.map((e) => e.toJson()).toList(),
      'tags': tags,
      'createdAt': DateTime.now(),
    };
  }
}
