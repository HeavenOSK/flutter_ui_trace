import 'package:flutter/material.dart';

const flexibleBottomHeight = 60.0;

class SearchFlexibleAppBar extends StatelessWidget {
  const SearchFlexibleAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      backgroundColor: Colors.white,
      expandedHeight: kToolbarHeight + flexibleBottomHeight,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Title(),
              _SearchField(height: constraints.maxHeight - kToolbarHeight),
            ],
          );
        },
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    @required this.height,
    Key key,
  }) : super(key: key);

  final double height;

  double get opacityValue => height / flexibleBottomHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 8 * 2 <= height ? height - 8 * 2 : 0,
        ),
        color: Colors.orange.withOpacity(opacityValue),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Colors.grey,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          '受信',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
