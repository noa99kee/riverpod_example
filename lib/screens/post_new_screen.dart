import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/screens/post_screen.dart';

part 'post_new_screen.g.dart';

@riverpod
class NewPosts extends _$NewPosts {
  @override
  FutureOr<List<Post>> build() async {
    ref.onDispose(
      () {
        print('newPostsProvider onDispose');
      },
    );
    return _fetchPosts();
  }

  Future<List<Post>> _fetchPosts() async {
    final repository = ref.watch(postRepositoryProvider);
    final posts = await repository.getPosts().catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final errorObj = obj as DioError;
          throw errorObj.message!;
        default:
          break;
      }
    });
    return posts;
  }
}

@riverpod
class NewPost extends _$NewPost {
  @override
  FutureOr<Post> build({required String id}) async {
    final link = ref.keepAlive();
    Timer? timer;
    final CancelToken cancelToken = CancelToken();

    ref.onDispose(() {
      print('newPostProvider onDispose');
      cancelToken.cancel();
      timer?.cancel();
    });

    ref.onCancel(() {
      print('newPostProvider onCancel');
      timer = Timer(const Duration(seconds: 5), () {
        link.close();
      });
    });

    ref.onResume(() {
      print('newPostProvider onResume');
      timer?.cancel();
    });
    return _fetchPost(id: id);
  }

  Future<Post> _fetchPost({required String id}) async {
    final repository = ref.watch(postRepositoryProvider);
    final post = await repository.getPost(id).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final errorObj = obj as DioError;
          throw errorObj.message!;
        default:
          break;
      }
    });
    return post;
  }
}

class PostNewScreen extends ConsumerWidget {
  const PostNewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(newPostsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('post new (NotifierProvider with async)'),
      ),
      body: Center(
        child: posts.when(
          data: (posts) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    context.go('/postnew/detailnew/${post.id}');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text(
                          post.id.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          post.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class DetailNewScreen extends ConsumerWidget {
  const DetailNewScreen({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(newPostProvider(id: id));
    return Scaffold(
      appBar: AppBar(title: Text('$id')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: post.when(
          data: (post) => SizedBox(
            width: double.infinity,
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(post.body),
              ],
            ),
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
