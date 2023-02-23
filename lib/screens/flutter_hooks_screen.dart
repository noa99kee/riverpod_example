import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlutterHooksScreen extends StatelessWidget {
  const FlutterHooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('flutter hooks')),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          FadeIn(
              child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          )),
          SizedBox(
            width: 50,
          ),
          FadeInHook(
              child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ))
        ]),
      ),
    );
  }
}

class FadeIn extends StatefulWidget {
  const FadeIn({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  @override
  void initState() {
    super.initState();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Opacity(
          opacity: animationController.value,
          child: widget.child,
        );
      },
    );
  }
}

class FadeInHook extends HookWidget {
  const FadeInHook({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // Create an AnimationController. The controller will automatically be
    // disposed when the widget is unmounted.
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    // useEffect is the equivalent of initState + didUpdateWidget + dispose.
    // The callback passed to useEffect is executed the first time the hook is
    // invoked, and then whenever the list passed as second parameter changes.
    // Since we pass an empty const list here, that's strictly equivalent to `initState`.
    useEffect(() {
      print('effect');
      // start the animation when the widget is first rendered.
      animationController.forward();
      // We could optionally return some "dispose" logic here
      return () {
        print('clean up');
      };
    }, const []);

    // Tell Flutter to rebuild this widget when the animation updates.
    // This is equivalent to AnimatedBuilder
    useAnimation(animationController);

    return Opacity(
      opacity: animationController.value,
      child: child,
    );
  }
}
