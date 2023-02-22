import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/dio_provider.dart';
import 'package:riverpod_examples/main.dart';
import 'package:riverpod_examples/screens/config_screen.dart';
import 'package:riverpod_examples/tmdb_result/tmdb_result.dart';

part 'tmdb_screen.g.dart';

@riverpod
Future<List<TmdbMovie>?> tmdbMovies(TmdbMoviesRef ref) async {
  final link = ref.keepAlive();
  Timer? timer;
  final CancelToken cancelToken = CancelToken();

  ref.onDispose(() {
    print('tmdbMoviesProvider onDispose');
    cancelToken.cancel();
    timer?.cancel();
  });

  ref.onCancel(() {
    print('tmdbMoviesProvider onCancel');
    timer = Timer(const Duration(seconds: 5), () {
      link.close();
    });
  });

  ref.onResume(() {
    print('tmdbMoviesProvider onResume');
    timer?.cancel();
  });

  //이런 식도 되고
  //final config = await ref.watch(configProvider.future);

  final config = ref.watch(preConfigProvider);
  //프로바이더 본문 내부에서 read를 하지 마세요.
  final dio = ref.watch(dioProvider);

  var response = await dio.get(config.now_playing, cancelToken: cancelToken);

  TmdbResult tmdbResult = TmdbResult.fromJson(response.data);

  return tmdbResult.results;
}

@riverpod
Future<TmdbMovie?> tmdbMovie(TmdbMovieRef ref, {required int id}) async {
  final link = ref.keepAlive();
  Timer? timer;
  final CancelToken cancelToken = CancelToken();

  ref.onDispose(() {
    print('tmdbMovieProvider onDispose');
    cancelToken.cancel();
    timer?.cancel();
  });

  ref.onCancel(() {
    print('tmdbMovieProvider onCancel');
    timer = Timer(const Duration(seconds: 5), () {
      link.close();
    });
  });

  ref.onResume(() {
    print('tmdbMovieProvider onResume');
    timer?.cancel();
  });

  //이런 식도 되고
  //final config = await ref.watch(configProvider.future);

  final config = ref.watch(preConfigProvider);
  //프로바이더 본문 내부에서 read를 하지 마세요.
  final dio = ref.watch(dioProvider);

  var response = await dio.get(
      '${config.movie}$id?api_key=f4fe0fea24f43e90075c5835794ec63b',
      cancelToken: cancelToken);

  TmdbMovie tmdbMovie = TmdbMovie.fromJson(response.data);

  return tmdbMovie;
}

class TMDBScreen extends ConsumerWidget {
  const TMDBScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(tmdbMoviesProvider);
    final config = ref.watch(preConfigProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('tmdb (defendency other provider)'),
        ),
        body: Center(
          child: movies.when(
            data: (movies) {
              return ListView.builder(
                itemCount: movies!.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () {
                      context.go('/tmdb/tmdbdetail/${movie.id}');
                    },
                    child: Container(
                      width: 300,
                      height: 300,
                      padding: EdgeInsets.all(8),
                      child: Stack(children: [
                        Image.network(
                          '${config.image}${movie.posterPath}',
                          fit: BoxFit.contain,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 150,
                            height: 100,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                movie.title!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => CircularProgressIndicator(),
          ),
        ));
  }
}

class TMDBDetailScreen extends ConsumerWidget {
  const TMDBDetailScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(tmdbMovieProvider(id: int.parse(id)));
    final config = ref.watch(preConfigProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Movie')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: movie.when(
            data: (movie) {
              return Row(
                children: [
                  Image.network(
                    '${config.image}${movie!.posterPath}',
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title!,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 500,
                          child: Text(
                            movie.overview!,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
