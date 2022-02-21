import 'package:todo_app_ddd/generated/json/base/json_convert_content.dart';
import 'package:todo_app_ddd/infrastructure/notes/note_dtos.freezed.dart';

_$_NoteDTO $_$_NoteDTOFromJson(Map<String, dynamic> json) {
  final _$_NoteDTO _$_NoteDTO = _$_NoteDTO();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    _$_NoteDTO.id = id;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    _$_NoteDTO.body = body;
  }
  final int? color = jsonConvert.convert<int>(json['color']);
  if (color != null) {
    _$_NoteDTO.color = color;
  }
  final List<TodoItemDTO>? todos =
      jsonConvert.convertListNotNull<TodoItemDTO>(json['todos']);
  if (todos != null) {
    _$_NoteDTO.todos = todos;
  }
  final FieldValue? serverTimeStamp =
      jsonConvert.convert<FieldValue>(json['serverTimeStamp']);
  if (serverTimeStamp != null) {
    _$_NoteDTO.serverTimeStamp = serverTimeStamp;
  }
  return _$_NoteDTO;
}

Map<String, dynamic> $_$_NoteDTOToJson(_$_NoteDTO entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['body'] = entity.body;
  data['color'] = entity.color;
  data['todos'] = entity.todos.map((v) => v.toJson()).toList();
  data['serverTimeStamp'] = entity.serverTimeStamp.toJson();
  return data;
}

_$_TodoItemDTO $_$_TodoItemDTOFromJson(Map<String, dynamic> json) {
  final _$_TodoItemDTO _$_TodoItemDTO = _$_TodoItemDTO();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    _$_TodoItemDTO.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    _$_TodoItemDTO.name = name;
  }
  final bool? done = jsonConvert.convert<bool>(json['done']);
  if (done != null) {
    _$_TodoItemDTO.done = done;
  }
  return _$_TodoItemDTO;
}

Map<String, dynamic> $_$_TodoItemDTOToJson(_$_TodoItemDTO entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['done'] = entity.done;
  return data;
}
