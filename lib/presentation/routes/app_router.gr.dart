// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../domain/notes/note.dart' as _i7;
import '../notes/note_form/note_form_page.dart' as _i4;
import '../notes/notes_overview/notes_overview_page.dart' as _i3;
import '../sign_in/sign_in_page.dart' as _i2;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    SignInPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignInPage());
    },
    NotesOverviewPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.NotesOverviewPage());
    },
    NoteFormPageRoute.name: (routeData) {
      final args = routeData.argsAs<NoteFormPageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.NoteFormPage(key: args.key, editedNote: args.editedNote),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashPageRoute.name, path: '/'),
        _i5.RouteConfig(SignInPageRoute.name, path: '/sign-in-page'),
        _i5.RouteConfig(NotesOverviewPageRoute.name,
            path: '/notes-overview-page'),
        _i5.RouteConfig(NoteFormPageRoute.name, path: '/note-form-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i5.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInPageRoute extends _i5.PageRouteInfo<void> {
  const SignInPageRoute() : super(SignInPageRoute.name, path: '/sign-in-page');

  static const String name = 'SignInPageRoute';
}

/// generated route for
/// [_i3.NotesOverviewPage]
class NotesOverviewPageRoute extends _i5.PageRouteInfo<void> {
  const NotesOverviewPageRoute()
      : super(NotesOverviewPageRoute.name, path: '/notes-overview-page');

  static const String name = 'NotesOverviewPageRoute';
}

/// generated route for
/// [_i4.NoteFormPage]
class NoteFormPageRoute extends _i5.PageRouteInfo<NoteFormPageRouteArgs> {
  NoteFormPageRoute({_i6.Key? key, required _i7.Note? editedNote})
      : super(NoteFormPageRoute.name,
            path: '/note-form-page',
            args: NoteFormPageRouteArgs(key: key, editedNote: editedNote));

  static const String name = 'NoteFormPageRoute';
}

class NoteFormPageRouteArgs {
  const NoteFormPageRouteArgs({this.key, required this.editedNote});

  final _i6.Key? key;

  final _i7.Note? editedNote;

  @override
  String toString() {
    return 'NoteFormPageRouteArgs{key: $key, editedNote: $editedNote}';
  }
}
