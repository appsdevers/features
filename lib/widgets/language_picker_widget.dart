import 'package:features/l10n/l10n.dart';
import 'package:features/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageWidget extends StatelessWidget {
  // InputData: data can be changed externally by the constructor.

  @override
  Widget build(BuildContext context) {
    // build reRendersUI of the apps. Don't use properties and methods here cause will be reset by the app! [appBarSize_use] [isLandscape_use]

    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);

    return Center(
      child: CircleAvatar(
        radius: 72,
        backgroundColor: Colors.white,
        child: Text(
          flag,
          style: TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}

class LanguagePickerWidget extends StatelessWidget {
  // InputData: data can be changed externally by the constructor.

  @override
  Widget build(BuildContext context) {
    // build reRendersUI of the apps. Don't use properties and methods here cause will be reset by the app! [appBarSize_use] [isLandscape_use]
    final provider = Provider.of<LocaleProvider>(context);

    final locale = provider.locale;

    print('reBuilds LanguagePickerWidget()');
    return DropdownButtonHideUnderline(
        child: DropdownButton(
      value: locale,
      icon: Container(width: 12),
      items: L10n.all.map((locale) {
        final flag = L10n.getFlag(locale.languageCode);

        return DropdownMenuItem(
          child: Center(
            child: Text(
              flag,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          value: locale,
          onTap: () {
            final provider =
                Provider.of<LocaleProvider>(context, listen: false);
            provider.setLocale(locale);
          },
        );
      }).toList(),
    ));
  }
}
