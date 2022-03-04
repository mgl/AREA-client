import 'package:client/layout/client_options.dart';
import 'package:animations/animations.dart';
import 'package:client/colors.dart';
import 'package:client/views/home/home.dart';
import 'package:client/layout/letter_spacing.dart';
import 'package:client/routes.dart' as routes;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class AreaApp extends StatelessWidget {
  const AreaApp({Key? key}) : super(key: key);
  static const String _loginRoute = routes.loginRoute;
  static const String _homeRoute = routes.homeRoute;
  final sharedZAxisTransitionBuilder = const SharedAxisPageTransitionsBuilder(
      transitionType: SharedAxisTransitionType.scaled,
      fillColor: ClientColors.primaryBackground);

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

  @override
  Widget build(BuildContext context) {
    // const providerConfigs = [EmailProviderConfiguration()];
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _buildClientTheme().copyWith(
            platform: ClientOptions.of(context)?.platform,
            pageTransitionsTheme: PageTransitionsTheme(builders: {
              for (var type in TargetPlatform.values)
                type: sharedZAxisTransitionBuilder
            })),
        restorationScopeId: 'client_app',
        title: 'Client',
        initialRoute: FirebaseAuth.instance.currentUser == null
            ? _loginRoute
            : _homeRoute,
        routes: {
          _loginRoute: (context) {
            return SignInScreen(actions: [
              AuthStateChangeAction<SignedIn>((context, _) {
                Navigator.of(context).pushReplacementNamed(_homeRoute);
              })
            ], providerConfigs: const [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                  clientId:
                      '...')
            ]);
          },
          _homeRoute: (context) {
            return const HomePage();
          }
        });
  }
}
