import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class InboxPage extends StatelessWidget {
  const InboxPage._({Key key}) : super(key: key);

  static Widget withDependencies() {
    return const InboxPage._();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return const ListItem();
            }),
          ),
        ],
      ),
    );
  }
}
