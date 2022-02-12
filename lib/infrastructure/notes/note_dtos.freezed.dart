// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteDTO _$NoteDTOFromJson(Map<String, dynamic> json) {
  return _NoteDTO.fromJson(json);
}

/// @nodoc
class _$NoteDTOTearOff {
  const _$NoteDTOTearOff();

  _NoteDTO call(
      {@JsonKey(ignore: true) String? id,
      required String body,
      required int color,
      required List<TodoItemDTO> todos,
      @ServerTimeStampConverter() required FieldValue serverTimeStamp}) {
    return _NoteDTO(
      id: id,
      body: body,
      color: color,
      todos: todos,
      serverTimeStamp: serverTimeStamp,
    );
  }

  NoteDTO fromJson(Map<String, Object?> json) {
    return NoteDTO.fromJson(json);
  }
}

/// @nodoc
const $NoteDTO = _$NoteDTOTearOff();

/// @nodoc
mixin _$NoteDTO {
// ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  List<TodoItemDTO> get todos => throw _privateConstructorUsedError;
  @ServerTimeStampConverter()
  FieldValue get serverTimeStamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteDTOCopyWith<NoteDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDTOCopyWith<$Res> {
  factory $NoteDTOCopyWith(NoteDTO value, $Res Function(NoteDTO) then) =
      _$NoteDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String body,
      int color,
      List<TodoItemDTO> todos,
      @ServerTimeStampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class _$NoteDTOCopyWithImpl<$Res> implements $NoteDTOCopyWith<$Res> {
  _$NoteDTOCopyWithImpl(this._value, this._then);

  final NoteDTO _value;
  // ignore: unused_field
  final $Res Function(NoteDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? color = freezed,
    Object? todos = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoItemDTO>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc
abstract class _$NoteDTOCopyWith<$Res> implements $NoteDTOCopyWith<$Res> {
  factory _$NoteDTOCopyWith(_NoteDTO value, $Res Function(_NoteDTO) then) =
      __$NoteDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String body,
      int color,
      List<TodoItemDTO> todos,
      @ServerTimeStampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class __$NoteDTOCopyWithImpl<$Res> extends _$NoteDTOCopyWithImpl<$Res>
    implements _$NoteDTOCopyWith<$Res> {
  __$NoteDTOCopyWithImpl(_NoteDTO _value, $Res Function(_NoteDTO) _then)
      : super(_value, (v) => _then(v as _NoteDTO));

  @override
  _NoteDTO get _value => super._value as _NoteDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? body = freezed,
    Object? color = freezed,
    Object? todos = freezed,
    Object? serverTimeStamp = freezed,
  }) {
    return _then(_NoteDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoItemDTO>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp // ignore: cast_nullable_to_non_nullable
              as FieldValue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NoteDTO extends _NoteDTO {
  const _$_NoteDTO(
      {@JsonKey(ignore: true) this.id,
      required this.body,
      required this.color,
      required this.todos,
      @ServerTimeStampConverter() required this.serverTimeStamp})
      : super._();

  factory _$_NoteDTO.fromJson(Map<String, dynamic> json) =>
      _$$_NoteDTOFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String body;
  @override
  final int color;
  @override
  final List<TodoItemDTO> todos;
  @override
  @ServerTimeStampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'NoteDTO(id: $id, body: $body, color: $color, todos: $todos, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NoteDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.body, body) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.todos, todos) &&
            const DeepCollectionEquality()
                .equals(other.serverTimeStamp, serverTimeStamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(body),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(todos),
      const DeepCollectionEquality().hash(serverTimeStamp));

  @JsonKey(ignore: true)
  @override
  _$NoteDTOCopyWith<_NoteDTO> get copyWith =>
      __$NoteDTOCopyWithImpl<_NoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoteDTOToJson(this);
  }
}

abstract class _NoteDTO extends NoteDTO {
  const factory _NoteDTO(
          {@JsonKey(ignore: true) String? id,
          required String body,
          required int color,
          required List<TodoItemDTO> todos,
          @ServerTimeStampConverter() required FieldValue serverTimeStamp}) =
      _$_NoteDTO;
  const _NoteDTO._() : super._();

  factory _NoteDTO.fromJson(Map<String, dynamic> json) = _$_NoteDTO.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(ignore: true)
  String? get id;
  @override
  String get body;
  @override
  int get color;
  @override
  List<TodoItemDTO> get todos;
  @override
  @ServerTimeStampConverter()
  FieldValue get serverTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$NoteDTOCopyWith<_NoteDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

TodoItemDTO _$TodoItemDTOFromJson(Map<String, dynamic> json) {
  return _TodoItemDTO.fromJson(json);
}

/// @nodoc
class _$TodoItemDTOTearOff {
  const _$TodoItemDTOTearOff();

  _TodoItemDTO call(
      {required String id, required String name, required bool done}) {
    return _TodoItemDTO(
      id: id,
      name: name,
      done: done,
    );
  }

  TodoItemDTO fromJson(Map<String, Object?> json) {
    return TodoItemDTO.fromJson(json);
  }
}

/// @nodoc
const $TodoItemDTO = _$TodoItemDTOTearOff();

/// @nodoc
mixin _$TodoItemDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoItemDTOCopyWith<TodoItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemDTOCopyWith<$Res> {
  factory $TodoItemDTOCopyWith(
          TodoItemDTO value, $Res Function(TodoItemDTO) then) =
      _$TodoItemDTOCopyWithImpl<$Res>;
  $Res call({String id, String name, bool done});
}

/// @nodoc
class _$TodoItemDTOCopyWithImpl<$Res> implements $TodoItemDTOCopyWith<$Res> {
  _$TodoItemDTOCopyWithImpl(this._value, this._then);

  final TodoItemDTO _value;
  // ignore: unused_field
  final $Res Function(TodoItemDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$TodoItemDTOCopyWith<$Res>
    implements $TodoItemDTOCopyWith<$Res> {
  factory _$TodoItemDTOCopyWith(
          _TodoItemDTO value, $Res Function(_TodoItemDTO) then) =
      __$TodoItemDTOCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, bool done});
}

/// @nodoc
class __$TodoItemDTOCopyWithImpl<$Res> extends _$TodoItemDTOCopyWithImpl<$Res>
    implements _$TodoItemDTOCopyWith<$Res> {
  __$TodoItemDTOCopyWithImpl(
      _TodoItemDTO _value, $Res Function(_TodoItemDTO) _then)
      : super(_value, (v) => _then(v as _TodoItemDTO));

  @override
  _TodoItemDTO get _value => super._value as _TodoItemDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_TodoItemDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoItemDTO extends _TodoItemDTO {
  const _$_TodoItemDTO(
      {required this.id, required this.name, required this.done})
      : super._();

  factory _$_TodoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TodoItemDTOFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool done;

  @override
  String toString() {
    return 'TodoItemDTO(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TodoItemDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.done, done));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(done));

  @JsonKey(ignore: true)
  @override
  _$TodoItemDTOCopyWith<_TodoItemDTO> get copyWith =>
      __$TodoItemDTOCopyWithImpl<_TodoItemDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoItemDTOToJson(this);
  }
}

abstract class _TodoItemDTO extends TodoItemDTO {
  const factory _TodoItemDTO(
      {required String id,
      required String name,
      required bool done}) = _$_TodoItemDTO;
  const _TodoItemDTO._() : super._();

  factory _TodoItemDTO.fromJson(Map<String, dynamic> json) =
      _$_TodoItemDTO.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$TodoItemDTOCopyWith<_TodoItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
