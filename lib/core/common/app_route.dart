import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_sample_auth/auth/presentation/login/cubit/auth_cubit.dart';
import 'package:test_sample_auth/auth/presentation/login/screen/login_page.dart';
import 'package:test_sample_auth/core/common/pref_manager.dart';
import 'package:test_sample_auth/core/utils/go_router_refresh_stream.dart';
import 'package:test_sample_auth/dependencies_injection.dart';
import 'package:test_sample_auth/general/main_page.dart';

import '../../user_product/domain/usecases/get_products.dart';
import '../../user_product/presentation/product/cubit/products_cubit.dart';
import '../../user_product/presentation/product/product_screen.dart';

enum Routes {
  root("/"),
 // splashScreen("/splashscreen"),

  /// Home Page
 // dashboard("/dashboard"),
 // settings("/settings"),

  // Auth Page
  login("/auth/login"),
 // register("/auth/register"),
  product("/user_product/product")
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path: Routes.splashScreen.path,
      //   name: Routes.splashScreen.name,
      //   builder: (_, __) => SplashScreenPage(),
      // ),
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_, __) => Routes.product.path,
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const LoginPage(),
      ),

      ShellRoute(
        builder: (_, __, child) => MainPage(child: child),
        routes: [
          GoRoute(
            path: Routes.product.path,
            name: Routes.product.name,
            builder: (_, __) => BlocProvider(
              create: (_) => sl<ProductsCubit>()..fetchUsers(const ProductsParams()),
              child: const ProductScreen(),
            ),
          ),

        ],
      ),
    ],
  //  initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
    redirect: (_, GoRouterState state) {
      final bool isLoginPage = state.subloc == Routes.login.path;

      ///  Check if not login
      ///  if current page is login page we don't need to direct user
      ///  but if not we must direct user to login page
      if (!sl<PrefManager>().isLogin) {
        return isLoginPage ? null : Routes.login.path;
      }

      /// Check if already login and in login page
      /// we should direct user to main page

      if (isLoginPage && sl<PrefManager>().isLogin) {
        return Routes.root.path;
      }

      /// No direct
      return null;
    },
  );
}
