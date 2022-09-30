import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/layout/defualt_layout.dart';
import 'package:go_router_actual/screen/second_screen.dart';
import 'package:go_router_actual/screen/third_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/first');
            },
            child: Text('go first screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(SecondScreen.routeName);
            },
            child: Text('go second screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(ThirdScreen.routeName);
            },
            child: Text('go third screen'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/error');
            },
            child: Text('go error screen'),
          ),
        ],
      ),
    );
  }
}
