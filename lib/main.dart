import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/go_router_provider.dart';
import 'package:riverpod_examples/screens/config_screen.dart';
//국제화
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dart:ui' as ui;

part 'main.g.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    //print('[${provider.name ?? provider.runtimeType}] value: $newValue');
  }
}

//final preConfigProvider = Provider<Config>((ref) => throw UnimplementedError());
//리버포드 제너레이터
@riverpod
Config preConfig(PreConfigRef ref) => throw UnimplementedError();

Future<Config> loadConfig() async {
  String configString = await rootBundle.loadString('asset/config.json');
  Map<String, dynamic> configMap = jsonDecode(configString);
  Config config = Config.fromJson(configMap);
  return config;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await loadConfig();
  runApp(
    ProviderScope(
      observers: [Logger()],
      overrides: [preConfigProvider.overrideWithValue(config)],
      child: const MyApp(),
    ),
  );
}

final localeProvider = StateProvider<Locale>((ref) {
  Locale defaultLocale = ui.window.locale; //ko
  print('defaultLocale:$defaultLocale');
  return Locale.fromSubtags(languageCode: defaultLocale.languageCode);
});

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(
        'AppLocalizations.supportedLocales:${AppLocalizations.supportedLocales}'); //en, ko
    return MaterialApp.router(
      locale: ref.watch(localeProvider), //프로바이더로 로케일 지정
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(fontFamily: 'Pretendard'),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
