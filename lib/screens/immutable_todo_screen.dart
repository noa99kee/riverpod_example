import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class IMTodo {
  const IMTodo(
      {required this.id, required this.description, required this.completed});

  final String id;
  final String description;
  final bool completed;

  IMTodo copyWith({String? id, String? description, bool? completed}) {
    return IMTodo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

//불변 상태
class IMTodosNotifier extends StateNotifier<List<IMTodo>> {
  IMTodosNotifier()
      : super([
          const IMTodo(id: '1', description: '쁘미 밥 주기', completed: false),
          const IMTodo(id: '2', description: '또리 물 주기', completed: true),
          const IMTodo(id: '3', description: '깜봉 놀아 주기', completed: false),
        ]);

  void addTodo(IMTodo todo) {
    state = [...state, todo];
  }

  void removeTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

final imTodosProvider =
    StateNotifierProvider<IMTodosNotifier, List<IMTodo>>((ref) {
  ref.onDispose(
    () {
      print('imTodosProvider onDispose');
    },
  );
  return IMTodosNotifier();
});

class IMTodoScreen extends ConsumerWidget {
  const IMTodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<IMTodo> todos = ref.watch(imTodosProvider);
    return Scaffold(
      appBar: AppBar(title: Text('imtodo (StateNotifierProvider) 불변 상태')),
      body: ListView(
        children: [
          for (final todo in todos)
            CheckboxListTile(
              value: todo.completed,
              onChanged: (value) =>
                  ref.read(imTodosProvider.notifier).toggle(todo.id),
              title: Text(todo.description),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          IMTodo todo = IMTodo(id: '4', description: '새 할일', completed: false);
          ref.read(imTodosProvider.notifier).addTodo(todo);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
