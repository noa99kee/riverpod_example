import 'package:flutter/material.dart';

class BoxConstraintScreen extends StatefulWidget {
  const BoxConstraintScreen({super.key});

  @override
  State<BoxConstraintScreen> createState() => _BoxConstraintScreenState();
}

class _BoxConstraintScreenState extends State<BoxConstraintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('box constraint')),
      body: SafeArea(
          child: Column(
        children: [
          renderLogo(),
          renderGrid(),
        ],
      )),
    );
  }

  Widget renderGrid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        itemCount: 15,
        itemBuilder: (context, index) {
          return Container(
              color: Colors.amber,
              child: TextButton(onPressed: () {}, child: Text('$index')));
        },
      ),
    );
  }

  Widget renderLogo() {
    //부모 위젯이 자식 위젯을 제약 한다.
    return Container(
      color: Colors.green.withOpacity(0.3),
      width: 300,
      height: 300,
      //BoxConstraints가 minWidth=300, maxWidth=300, minHeight=300, maxHeight=300 ==>팽팽한(tight) 제약 ex)SizedBox, Container 크기 지정
      //느슨(loose)한 제약 ==> minWidth=0, maxWidth>0, minHeight=0, maxHeight>0  ex)Center위젯
      child: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
