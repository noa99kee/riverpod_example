import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifier_screen.g.dart';
part 'notifier_screen.freezed.dart';

@freezed
class Member with _$Member {
  const factory Member({
    required String id,
    required String name,
  }) = _Member;
}

// StateNotifier Provider
class MembersStateNotifier extends StateNotifier<AsyncValue<List<Member>>> {
  MembersStateNotifier() : super(AsyncValue.loading()) {
    getMembers();
  }

  Future<void> getMembers() async {
    state = AsyncValue.loading();
    await Future.delayed(Duration(seconds: 1));
    state = AsyncValue.data([
      Member(id: '1', name: 'keesoon'),
      Member(id: '2', name: 'younga'),
    ]);
  }

  Future<void> addNewMember({required Member member}) async {
    print('state.value:${state.value}');
    final prevMembers = state.value;
    state = AsyncValue.loading();
    print('state.value:${state.value}'); //null이 나온다.
    await Future.delayed(Duration(seconds: 1));

    state = AsyncValue.data([...?prevMembers, member]);
  }
}

final membersStateNotifierProvider =
    StateNotifierProvider<MembersStateNotifier, AsyncValue<List<Member>>>(
        (ref) => MembersStateNotifier());

//(Async)NotifierProvider
class MembersAsyncNotifier extends AsyncNotifier<List<Member>> {
  @override
  FutureOr<List<Member>> build() {
    return getMembers();
  }

  Future<List<Member>> getMembers() async {
    state = AsyncValue.loading();
    await Future.delayed(Duration(seconds: 1));

    return [
      Member(id: '1', name: 'keesoon'),
      Member(id: '2', name: 'younga'),
    ];
  }

  Future<void> addNewMember({required Member member}) async {
    print('state.value:${state.value}');
    state = AsyncValue.loading();
    await Future.delayed(Duration(seconds: 1));
    state = AsyncValue.data([...?state.value, member]);
  }
}

final membersAsyncNotifierProvider =
    AsyncNotifierProvider<MembersAsyncNotifier, List<Member>>(
  () => MembersAsyncNotifier(),
);

//async notifier provider generator
@riverpod
class Members extends _$Members {
  @override
  FutureOr<List<Member>> build() {
    return getMembers();
  }

  Future<List<Member>> getMembers() async {
    state = AsyncValue.loading();
    await Future.delayed(Duration(seconds: 1));

    return [
      Member(id: '1', name: 'keesoon'),
      Member(id: '2', name: 'younga'),
    ];
  }

  Future<void> addNewMember({required Member member}) async {
    print('state.value:${state.value}');
    state = AsyncValue.loading();
    await Future.delayed(Duration(seconds: 1));
    state = AsyncValue.data([...?state.value, member]);
  }
}

class AuthRepository {
  Future<void> signIn(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    print('login success');
    //throw 'login fail';
  }
}

final authRepositoryProvider = Provider((ref) => AuthRepository());

class AuthViewModel extends AsyncNotifier<void> {
  late final AuthRepository _repository;
  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepositoryProvider);
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () async => await _repository.signIn(email, password));
  }
}

final authViewModelProvider = AsyncNotifierProvider<AuthViewModel, void>(
  () => AuthViewModel(),
);

class NotifierScreen extends ConsumerStatefulWidget {
  const NotifierScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotifierScreenState();
}

class _NotifierScreenState extends ConsumerState<NotifierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('notifier')),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: Consumer(
              builder: (context, ref, child) {
                final members = ref.watch(membersStateNotifierProvider);
                return members.when(
                    data: (members) {
                      return ListView.builder(
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final member = members[index];
                          return Text(member.name);
                        },
                      );
                    },
                    error: (error, statckTrace) => Text(error.toString()),
                    loading: () => Center(child: CircularProgressIndicator()));
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(membersStateNotifierProvider.notifier)
                  .addNewMember(member: Member(id: '3', name: 'doyoul'));
            },
            child: Text('add new member'),
          ),
          SizedBox(
            height: 100,
            child: Consumer(
              builder: (context, ref, child) {
                final members = ref.watch(membersAsyncNotifierProvider);
                final isLoading = ref
                    .watch(membersAsyncNotifierProvider)
                    .isLoading; //이런게 들어 있다.
                return members.when(
                    data: (members) {
                      return ListView.builder(
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final member = members[index];
                          return Text(member.name);
                        },
                      );
                    },
                    error: (error, statckTrace) => Text(error.toString()),
                    loading: () => Center(child: CircularProgressIndicator()));
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(membersAsyncNotifierProvider.notifier)
                  .addNewMember(member: Member(id: '3', name: 'doyoul'));
            },
            child: Text('add new member'),
          ),
          SizedBox(
            height: 100,
            child: Consumer(
              builder: (context, ref, child) {
                final members = ref.watch(membersProvider);
                return members.when(
                    data: (members) {
                      return ListView.builder(
                        itemCount: members.length,
                        itemBuilder: (context, index) {
                          final member = members[index];
                          return Text(member.name);
                        },
                      );
                    },
                    error: (error, statckTrace) => Text(error.toString()),
                    loading: () => Center(child: CircularProgressIndicator()));
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(membersProvider.notifier)
                  .addNewMember(member: Member(id: '3', name: 'doyoul'));
            },
            child: Text('add new member'),
          ),
          SizedBox(
            height: 10,
          ),
          Consumer(
            builder: (context, ref, child) {
              return ElevatedButton(
                  onPressed: () {
                    ref.read(authViewModelProvider.notifier).login(
                        email: 'noa99kee@gmail.com', password: 'soon7611');
                  },
                  child: Text('login'));
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              final authViewModel = ref.watch(authViewModelProvider);
              if (authViewModel.hasError) {
                print('error');
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
