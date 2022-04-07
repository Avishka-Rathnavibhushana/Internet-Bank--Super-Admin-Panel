import 'package:flutter/material.dart';

class Utils {
  /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  static Future<void> navigateTo(
      BuildContext context, String routeName, bool permanentlyDisplay) async {
    if (permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }
}
