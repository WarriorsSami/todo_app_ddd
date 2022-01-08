// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'domain_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DomainUserTearOff {
  const _$DomainUserTearOff();

  _DomainUser call({required UniqueId id}) {
    return _DomainUser(
      id: id,
    );
  }
}

/// @nodoc
const $DomainUser = _$DomainUserTearOff();

/// @nodoc
mixin _$DomainUser {
  UniqueId get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DomainUserCopyWith<DomainUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DomainUserCopyWith<$Res> {
  factory $DomainUserCopyWith(
          DomainUser value, $Res Function(DomainUser) then) =
      _$DomainUserCopyWithImpl<$Res>;
  $Res call({UniqueId id});
}

/// @nodoc
class _$DomainUserCopyWithImpl<$Res> implements $DomainUserCopyWith<$Res> {
  _$DomainUserCopyWithImpl(this._value, this._then);

  final DomainUser _value;
  // ignore: unused_field
  final $Res Function(DomainUser) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc
abstract class _$DomainUserCopyWith<$Res> implements $DomainUserCopyWith<$Res> {
  factory _$DomainUserCopyWith(
          _DomainUser value, $Res Function(_DomainUser) then) =
      __$DomainUserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id});
}

/// @nodoc
class __$DomainUserCopyWithImpl<$Res> extends _$DomainUserCopyWithImpl<$Res>
    implements _$DomainUserCopyWith<$Res> {
  __$DomainUserCopyWithImpl(
      _DomainUser _value, $Res Function(_DomainUser) _then)
      : super(_value, (v) => _then(v as _DomainUser));

  @override
  _DomainUser get _value => super._value as _DomainUser;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_DomainUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$_DomainUser implements _DomainUser {
  const _$_DomainUser({required this.id});

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'DomainUser(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DomainUser &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$DomainUserCopyWith<_DomainUser> get copyWith =>
      __$DomainUserCopyWithImpl<_DomainUser>(this, _$identity);
}

abstract class _DomainUser implements DomainUser {
  const factory _DomainUser({required UniqueId id}) = _$_DomainUser;

  @override
  UniqueId get id;
  @override
  @JsonKey(ignore: true)
  _$DomainUserCopyWith<_DomainUser> get copyWith =>
      throw _privateConstructorUsedError;
}
