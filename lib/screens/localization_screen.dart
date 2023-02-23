import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_examples/main.dart';

class LocalizationScreen extends ConsumerWidget {
  const LocalizationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).appTitle)),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context).body,
            style: TextStyle(fontSize: 24, color: Colors.blueGrey),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(localeProvider.notifier).state =
                      Locale.fromSubtags(languageCode: 'en');
                },
                child: Text('English')),
            SizedBox(
              width: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(localeProvider.notifier).state =
                      Locale.fromSubtags(languageCode: 'ko');
                },
                child: Text('한글'))
          ],
        )
      ]),
    );
  }
}
