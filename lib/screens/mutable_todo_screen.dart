import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MTodo {
  MTodo({
    required this.id,
    required this.description,
    required this.completed,
  });
  String id;
  String description;
  bool completed;
}

//가변 상태를 원한다. ChangeNotifier

class MTodosNotifier extends ChangeNotifier {
  final todos = <MTodo>[
    MTodo(id: '1', description: '쁘미 밥 주기', completed: false),
    MTodo(id: '2', description: '또리 물 주기', completed: false),
    MTodo(id: '3', description: '깜봉 놀아 주기', completed: false),
  ];

  void addTodo(MTodo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void removeTodo(String todoId) {
    todos.remove(todos.firstWhere((element) => element.id == todoId));
    notifyListeners();
  }

  void toggle(String todoId) {
    for (final todo in todos) {
      if (todo.id == todoId) {
        todo.completed = !todo.completed;
        notifyListeners();
      }
    }
  }
}

final mTodosProvider =
    ChangeNotifierProvider<MTodosNotifier>((ref) => MTodosNotifier());

class MTodoScreen extends ConsumerWidget {
  const MTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MTodo> todos = ref.watch(mTodosProvider).todos;
    return Scaffold(
      appBar: AppBar(title: Text('mtodo (ChangeNotifierProvider) 가변 상태')),
      body: ListView(children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.completed,
            onChanged: (value) =>
                ref.read(mTodosProvider.notifier).toggle(todo.id),
            title: Text(todo.description),
          )
      ]),
    );
  }
}
