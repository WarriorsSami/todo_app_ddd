import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:todo_app_ddd/domain/core/value_objects.dart';
import 'package:todo_app_ddd/domain/core/value_transformers.dart';
import 'package:todo_app_ddd/domain/core/value_validators.dart';

class NoteBody extends ValueObject<String> {
  @override
  final FailOrVal<String> value;

  static const maxLength = 1000;

  factory NoteBody(String input) {
    return NoteBody._(
      validateMaxStringLength(input, maxLength).flatMap(validateStringNonEmpty),
    );
  }

  const NoteBody._(this.value);
}

class TodoName extends ValueObject<String> {
  @override
  final FailOrVal<String> value;

  static const maxLength = 30;

  factory TodoName(String input) {
    return TodoName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNonEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const TodoName._(this.value);
}

class NoteColor extends ValueObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa), // canvas
    Color(0xfffa8072), // salmon
    Color(0xfffedc56), // mustard
    Color(0xffd0f0c0), // tea
    Color(0xfffca3b7), // flamingo
    Color(0xff999009), // tortilla
    Color(0xfffffdd0), // cream
    Color(0xff00bfff), // deep sky blue
    Color(0xff87ceeb), // sky blue
    Color(0xff7fff00), // lime
    Color(0xff00fa9a), // medium spring green
    Color(0xffcd5c5c), // indian red
    Color(0xfffffac8), // ivory
    Color(0xff66cdaa), // turquoise
    Color(0xffff00ff), // fuchsia
    Color(0xff00ff00), // green
    Color(0xffcd853f), // peru
    Color(0xff708090), // slate gray
    Color(0xff4682b4), // steel blue
    Color(0xffd2b48c), // tan
    Color(0xff1e90ff), // dodger blue
    Color(0xff00ffff), // cyan
  ];

  @override
  final FailOrVal<Color> value;

  factory NoteColor(Color input) {
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}

class List3<T> extends ValueObject<KtList<T>> {
  @override
  final FailOrVal<KtList<T>> value;

  static const maxLength = 3;

  factory List3(KtList<T> input) {
    return List3<T>._(
      validateMaxListLength(input, maxLength),
    );
  }

  const List3._(this.value);

  int get length {
    return value.getOrElse(() => emptyList()).size;
  }

  bool get isFull {
    return length == maxLength;
  }
}
