import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/provider/auth_provider.dart';
import 'package:go_router_actual/screen/error_screen.dart';
import 'package:go_router_actual/screen/first_screen.dart';
import 'package:go_router_actual/screen/home_screen.dart';
import 'package:go_router_actual/screen/second_screen.dart';
import 'package:go_router_actual/screen/third_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      // // route 정보를 전달
      // routeInformationProvider: _router.routeInformationProvider,
      // // URI String을 상태 및 Go Router에서 사용할 수 있는 형태로 변환해주는 함수
      // routeInformationParser: _router.routeInformationParser,
      // // 위에서 변경된 값으로 실제 어떤 라우트를 보여줄지 정하는 함수
      // routerDelegate: _router.routerDelegate,
    );
  }
}
