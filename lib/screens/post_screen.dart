import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/dio_provider.dart';

part 'post_screen.g.dart';
part 'post_screen.freezed.dart';

@freezed
class Post with _$Post {
  factory Post({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@Riverpod(keepAlive: true)
PostRepository postRepository(PostRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return PostRepository(dio, baseUrl: 'https://jsonplaceholder.typicode.com');
}

@RestApi()
abstract class PostRepository {
  factory PostRepository(Dio dio, {String baseUrl}) = _PostRepository;

  @GET('/posts')
  Future<List<Post>> getPosts({CancelToken? cancelToken});

  @GET('/posts/{id}')
  Future<Post> getPost(@Path('id') String id, {CancelToken? cancelToken});
}

class PostsNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  final Ref ref;
  final CancelToken? cancelToken;
  PostsNotifier({
    required this.ref,
    this.cancelToken,
  }) : super(const AsyncValue.loading()) {
    getPosts(cancelToken: cancelToken);
  }

  Future<void> getPosts({CancelToken? cancelToken}) async {
    state = const AsyncValue.loading();
    final repository = ref.read(
        postRepositoryProvider); //watch 감시 사용할 필요 없다. 이럴 경우만 read (읽기만 하고 다시 사요(빌드) 하지 않는다.)
    //이 상황에서 우리는 read 를 사용할 수 있습니다. 이것은 watch 와 유사 하지만 공급자가 얻은 값이 변경될 때 노출하는 값을 다시 만들지 않도록 합니다.
    try {
      final posts = await repository
          .getPosts(cancelToken: cancelToken)
          .catchError((Object obj) {
        switch (obj.runtimeType) {
          case DioError:
            final errorObj = obj as DioError;
            throw errorObj.message!;
          default:
            break;
        }
      });
      state = AsyncValue.data(posts);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}

final postsProvider =
    StateNotifierProvider.autoDispose<PostsNotifier, AsyncValue<List<Post>>>(
  (ref) {
    final link = ref.keepAlive();
    Timer? timer;
    final CancelToken cancelToken = CancelToken();

    ref.onDispose(() {
      print('postsProvider onDispose');
      cancelToken.cancel();
      timer?.cancel();
    });

    ref.onCancel(() {
      print('postsProvider onCancel');
      timer = Timer(const Duration(seconds: 5), () {
        link.close();
      });
    });

    ref.onResume(() {
      print('postsProvider onResume');
      timer?.cancel();
    });
    return PostsNotifier(ref: ref);
  },
);

class PostNotifier extends StateNotifier<AsyncValue<Post>> {
  final Ref ref;
  final String id;
  final CancelToken? cancelToken;
  PostNotifier({
    required this.ref,
    required this.id,
    this.cancelToken,
  }) : super(const AsyncValue.loading()) {
    getPost(id: id, cancelToken: cancelToken);
  }

  Future<void> getPost({required String id, CancelToken? cancelToken}) async {
    state = const AsyncValue.loading();
    final repository = ref.read(
        postRepositoryProvider); //이 상황에서 우리는 read 를 사용할 수 있습니다. 이것은 watch 와 유사 하지만 공급자가 얻은 값이 변경될 때 노출하는 값을 다시 만들지 않도록 합니다.
    /*
    try {
      final post = await repository
          .getPost(id, cancelToken: cancelToken)
          .catchError((Object obj) {
        switch (obj.runtimeType) {
          case DioError:
            final errorObj = obj as DioError;
            throw errorObj.message!;
          default:
            break;
        }
      });
      state = AsyncValue.data(post);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  */
    //위와 같은걸 아래와 같이 축약 할수 있다.
    state = await AsyncValue.guard(() => repository.getPost(id));
  }
}

final postProvider = StateNotifierProvider.autoDispose
    .family<PostNotifier, AsyncValue<Post>, String>(
  (ref, id) {
    final link = ref.keepAlive();
    Timer? timer;
    final CancelToken cancelToken = CancelToken();

    ref.onDispose(() {
      print('postProvider onDispose');
      cancelToken.cancel();
      timer?.cancel();
    });

    ref.onCancel(() {
      print('postProvider onCancel');
      timer = Timer(const Duration(seconds: 5), () {
        link.close();
      });
    });

    ref.onResume(() {
      print('postProvider onResume');
      timer?.cancel();
    });

    return PostNotifier(ref: ref, id: id);
  },
);

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('post (StateNotifierProvider with async)'),
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
                    context.go('/post/detail/${post.id}');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text(
                          post.id.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          post.title,
                          style: const TextStyle(
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

class PostDetailScreen extends ConsumerWidget {
  const PostDetailScreen({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postProvider(id));
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
