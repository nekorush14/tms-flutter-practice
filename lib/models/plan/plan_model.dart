import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'plan_model.freezed.dart';

part 'plan_model.g.dart';

@freezed
abstract class Plan implements _$Plan {
  const Plan._();

  const factory Plan({
    String? id,
    required String title,
    required String category,
    required String description,
    DateTime? startAt,
    DateTime? endAt,
    String? createUser,
    DateTime? createdAt,
    String? updateUser,
    DateTime? updatedAt,
    @Default(false) bool isObtained,
  }) = _Plan;

  factory Plan.empty() => Plan(
        title: '',
        category: '',
        description: '',
        startAt: null,
        endAt: null,
        createUser: '',
        createdAt: null,
        updateUser: '',
        updatedAt: null,
      );

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  factory Plan.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Plan.fromJson(data).copyWith(id: doc.id);
    // return Plan(
    //   id: doc.id,
    //   title: data['title'] ?? '',
    //   description: data['description'] ?? '',
    //   category: data['category'] ?? '',
    //   startAt: data['startAt'] ?? null,
    //   endAt: data['endAt'] ?? null,
    //   createUser: data['createUser'] ?? '',
    //   createdAt: data['createdAt'] ?? DateTime.now(),
    //   updateUser: data['updateUser'] ?? '',
    //   updatedAt: data['updatedAt'] ?? DateTime.now(),
    // );
  }

  Map<String, dynamic> toDocument() => toJson()..remove('id');
}
