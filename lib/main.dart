import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/screen/first_screen.dart';
import 'package:go_router_actual/screen/home_screen.dart';
import 'package:go_router_actual/screen/second_screen.dart';
import 'package:go_router_actual/screen/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  GoRouter get _router => GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: 'first',
                builder: (context, state) => const FirstScreen(),
                routes: [
                  GoRoute(
                      path: 'second',
                      builder: (context, state) => const SecondScreen(),
                      routes: [
                        GoRoute(
                            path: 'third',
                            name: ThirdScreen.routeName,
                            builder: (context, state) => const ThirdScreen(),
                        )
                      ]
                  )
                ]
              )
            ]
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      // // route 정보를 전달
      // routeInformationProvider: _router.routeInformationProvider,
      // // URI String을 상태 및 Go Router에서 사용할 수 있는 형태로 변환해주는 함수
      // routeInformationParser: _router.routeInformationParser,
      // // 위에서 변경된 값으로 실제 어떤 라우트를 보여줄지 정하는 함수
      // routerDelegate: _router.routerDelegate,
    );
  }
}
