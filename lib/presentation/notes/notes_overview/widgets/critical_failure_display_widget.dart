import 'package:flutter/material.dart';
import 'package:todo_app_ddd/domain/notes/note_failures.dart';

class CriticalFailureDisplay extends StatelessWidget {
  final NoteFailure failure;

  const CriticalFailureDisplay({Key? key, required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            '😱',
            style: TextStyle(
              fontSize: 100,
            ),
          ),
          Text(
            failure.maybeMap(
              insufficientPermissions: (_) => 'Insufficient permissions!',
              orElse: () => 'Unexpected error. \nPlease, contact support!',
            ),
            style: const TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () {
              _showEmailSentDialog(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(Icons.email),
                SizedBox(width: 4),
                Text('I NEED HELP!'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showEmailSentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email sent!'),
          content: Text(
            'A notification email has just been sent to the support team! We will be in touch soon.',
          ),
        );
      },
    );
  }
}
