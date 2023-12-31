import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_mangement/view/screens/startup_screens/splash_screen.dart';
import 'package:hospital_mangement/view_model/cubit/all_users/all_users_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/attendance/attendance_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/calls/calls_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/create_call/create_call_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/home/home_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/new_user/new_user_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/password_field_cubit/password_field_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/receptionist_case_details/receptionist_case_details_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/report/report_cubit.dart';
import 'package:timezone/data/latest.dart' as time_zone;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hospital_mangement/view/constant/observer.dart';
import 'package:hospital_mangement/view/constant/theme.dart';
import 'package:hospital_mangement/view_model/cubit/auth/login/login_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/forget_password/forget_password_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/onboard/onboard_cubit.dart';
import 'package:hospital_mangement/view_model/cubit/theme/theme_cubit.dart';
import 'package:hospital_mangement/view_model/database/local/cache_helper.dart';
import 'package:hospital_mangement/view_model/database/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  // Intl.defaultLocale = 'ar_SA';
  Intl.defaultLocale = 'en_US';
  time_zone.initializeTimeZones();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AttendanceCubit(),
        ),
        BlocProvider(
          create: (context) => OnboardCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => PasswordFieldCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(context),
        ),
        BlocProvider(
          create: (context) => ReportCubit(),
        ),
        BlocProvider(
          create: (context) => CreateCallCubit(),
        ),
        BlocProvider(
          create: (context) => ReceptionistCaseDetailsCubit(),
        ),
        BlocProvider(
          create: (context) => NewUserCubit(),
        ),
        BlocProvider(
          create: (context) => AllUsersCubit(),
        ),
        BlocProvider(
          create: (context) => CallsCubit(),
        ),
      ],
      child: EasyLocalization(
        path: "resources/langs",
        supportedLocales: const [
          Locale('en', 'EN'),
          Locale('ar', 'AR'),
        ],
//fallbackLocale: Locale('en'),
        saveLocale: true,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 811),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          // navigatorKey: NavigationService.instance.navigationKey,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: buildLightMode(context),
          darkTheme: buildDarkMode(context),
          themeMode:
              ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          // home: const TouchIdSensorScreen(),
        );
      },
    );
  }
}
