import 'package:flutter/material.dart';

const rainbowColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
];

class SliverScreen extends StatelessWidget {
  const SliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppBar(),
          _sliverPersistentHeader(),
          _sliverToBoxAdapter(),
          _sliverList(),
          _sliverPersistentHeader(),
          _sliverBuilderList(),
          _sliverPersistentHeader(),
          _sliverGrid(),
          _sliverPersistentHeader(),
          _sliverBuilderGrid(),
        ],
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: true,
      stretch: true,
      expandedHeight: 200,
      collapsedHeight: 100,
      title: Text('sliver'),
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://picsum.photos/1920/1080',
          fit: BoxFit.cover,
        ),
        title: Text('FlexibleSpace'),
      ),
    );
  }

  SliverPersistentHeader _sliverPersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.yellow,
          child: Center(child: Text('SliverPersistentHeader')),
        ),
        maxHeight: 200,
        minHeight: 50,
      ),
    );
  }

  SliverToBoxAdapter _sliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Container(
          color: Colors.blue,
          height: 100,
          child: Center(
            child: Text('SliverToBoxAdapter'),
          )),
    );
  }

  SliverList _sliverList() {
    final List<int> numbers = List.generate(5, (index) => index);
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => CardWidget(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  SliverList _sliverBuilderList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return CardWidget(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 5,
      ),
    );
  }

  SliverGrid _sliverGrid() {
    final List<int> numbers = List.generate(5, (index) => index);
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => CardWidget(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  //ListView.builder 생성자와 유사함.
  SliverGrid _sliverBuilderGrid() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return CardWidget(
              color: rainbowColors[index % rainbowColors.length],
              index: index,
            );
          },
          childCount: 35,
        ),
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150));
  }
}

class SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverFixedHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.index,
    this.height,
    this.color,
  });

  final int index;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      color: color ?? color,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            'https://picsum.photos/1920/1080?random=$index',
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
