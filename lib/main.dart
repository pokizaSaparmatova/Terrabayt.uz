import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:terrabayt_uz/pages/home_page.dart';

import 'di/di_module.dart';

void main() {
  setUp();
  initializeDateFormatting('uz', '');
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
