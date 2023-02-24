import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_screen.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() {
    return 0;
  }

  void goToPreviousPage() {
    state = state - 1;
  }

  void goToNextPage() {
    state = state + 1;
  }
}

@riverpod
bool canGoToPreviousPage(CanGoToPreviousPageRef ref) {
  return ref.watch(pageIndexProvider) != 0;
}

@riverpod
bool canGoToNextPage(CanGoToNextPageRef ref) {
  return ref.watch(pageIndexProvider) != 9;
}

class PreviousButton extends ConsumerWidget {
  const PreviousButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canGoToPreviousPage = ref.watch(canGoToPreviousPageProvider);
    void goToPreviousPage() {
      ref.read(pageIndexProvider.notifier).goToPreviousPage();
    }

    return ElevatedButton(
      onPressed: canGoToPreviousPage ? goToPreviousPage : null,
      child: const Text('previous'),
    );
  }
}

class NextButton extends ConsumerWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canGoToNextPage = ref.watch(canGoToNextPageProvider);
    void goToNextPage() {
      ref.read(pageIndexProvider.notifier).goToNextPage();
    }

    return ElevatedButton(
      onPressed: canGoToNextPage ? goToNextPage : null,
      child: const Text('next'),
    );
  }
}

class PageScreen extends ConsumerWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('page (NotifierProvider)')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(ref.watch(pageIndexProvider).toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PreviousButton(),
              NextButton(),
            ],
          )
        ]),
      ),
    );
  }
}
