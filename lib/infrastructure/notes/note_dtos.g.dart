// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NoteDTO _$$_NoteDTOFromJson(Map<String, dynamic> json) => _$_NoteDTO(
      body: json['body'] as String,
      color: json['color'] as int,
      todos: (json['todos'] as List<dynamic>)
          .map((e) => TodoItemDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverTimeStamp: const ServerTimeStampConverter()
          .fromJson(json['serverTimeStamp'] as Object),
    );

Map<String, dynamic> _$$_NoteDTOToJson(_$_NoteDTO instance) =>
    <String, dynamic>{
      'body': instance.body,
      'color': instance.color,
      'todos': instance.todos.map((e) => e.toJson()).toList(),
      'serverTimeStamp':
          const ServerTimeStampConverter().toJson(instance.serverTimeStamp),
    };

_$_TodoItemDTO _$$_TodoItemDTOFromJson(Map<String, dynamic> json) =>
    _$_TodoItemDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$$_TodoItemDTOToJson(_$_TodoItemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'done': instance.done,
    };
