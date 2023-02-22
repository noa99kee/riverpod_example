import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config_screen.g.dart';
part 'config_screen.freezed.dart';

@freezed
class Config with _$Config {
  factory Config({
    required String now_playing,
    required String movie,
    required String image,
  }) = _Config;

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
}

@riverpod
Future<Config> config(ConfigRef ref) async {
  String configString = await rootBundle.loadString('asset/config.json');
  Map<String, dynamic> configMap = jsonDecode(configString);
  Config config = Config.fromJson(configMap);
  return config;
}

class ConfigScreen extends ConsumerWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('config (FutureProvider)')),
      body: Center(
        child: config.when(
          data: (config) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NowPlaying : ${config.now_playing}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text('Image : ${config.image}',
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
