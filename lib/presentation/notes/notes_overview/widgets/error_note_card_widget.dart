import 'package:flutter/material.dart';
import 'package:todo_app_ddd/domain/notes/note.dart';

class ErrorNoteCard extends StatelessWidget {
  final Note note;

  const ErrorNoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).errorColor,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: <Widget>[
            Text(
              'Invalid note! Please, contact support!',
              style: Theme.of(context)
                  .primaryTextTheme
                  .bodyText2
                  ?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 2),
            Text(
              'Details for nerds:',
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
            Text(
              note.failureOption.fold(
                () => '',
                (f) => f.toString(),
              ),
              style: Theme.of(context).primaryTextTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
