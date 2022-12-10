import 'package:flutter/material.dart';

class DialogService {
  Future<void> showMessageDialog(BuildContext context,
      {String? title, String? message}) async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Perhatian'),
          content: Text(message ?? ''),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> actionDialog(BuildContext context,
      {String? title, String? message, VoidCallback? action}) async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Perhatian'),
          content: Text(message ?? ''),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                action?.call();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> actionOrCancelDialog(BuildContext context,
      {String? title, String? message, VoidCallback? action}) async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Perhatian'),
          content: Text(message ?? ''),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                action?.call();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> networkError(BuildContext context) async {
    return showDialog<void>(
      context: context, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Jaringan Bermasalah'),
          content: const Text('Coba kembali nanti'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
