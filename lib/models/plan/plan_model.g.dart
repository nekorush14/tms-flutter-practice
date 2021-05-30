// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Plan _$_$_PlanFromJson(Map<String, dynamic> json) {
  return _$_Plan(
    id: json['id'] as String?,
    title: json['title'] as String,
    category: json['category'] as String,
    description: json['description'] as String,
    startAt: json['startAt'] == null
        ? null
        : DateTime.parse(json['startAt'] as String),
    endAt:
        json['endAt'] == null ? null : DateTime.parse(json['endAt'] as String),
    createUser: json['createUser'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updateUser: json['updateUser'] as String?,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    isObtained: json['isObtained'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_PlanToJson(_$_Plan instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'description': instance.description,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'createUser': instance.createUser,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updateUser': instance.updateUser,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isObtained': instance.isObtained,
    };
