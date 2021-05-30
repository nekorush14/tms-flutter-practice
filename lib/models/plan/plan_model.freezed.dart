// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return _Plan.fromJson(json);
}

/// @nodoc
class _$PlanTearOff {
  const _$PlanTearOff();

  _Plan call(
      {String? id,
      required String title,
      required String category,
      required String description,
      DateTime? startAt,
      DateTime? endAt,
      String? createUser,
      DateTime? createdAt,
      String? updateUser,
      DateTime? updatedAt,
      bool isObtained = false}) {
    return _Plan(
      id: id,
      title: title,
      category: category,
      description: description,
      startAt: startAt,
      endAt: endAt,
      createUser: createUser,
      createdAt: createdAt,
      updateUser: updateUser,
      updatedAt: updatedAt,
      isObtained: isObtained,
    );
  }

  Plan fromJson(Map<String, Object> json) {
    return Plan.fromJson(json);
  }
}

/// @nodoc
const $Plan = _$PlanTearOff();

/// @nodoc
mixin _$Plan {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get startAt => throw _privateConstructorUsedError;
  DateTime? get endAt => throw _privateConstructorUsedError;
  String? get createUser => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get updateUser => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  bool get isObtained => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlanCopyWith<Plan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanCopyWith<$Res> {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) then) =
      _$PlanCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String title,
      String category,
      String description,
      DateTime? startAt,
      DateTime? endAt,
      String? createUser,
      DateTime? createdAt,
      String? updateUser,
      DateTime? updatedAt,
      bool isObtained});
}

/// @nodoc
class _$PlanCopyWithImpl<$Res> implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._value, this._then);

  final Plan _value;
  // ignore: unused_field
  final $Res Function(Plan) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? createUser = freezed,
    Object? createdAt = freezed,
    Object? updateUser = freezed,
    Object? updatedAt = freezed,
    Object? isObtained = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createUser: createUser == freezed
          ? _value.createUser
          : createUser // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateUser: updateUser == freezed
          ? _value.updateUser
          : updateUser // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isObtained: isObtained == freezed
          ? _value.isObtained
          : isObtained // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PlanCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$PlanCopyWith(_Plan value, $Res Function(_Plan) then) =
      __$PlanCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String title,
      String category,
      String description,
      DateTime? startAt,
      DateTime? endAt,
      String? createUser,
      DateTime? createdAt,
      String? updateUser,
      DateTime? updatedAt,
      bool isObtained});
}

/// @nodoc
class __$PlanCopyWithImpl<$Res> extends _$PlanCopyWithImpl<$Res>
    implements _$PlanCopyWith<$Res> {
  __$PlanCopyWithImpl(_Plan _value, $Res Function(_Plan) _then)
      : super(_value, (v) => _then(v as _Plan));

  @override
  _Plan get _value => super._value as _Plan;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? startAt = freezed,
    Object? endAt = freezed,
    Object? createUser = freezed,
    Object? createdAt = freezed,
    Object? updateUser = freezed,
    Object? updatedAt = freezed,
    Object? isObtained = freezed,
  }) {
    return _then(_Plan(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: startAt == freezed
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endAt: endAt == freezed
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createUser: createUser == freezed
          ? _value.createUser
          : createUser // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updateUser: updateUser == freezed
          ? _value.updateUser
          : updateUser // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isObtained: isObtained == freezed
          ? _value.isObtained
          : isObtained // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Plan extends _Plan with DiagnosticableTreeMixin {
  const _$_Plan(
      {this.id,
      required this.title,
      required this.category,
      required this.description,
      this.startAt,
      this.endAt,
      this.createUser,
      this.createdAt,
      this.updateUser,
      this.updatedAt,
      this.isObtained = false})
      : super._();

  factory _$_Plan.fromJson(Map<String, dynamic> json) =>
      _$_$_PlanFromJson(json);

  @override
  final String? id;
  @override
  final String title;
  @override
  final String category;
  @override
  final String description;
  @override
  final DateTime? startAt;
  @override
  final DateTime? endAt;
  @override
  final String? createUser;
  @override
  final DateTime? createdAt;
  @override
  final String? updateUser;
  @override
  final DateTime? updatedAt;
  @JsonKey(defaultValue: false)
  @override
  final bool isObtained;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Plan(id: $id, title: $title, category: $category, description: $description, startAt: $startAt, endAt: $endAt, createUser: $createUser, createdAt: $createdAt, updateUser: $updateUser, updatedAt: $updatedAt, isObtained: $isObtained)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Plan'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('startAt', startAt))
      ..add(DiagnosticsProperty('endAt', endAt))
      ..add(DiagnosticsProperty('createUser', createUser))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updateUser', updateUser))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('isObtained', isObtained));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Plan &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.startAt, startAt) ||
                const DeepCollectionEquality()
                    .equals(other.startAt, startAt)) &&
            (identical(other.endAt, endAt) ||
                const DeepCollectionEquality().equals(other.endAt, endAt)) &&
            (identical(other.createUser, createUser) ||
                const DeepCollectionEquality()
                    .equals(other.createUser, createUser)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updateUser, updateUser) ||
                const DeepCollectionEquality()
                    .equals(other.updateUser, updateUser)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.isObtained, isObtained) ||
                const DeepCollectionEquality()
                    .equals(other.isObtained, isObtained)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(startAt) ^
      const DeepCollectionEquality().hash(endAt) ^
      const DeepCollectionEquality().hash(createUser) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updateUser) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(isObtained);

  @JsonKey(ignore: true)
  @override
  _$PlanCopyWith<_Plan> get copyWith =>
      __$PlanCopyWithImpl<_Plan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlanToJson(this);
  }
}

abstract class _Plan extends Plan {
  const factory _Plan(
      {String? id,
      required String title,
      required String category,
      required String description,
      DateTime? startAt,
      DateTime? endAt,
      String? createUser,
      DateTime? createdAt,
      String? updateUser,
      DateTime? updatedAt,
      bool isObtained}) = _$_Plan;
  const _Plan._() : super._();

  factory _Plan.fromJson(Map<String, dynamic> json) = _$_Plan.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get category => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  DateTime? get startAt => throw _privateConstructorUsedError;
  @override
  DateTime? get endAt => throw _privateConstructorUsedError;
  @override
  String? get createUser => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updateUser => throw _privateConstructorUsedError;
  @override
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @override
  bool get isObtained => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlanCopyWith<_Plan> get copyWith => throw _privateConstructorUsedError;
}
