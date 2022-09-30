import 'package:flutter/cupertino.dart';
import 'package:go_router_actual/layout/defualt_layout.dart';

class SecondScreen extends StatelessWidget {
  static String get routeName => 'second';

  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(body: Column(children: [],));
  }
}
