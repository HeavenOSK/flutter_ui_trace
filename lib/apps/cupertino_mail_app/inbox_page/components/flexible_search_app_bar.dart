import 'package:flutter/material.dart';

const flexibleBottomAreaHeight = 60.0;
const expandedHeight = kToolbarHeight + flexibleBottomAreaHeight;

const textFieldPadding = 8.0;
const textFieldMaxHeight = flexibleBottomAreaHeight - textFieldPadding * 2;

const iconOpacityHeightRange = 8.0;
const iconVisibleTextFieldMinimumHeight =
    textFieldMaxHeight - iconOpacityHeightRange;

class FlexibleSearchAppBar extends StatelessWidget {
  const FlexibleSearchAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      backgroundColor: Colors.white,
      expandedHeight: expandedHeight,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Title(),
              _SearchArea(height: constraints.maxHeight - kToolbarHeight),
            ],
          );
        },
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
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}

class _SearchArea extends StatelessWidget {
  const _SearchArea({
    @required this.height,
    Key key,
  }) : super(key: key);

  final double height;

  double get textFieldHeight =>
      textFieldPadding * 2 <= height ? height - textFieldPadding * 2 : 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: _TextField(
        height: textFieldHeight,
      ),
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField({
    @required this.height,
    Key key,
  }) : super(key: key);

  final double height;

  double get iconOpacity => height <= iconVisibleTextFieldMinimumHeight
      ? 0.0
      : (height - iconVisibleTextFieldMinimumHeight) / iconOpacityHeightRange;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: height,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 239, 242, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Opacity(
          opacity: iconOpacity,
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.3),
              ),
              const SizedBox(width: 2),
              Text(
                '検索',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
