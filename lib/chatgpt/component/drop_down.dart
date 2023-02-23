import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:riverpod_examples/chatgpt/component/text_widget.dart';
import 'package:riverpod_examples/chatgpt/provider/chat_gpt_models_provider.dart';
import 'package:riverpod_examples/chatgpt/screens/chat_gpt_screen.dart';

class ModelsDrowDownWidget extends ConsumerStatefulWidget {
  const ModelsDrowDownWidget({super.key});

  @override
  ConsumerState<ModelsDrowDownWidget> createState() =>
      _ModelsDrowDownWidgetState();
}

class _ModelsDrowDownWidgetState extends ConsumerState<ModelsDrowDownWidget> {
  bool isFirstLoading = true;
  @override
  Widget build(BuildContext context) {
    final modelsResult = ref.watch(chatGptModelsProvider);

    return modelsResult.when(
      data: (modelResult) {
        final models = modelResult.data!;

        return FittedBox(
          child: DropdownButton(
            dropdownColor: scaffoldBackgroundColor,
            iconEnabledColor: Colors.white,
            items: List<DropdownMenuItem<String>>.generate(
                models.length,
                (index) => DropdownMenuItem(
                    value: models[index].id,
                    child: TextWidget(
                      label: models[index].id.toString(),
                      fontSize: 15,
                    ))),
            value: ref.watch(currentModelProvider),
            onChanged: (value) {
              ref.read(currentModelProvider.notifier).state = value.toString();
            },
          ),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: TextWidget(label: error.toString()),
        );
      },
      loading: () {
        return FittedBox(
          child: SpinKitFadingCircle(
            color: Colors.lightBlue,
            size: 30,
          ),
        );
      },
    );
  }
}
