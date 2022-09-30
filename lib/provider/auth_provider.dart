import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_actual/model/user_model.dart';
import 'package:go_router_actual/screen/error_screen.dart';
import 'package:go_router_actual/screen/first_screen.dart';
import 'package:go_router_actual/screen/home_screen.dart';
import 'package:go_router_actual/screen/login_screen.dart';
import 'package:go_router_actual/screen/second_screen.dart';
import 'package:go_router_actual/screen/third_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authStateProvider = AuthNotifier(ref: ref);

  return GoRouter(
    initialLocation: '/login',
    errorBuilder: (context, state) =>
        ErrorScreen(error: state.error.toString()),
    // redirect
    redirect : authStateProvider._redirectLogic,
    // refresh
    // ChangeNotifier
    // 상태가 변경될 때 redirect 호출
    refreshListenable: authStateProvider,
    routes: authStateProvider.routes,
  );
});

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({required this.ref}) {
    // userProvider에서 상태가 변화 되었을 때 AuthNotifier가 바뀌었다고 외부에 알리고 redirct 로직이 호출
    ref.listen<UserModel?>(userProvider, (previous, next) {
      if (previous != next) {
        notifyListeners();
      }
    });
  }

  // navigation 할때마다 실행
  String? _redirectLogic(BuildContext context, GoRouterState state) {
    // UserModel의 인스턴스 또는 null
    final user = ref.read(userProvider);

    // 로그인을 하려는 상태인지
    final loggingIn = state.location == '/login';

    // 유저 정보가 없다 - 로그인한 상태가 아니다.
    //
    // 유저 정보가 없고
    // 로그인하려는 중이 아니라면
    // 로그인 페이지로 이동한다.
    // null을 반환하면 원래가려던 곳으로 감
    if(user == null){
      return loggingIn ? null : '/login';
    }

    // 유저 정보가 있는데
    // 로그인 페이지라면
    // 홈으로 이동
    if(loggingIn){
      return '/';
    }

    // 나머지 상태에서는 원래가려던 곳으로 보내기
    return null;
  }

  List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          builder: (_, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'first',
              builder: (_, state) => const FirstScreen(),
              routes: [
                GoRoute(
                  path: 'second',
                  name: SecondScreen.routeName,
                  builder: (_, state) => const SecondScreen(),
                  routes: [
                    GoRoute(
                      path: 'third',
                      name: ThirdScreen.routeName,
                      builder: (_, state) => const ThirdScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
      ];
}

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel?>(
    (ref) => UserStateNotifier());

// 로그인한 상태면 UserModel 인스턴스를 상태로 넣어주기
// 로그아웃 상태면 null 상태로 넣어주기
class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier() : super(null);

  login({required String name}) {
    state = UserModel(name: name);
  }

  logout() {
    state = null;
  }
}
