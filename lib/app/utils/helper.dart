import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wxyz/app/theme/colors.dart';

class Helper {
  static bool _isLoading = false;

  static showLoading({
    required BuildContext context,
  }) {
    _isLoading = true;
    // final theme = MediaQuery.of(context).platformBrightness;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const PopScope(
          canPop: false,
          child: Center(
            child: CircularProgressIndicator(
              color: Colorz.main,
            ),
          ),
        );
      },
    );
  }

  static hideLoading({
    required BuildContext context,
  }) {
    if (_isLoading) {
      Navigator.pop(context);
    }
  }

  static showSnackBar({
    required BuildContext context,
    required String text,
    int duration = 5,
    GlobalKey? key,
    Color color = Colors.red,
  }) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      duration: Duration(seconds: duration),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static time({
    required DateTime date,
  }) {
    final birthday = date;
    final date2 = DateTime.now();
    final seconds = date2.difference(birthday).inSeconds;
    final minutes = date2.difference(birthday).inMinutes;
    final hours = date2.difference(birthday).inHours;
    final day = date2.difference(birthday).inDays;
    final month = date2.difference(birthday).inDays / 30;
    final year = date2.difference(birthday).inDays / 365;
    return seconds <= 60
        ? 'just now'
        : minutes <= 60
            ? '${minutes.toInt().toString()} minutes ago'
            : hours <= 24
                ? '${hours.toInt().toString()} hours ago'
                : hours <= 48
                    ? 'yesterday'
                    : day <= 30
                        ? '${day.toInt().toString()} days ago'
                        : month <= 12
                            ? '${month.toInt().toString()} month ago'
                            : '${year.toInt().toString()} years ago';
  }

  static String formatNumber(int number) {
    String numberFormat = "";
    if (number < 1000) {
      return number.toString();
    } else if (number < 1000000) {
      double value = number / 1000;
      // return value.toString();
      numberFormat =
          '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}K';
    } else if (number < 1000000000) {
      double value = number / 1000000;
      numberFormat =
          '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}M';
    } else {
      double value = number / 1000000000;
      numberFormat =
          '${value.toStringAsFixed(value.truncateToDouble() == value ? 0 : 1)}B';
    }
    return numberFormat.replaceAll('.0', '');
  }
}
