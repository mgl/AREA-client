import 'package:animations/animations.dart';
import 'package:client/layout/client_options.dart';
import 'package:client/colors.dart';
import 'package:client/home.dart';
import 'package:client/layout/letter_spacing.dart';
import 'package:client/controller/login_page.dart';
import 'package:client/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AreaApp extends StatelessWidget {
  static const String loginRoute = routes.loginRoute;
  static const String homeRoute = routes.homeRoute;
  final sharedZAxisTransitionBuilder = const SharedAxisPageTransitionsBuilder(
      fillColor: ClientColors.primaryBackground,
      transitionType: SharedAxisTransitionType.scaled);
  const AreaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        restorationScopeId: 'client_app',
        title: 'Client',
        debugShowCheckedModeBanner: false,
        theme: _buildClientTheme().copyWith(
            platform: ClientOptions.of(context)?.platform,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              for (var type in TargetPlatform.values)
                type: sharedZAxisTransitionBuilder
            })),
        initialRoute: loginRoute,
        routes: <String, WidgetBuilder>{
          homeRoute: (context) => const HomePage(),
          loginRoute: (context) => const LoginPageController()
        });
  }

  TextTheme _buildClientTextTheme(TextTheme base) {
    return base
        .copyWith(
            bodyText1: GoogleFonts.eczar(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                letterSpacing: letterSpacingOrNone(1.4)),
            bodyText2: GoogleFonts.robotoCondensed(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: letterSpacingOrNone(0.5)),
            button: GoogleFonts.robotoCondensed(
                fontWeight: FontWeight.w700,
                letterSpacing: letterSpacingOrNone(2.8)),
            headline5: GoogleFonts.eczar(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                letterSpacing: letterSpacingOrNone(1.4)))
        .apply(displayColor: Colors.white, bodyColor: Colors.white);
  }

  ThemeData _buildClientTheme() {
    final base = ThemeData.dark();
    return ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: ClientColors.primaryBackground,
            elevation: 0),
        scaffoldBackgroundColor: ClientColors.primaryBackground,
        primaryColor: ClientColors.primaryBackground,
        focusColor: ClientColors.focusColor,
        textTheme: _buildClientTextTheme(base.textTheme),
        inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
                color: ClientColors.gray, fontWeight: FontWeight.w500),
            filled: true,
            fillColor: ClientColors.inputBackground,
            focusedBorder: InputBorder.none),
        visualDensity: VisualDensity.standard);
  }
}
