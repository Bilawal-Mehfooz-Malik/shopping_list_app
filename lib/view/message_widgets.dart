import 'package:flutter/material.dart';

class MessageWidgets {
  MessageWidgets(this._context);

  final BuildContext _context;

  void showCustomSnack(String message) {
    ScaffoldMessenger.of(_context).clearSnackBars();
    ScaffoldMessenger.of(_context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void showCustomDialog({
    required String title,
    required String content,
    String? leftButtonText,
    String? rightButtonText,
    VoidCallback? leftButtonAction,
    VoidCallback? rightButtonAction,
  }) {
    showDialog(
      context: _context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          if (leftButtonText != null)
            TextButton(
              onPressed: leftButtonAction,
              child: Text(leftButtonText),
            ),
          if (rightButtonText != null)
            ElevatedButton(
              onPressed: rightButtonAction,
              child: Text(rightButtonText),
            ),
        ],
      ),
    );
  }
}
