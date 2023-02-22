import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_examples/screens/box_constraint_screen.dart';
import 'package:riverpod_examples/screens/chat_screen.dart';
import 'package:riverpod_examples/screens/config_screen.dart';
import 'package:riverpod_examples/screens/flutter_hooks_screen.dart';
import 'package:riverpod_examples/screens/hello_world.dart';
import 'package:riverpod_examples/screens/home_screen.dart';
import 'package:riverpod_examples/screens/immutable_todo_screen.dart';
import 'package:riverpod_examples/screens/job_screen.dart';
import 'package:riverpod_examples/screens/localization_screen.dart';
import 'package:riverpod_examples/screens/page_screen.dart';
import 'package:riverpod_examples/screens/post_new_screen.dart';
import 'package:riverpod_examples/screens/post_screen.dart';
import 'package:riverpod_examples/screens/mutable_todo_screen.dart';
import 'package:riverpod_examples/screens/product_screen.dart';
import 'package:riverpod_examples/screens/sliver_screen.dart';
import 'package:riverpod_examples/screens/tmdb_screen.dart';

part 'go_router_provider.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),
        routes: [
          GoRoute(
            path: 'helloworld',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: HelloWorld()),
          ),
          GoRoute(
            path: 'page',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: PageScreen()),
          ),
          GoRoute(
            path: 'config',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ConfigScreen()),
          ),
          GoRoute(
            path: 'product',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ProductScreen()),
          ),
          GoRoute(
            path: 'chat',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: ChatScreen()),
          ),
          GoRoute(
            path: 'mtodo',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: MTodoScreen()),
          ),
          GoRoute(
            path: 'imtodo',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: IMTodoScreen()),
          ),
          GoRoute(
            path: 'job',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: JobScreen()),
          ),
          GoRoute(
            path: 'post',
            pageBuilder: (context, state) => NoTransitionPage(
              child: PostScreen(),
            ),
            routes: [
              GoRoute(
                  path: 'detail/:id',
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: PostDetailScreen(
                          id: state.params['id'].toString(),
                        ),
                      ))
            ],
          ),
          GoRoute(
            path: 'postnew',
            pageBuilder: (context, state) => NoTransitionPage(
              child: PostNewScreen(),
            ),
            routes: [
              GoRoute(
                  path: 'detailnew/:id',
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: DetailNewScreen(
                          id: state.params['id'].toString(),
                        ),
                      ))
            ],
          ),
          GoRoute(
            path: 'tmdb',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: TMDBScreen()),
            routes: [
              GoRoute(
                  path: 'tmdbdetail/:id',
                  pageBuilder: (context, state) => NoTransitionPage(
                        child: TMDBDetailScreen(
                          id: state.params['id'].toString(),
                        ),
                      ))
            ],
          ),
          GoRoute(
            path: 'localization',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: LocalizationScreen()),
          ),
          GoRoute(
            path: 'boxconstraint',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: BoxConstraintScreen()),
          ),
          GoRoute(
            path: 'flutterhooks',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: FlutterHooksScreen()),
          ),
          GoRoute(
            path: 'sliver',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: SliverScreen()),
          ),
        ],
      ),
    ],
  );
}
