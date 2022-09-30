import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/layout/defualt_layout.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
          Text(error),
          ElevatedButton(
            onPressed: () {
              context.go('/');
            },
            child: Text('home'),
          ),
        ],
      ),
    );
  }
}
