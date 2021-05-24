// import 'package:features/form/form.dart';
// import 'package:features/ad_state.dart';
import 'package:features/provider/locale_provider.dart';
import 'package:features/verifynumber.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// import 'package:features/app_localizations.dart';

// shared_preferences
// multi-lingue-translation
// maps
// search_
// form_auth
// user_management:
// client_management:
// phone_registration

import './screens/features.dart';
import 'common.dart';
import 'l10n/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // // use plugin before calling runApp

  // final initFuture = MobileAds.instance.initialize();

  // // create an object give the future: initFuture
  // final adState = AdState(initFuture);

  //
  // import 'dart:io';

// import 'package:google_mobile_ads/google_mobile_ads.dart';

// class AdState {
//   Future<InitializationStatus> initialization;
//   AdState(this.initialization);

//   String get bannerAdUnitId => Platform.isAndroid
//       ? 'ca-app-pub-3940256099942544/6300978111'
//       : 'ca-app-pub-3940256099942544/2934735716';
// }

// runApp(Provider.value(
//     value: adState,
//     builder: (context, child) => MyApp(),
//   ));

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);

        return MaterialApp(
          title: 'Features',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Montserrat',
            canvasColor: Colors.grey.shade400,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          // List all of the app's supported locales here
          supportedLocales: L10n.all,
          locale: provider.locale,
          // These delegates make sure that the localization data for the proper language is loaded
          localizationsDelegates: [
            // THIS CLASS WILL BE ADDED LATER
            // AppLocalizations.delegate,
            // A class which loads the translations from JSON files
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          // Returns a locale which will be used by the app
          // localeResolutionCallback: (locale, supportedLocales) {
          //   // Check if the current device locale is supported
          //   for (var supportedLocale in supportedLocales) {
          //     if (supportedLocale.languageCode == locale.languageCode &&
          //         supportedLocale.countryCode == locale.countryCode) {
          //       return supportedLocale;
          //     }
          //   }
          //   // If the locale of the device is not supported, use the first one
          //   // from the list (English, in this case).
          //   return supportedLocales.first;
          // },
          home: FeaturesScreen(),
          routes: {
            FeaturesScreen.routeName: (ctx) => FeaturesScreen(),
            VerifyScreeen.routeName: (ctx) => VerifyScreeen(),
          },
        );
      },
    );
  }
}

// automate-monetization
// admob.google.com/home/
// packages:
//  google_mobile_ads
