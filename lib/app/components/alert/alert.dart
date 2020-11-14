import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  // ignore: non_constant_identifier_names
  static final int WARNING = 0;
  // ignore: non_constant_identifier_names
  static final int SUCCESS = 1;
  // ignore: non_constant_identifier_names
  static final int ERROR = 2;

  Alert.show(String title, String message, int type) {
    IconData icon;
    Color color1;
    Color color2;
    if (type == 0) {
      icon = Icons.sentiment_neutral;
      color1 = Color(0xFFFFDD00);
      color2 = Color(0xFFFBB034);
    } else if (type == 1) {
      icon = Icons.sentiment_very_satisfied;
      color1 = Color(0xFF00B712);
      color2 = Color(0xFF5AFF15);
    } else if (type == 2) {
      icon = Icons.sentiment_very_dissatisfied;
      color1 = Color(0xFFFE5858);
      color2 = Color(0xFFEE9617);
    }

    Get.snackbar(
      title,
      message,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      backgroundColor: Colors.white38,
      backgroundGradient: LinearGradient(
        colors: [color1, color2],
      ),
      isDismissible: true,
      duration: Duration(seconds: 3),
      icon: Icon(
        icon,
      ),
      titleText: Text(
        title,
      ),
      messageText: Text(
        message,
      ),
    );

    //     backgroundGradient: LinearGradient(
    //   colors: [Colors.green.shade800, Colors.greenAccent.shade700],
    //   stops: [0.6, 1],
    // )
  }
  Alert.smallShow(String message, int type) {
    Color colorBack;
    if (type == 0) {
      colorBack = Colors.yellow;
    } else if (type == 1) {
      colorBack = Colors.green;
    } else if (type == 2) {
      colorBack = Colors.red;
    }
    Get.rawSnackbar(
      messageText: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13.0, color: Colors.white),
      ),
      duration: Duration(milliseconds: 1500),
      maxWidth: 150,
      borderRadius: 50.0,
      backgroundColor: colorBack,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
    );
  }
}
