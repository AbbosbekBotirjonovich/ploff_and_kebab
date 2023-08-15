import 'package:flutter/material.dart';
import 'package:ploff_and_kebab/src/core/utils/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: AppUtils.kBorderRadius16,
          child: Material(
            color: Theme.of(context).cardColor,
            shape: const RoundedRectangleBorder(
              borderRadius: AppUtils.kBorderRadius16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    // customModalBottomSheet<void>(
                    //   context: context,
                    //   builder: (_, controller) => LanguageBottomWidget(
                    //       onChanged: (lang) async {
                    //         AppOptions.update(
                    //           context,
                    //           options.copyWith(locale: Locale(lang)),
                    //         );
                    //         Navigator.pop(context);
                    //         await sl<LocalSource>().setLocale(lang);
                    //       },
                    //     ),
                    // );
                  },
                  title: const Text('Language'),
                ),
                AppUtils.kDivider,
                ListTile(
                  onTap: () {
                    // customModalBottomSheet<void>(
                    //   context: context,
                    //   builder: (_, __) => ThemeBottomWidget(
                    //       onChanged: (mode) async {
                    //         AppOptions.update(
                    //           context,
                    //           options.copyWith(themeMode: mode),
                    //         );
                    //         Navigator.pop(context);
                    //         await sl<LocalSource>().setThemeMode(mode);
                    //       },
                    //     ),
                    // );
                  },
                  title: const Text('Theme'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
