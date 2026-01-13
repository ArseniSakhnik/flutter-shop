import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  static Color? getColor(String value) {
    final colorMap = <String, Color>{
      'green': Colors.green,
      'red': Colors.red,
      'blue': Colors.blue,
      'pink': Colors.pink,
      'grey': Colors.grey,
      'purple': Colors.purple,
      'black': Colors.black,
      'white': Colors.white,
    };

    return colorMap[value.toLowerCase()];
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(
      Get.context!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  /// Высота экрана
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Ширина экрана
  static screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// Форматирование даты
  static String getFormattedDate(
      DateTime date, {
        String format = 'dd MMM yyyy',
      }) {
    return DateFormat(format).format(date);
  }

  /// Удаление дубликатов из списка
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Оборачивает список виджетов в строки (Row) по rowSize элементов
  static List<Widget> wrapWidgets(
      List<Widget> widgets,
      int rowSize,
      ) {
    final List<Widget> wrappedList = [];

    for (int i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );

      wrappedList.add(
        Row(
          children: rowChildren,
        ),
      );
    }

    return wrappedList;
  }
}
