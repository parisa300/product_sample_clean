import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_sample_auth/dependencies_injection.dart';
import 'package:test_sample_auth/resources/styles.dart';

import 'auth/presentation/login/cubit/auth_cubit.dart';
import 'core/common/app_route.dart';

Future<void> main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    /// Lock device orientation to portrait
    () => SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) async {
      /// Load SharedPref before load My App Widget
      SharedPreferences.getInstance().then((value) {
        initPrefManager(value);
        runApp(LzyctApp());
      });
    }),
    (error, stackTrace) async {},
  );
}

class LzyctApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiBlocProvider(
      providers: [
        //   BlocProvider(create: (_) => sl<SettingsCubit>()..getActiveTheme()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: OKToast(
        child: ScreenUtilInit(
          /// Set screen size to make responsive
          /// Almost all device

          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, __) {
            /// Pass context to appRoute
            AppRoute.setStream(context);

            return MaterialApp.router(
              routerConfig: AppRoute.router,
              debugShowCheckedModeBanner: false,
              title: "",
              theme: themeLight(context),
              darkTheme: themeDark(context),
            );
          },
        ),
      ),
    );
  }
}
