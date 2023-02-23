import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_examples/chatgpt/component/chat_widget.dart';
import 'package:riverpod_examples/chatgpt/component/drop_down.dart';
import 'package:riverpod_examples/chatgpt/component/text_widget.dart';
import 'package:riverpod_examples/chatgpt/provider/chat_gpt_chat_provider.dart';
import 'package:riverpod_examples/chatgpt/provider/chat_gpt_models_provider.dart';

Color scaffoldBackgroundColor = const Color(0xFF343541);
Color cardColor = const Color(0xFF444654);

class ChatGptScreen extends ConsumerStatefulWidget {
  const ChatGptScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends ConsumerState<ChatGptScreen> {
  bool _isTyping = false;
  bool _isLoading = false;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();

    super.dispose();
  }

  Future<void> showModalSheet({required BuildContext context}) async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      backgroundColor: scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return const Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextWidget(
                  label: "Chosen Model:",
                  fontSize: 16,
                ),
              ),
              Flexible(flex: 2, child: ModelsDrowDownWidget()),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Row(
          children: [
            Image.asset(
              'asset/images/openai_logo.jpg',
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("ChatGPT"),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await showModalSheet(context: context);
            },
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () {
            ref.invalidate(chatModelsProvider);
          },
          backgroundColor: Colors.white,
          child: SizedBox(
            child: Lottie.network(
              'https://assets3.lottiefiles.com/packages/lf20_VmD8Sl.json',
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 1,
              child: Lottie.network(
                  'https://assets7.lottiefiles.com/packages/lf20_p5yomfw6.json'),
            ),
          ),
          Column(
            children: [
              Flexible(child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final chatModels = ref.watch(chatModelsProvider);

                  ref.listen(chatModelsProvider, (previous, next) {
                    if (previous != next) {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  });

                  return ListView.builder(
                      controller: _listScrollController,
                      itemCount: chatModels.length,
                      itemBuilder: (context, index) {
                        final chatModel = chatModels[index];
                        return ChatWidget(
                          msg: chatModel.msg,
                          chatIndex: chatModel.chatIndex,
                        );
                      });
                },
              )),
              if (_isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 18,
                ),
              ],
              Align(
                alignment: Alignment.bottomLeft,
                child: Visibility(
                  visible: _isLoading,
                  child: Opacity(
                    opacity: 0.5,
                    child: Lottie.network(
                      'https://assets7.lottiefiles.com/packages/lf20_p8bfn5to.json',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: focusNode,
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) async {
                            await sendMessageFCT();
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: "How can I help you?",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await sendMessageFCT();
                          },
                          icon: const Icon(
                            Icons.send_rounded,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT() async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "You cant send multiple messages at a time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;

        final userChatModel = ChatModel(msg: msg, chatIndex: 0);

        ref.watch(chatModelsProvider.notifier).state = [
          ...ref.watch(chatModelsProvider.notifier).state,
          userChatModel
        ];

        textEditingController.clear();
        focusNode.unfocus();
      });

      ref.read(chatGptChatProvider(
          message: msg,
          model: ref.watch(currentModelProvider),
          max_tokens: 300));
      setState(() {
        _isLoading = true;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}
