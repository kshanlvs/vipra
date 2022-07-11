import 'package:flutter/material.dart';

class LoadingIndicator {
  static const Color _primaryColor = Color.fromARGB(255, 255, 65, 7);

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: SizedBox(
                height: 30,
                width: 30,
                child: Center(
                  child: CircularProgressIndicator(
                    color: _primaryColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void close(BuildContext context) {
    Navigator.pop(context);
  }
}
