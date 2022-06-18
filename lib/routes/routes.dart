import 'package:bloc_study/app/projects/counter/pages/counter_page.dart';
import 'package:flutter/cupertino.dart';

class AppPlaces {
  static String kCounterPage = '/counter';

  static Map<String, WidgetBuilder> routes = {
    kCounterPage: (ctx) => const CounterPage(),
  };
}
