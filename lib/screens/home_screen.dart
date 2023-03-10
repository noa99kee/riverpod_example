import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.2,
              image: NetworkImage(
                'https://picsum.photos/1920/1080',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 50,
                ),
                Text(
                    '########################### riverpod ###########################'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/helloworld');
                    },
                    child: Text('hello world (Provider)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/notifier');
                    },
                    child: Text('notifier'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/page');
                    },
                    child: Text('page (NotifierProvider)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/config');
                    },
                    child: Text('config (FutureProvider)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/product');
                    },
                    child: Text('product (StateProvider)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/chat');
                    },
                    child: Text('chat (StreamProvider)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/mtodo');
                    },
                    child: Text('mutable_todo (ChangeNotifierProvider ??????)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/imtodo');
                    },
                    child: Text('immutable_todo (StateNotifierProvider ??????)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/job');
                    },
                    child: Text('job (NotifierProvider)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/post');
                    },
                    child: Text('post (StateNotifierProvider with async)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/postnew');
                    },
                    child: Text('post new (NotifierProvider with async)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/tmdb');
                    },
                    child: Text('tmdb (defendency other provider)'),
                  ),
                ),
                Text(
                    '########################### flutter ????????? ###########################'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/localization');
                    },
                    child: Text('localization'),
                  ),
                ),
                Text(
                    '########################### flutter widgets ###########################'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/boxconstraint');
                    },
                    child: Text('boxconstraint'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/flutterhooks');
                    },
                    child: Text('flutter_hooks'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/sliver');
                    },
                    child: Text('sliver'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/chatgpt');
                    },
                    child: Text('chatgpt'),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
