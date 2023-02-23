import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/screens/config_screen.dart';
import 'package:riverpod_examples/screens/product_screen.dart';

part 'hello_world.g.dart';
part 'hello_world.freezed.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  //프로바이더 본문에서 다른 프로바이더 리슨
  ref.listen<int>(counterProvider, (previous, next) {
    print('helloworldProvider 본문 안에서 counterProvider listen  값:$next');
  });

  return 'Hello World';
}

class User {
  final String name;
  final int age;
  User({
    required this.name,
    required this.age,
  });
  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  String toString() {
    return 'User(name:$name, age:$age)';
  }
}

@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  User build() {
    return User(name: 'keesoon', age: 45);
  }

  void changeName({required String name}) {
    state = state.copyWith(name: name);
  }

  void changeAge({required int age}) {
    state = state.copyWith(age: age);
  }
}

@riverpod
class Clock extends _$Clock {
  late final Timer _timer;
  @override
  DateTime build() {
    ref.onDispose(() {
      _timer.cancel();
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
    return DateTime.now();
  }
}

@Riverpod(keepAlive: true)
class City extends _$City {
  @override
  String build() {
    return 'seoul';
  }

  void change({required String cityName}) {
    state = cityName;
  }
}

@Riverpod(keepAlive: true)
Future<String> weather(WeatherRef ref) async {
  final city = ref.watch(cityProvider);
  await Future.delayed(Duration(seconds: 1));
  if (city == 'seoul')
    return 'sunny';
  else
    return 'cloudy';
}

@riverpod
class News extends _$News {
  @override
  FutureOr<List<NewsItem>> build() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      NewsItem(title: '김정은 핵개발', content: '핵 개발'),
      NewsItem(title: '러시아 우크라이나 전쟁 장기화', content: '러시아 우크라이나 전쟁 장기화 됨'),
    ];
  }

  Future<void> addNewsItem({required NewsItem newsItem}) async {
    state = AsyncValue.loading();
    await Future.delayed(Duration(seconds: 1));
    //아주 중요함
    state = AsyncValue.data([...state.value!, newsItem]);
  }
}

@freezed
class NewsItem with _$NewsItem {
  const factory NewsItem({
    required String title,
    required String content,
  }) = _NewsItem;
}

class HelloWorld extends ConsumerStatefulWidget {
  const HelloWorld({super.key});

  @override
  ConsumerState<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends ConsumerState<HelloWorld> {
  @override
  void initState() {
    //ref는 모든 라이프 사이클에서 접근 가능 하다.
    //다른 프로바이더 읽기
    final counter = ref.read(counterProvider);
    print('다른 프로바이더 counterProvider 값:$counter');

    init();

    super.initState();
  }

  Future<void> init() async {
    final config = await ref.read(configProvider.future);
    print('다른 프로바이더 비동기 configProvider 값:$config');
  }

  @override
  Widget build(BuildContext context) {
    print('HelloWorld build');

    //빌드 안에서도 리슨 가능
    ref.listen<int>(counterProvider, (previous, next) {
      print('빌드 안에서 counterProvider listen  값:$next');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Value is $next')),
      );
    });

    final name = ref.watch(currentUserProvider.select((user) => user.name));
    final age = ref.watch(currentUserProvider.select((user) => user.age));

    final city = ref.watch(cityProvider);
    final weather = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(title: Text('HelloWorld (Provider)')),
      body: Center(
        child: Column(children: [
          Text('${ref.watch(helloWorldProvider)}'),
          Consumer(
            //counterProvider가 밖에 있으면 build가 매번 실행 최적화
            builder: (context, ref, child) {
              final counter = ref.watch(counterProvider);
              return Text('counter : $counter');
            },
          ),
          SizedBox(
            height: 25,
          ),
          Text('User => name:$name,  age:$age'),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(currentUserProvider.notifier)
                        .changeName(name: 'younga');
                  },
                  child: Text('Change Name')),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(currentUserProvider.notifier).changeAge(age: 35);
                  },
                  child: Text('Change age')),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(cityProvider.notifier).change(cityName: 'seoul');
                  },
                  child: Text('서울')),
              SizedBox(
                width: 5,
              ),
              ElevatedButton(
                  onPressed: () {
                    ref.read(cityProvider.notifier).change(cityName: 'london');
                  },
                  child: Text('런던')),
            ],
          ),
          Column(
            children: [
              Text('$city'),
              weather.when(
                data: (weather) {
                  return weather == 'sunny'
                      ? Icon(
                          Icons.sunny,
                          color: Colors.red,
                        )
                      : Icon(Icons.cloud);
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () {
                  return CircularProgressIndicator();
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Consumer(
            builder: (context, ref, child) {
              final currentTime = ref.watch(clockProvider);
              final timeFormatted = DateFormat.Hms().format(currentTime);
              return Text(timeFormatted);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Consumer(builder: (context, ref, child) {
            final news = ref.watch(newsProvider);
            return Column(
              children: [
                news.when(
                  data: (news) {
                    return Center(
                      child: SizedBox(
                        width: 600,
                        height: 200,
                        child: ListView.builder(
                          itemCount: news.length,
                          itemBuilder: (context, index) {
                            final newsItem = news[index];
                            return ListTile(title: Text(newsItem.title));
                          },
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => CircularProgressIndicator(),
                ),
                ElevatedButton(
                    onPressed: () {
                      ref.read(newsProvider.notifier).addNewsItem(
                          newsItem:
                              NewsItem(title: '새로운 뉴스', content: '쁘미 밥 먹이기'));
                    },
                    child: Text('addNews'))
              ],
            );
          }),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                ref.invalidate(counterProvider);
                ref.invalidate(cityProvider);
                ref.invalidate(weatherProvider);
                ref.invalidate(currentUserProvider);
              },
              child: Text('Reset Provider'))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state =
              ref.read(counterProvider.notifier).state + 1;
        },
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final counter = ref.watch(counterProvider);
                return Text('$counter');
              },
            ),
            Icon(Icons.plus_one),
          ],
        ),
      ),
    );
  }
}
