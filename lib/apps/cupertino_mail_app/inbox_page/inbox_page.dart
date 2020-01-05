import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_trace/apps/cupertino_mail_app/inbox_page/components/list_item.dart';

import 'components/search_flexible_app_bar.dart';

class InboxPage extends StatelessWidget {
  const InboxPage._({Key key}) : super(key: key);

  static Widget withDependencies() {
    return const InboxPage._();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: const Text('受信'),
      ),
      body: CustomScrollView(
        slivers: [
          const SearchFlexibleAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const ListItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
