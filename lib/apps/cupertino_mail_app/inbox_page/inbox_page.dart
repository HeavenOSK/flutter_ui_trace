import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_trace/apps/cupertino_mail_app/inbox_page/components/list_item.dart';
import 'package:provider/provider.dart';

import 'components/flexible_search_app_bar.dart';

// TODO(HeavenOSK): 1.検索窓が中途半端なところで止まらないようにする
// TODO(HeavenOSK): 2.NavigationBarの色とelevationを動的に変更する
class InboxPage extends StatelessWidget {
  const InboxPage._({Key key}) : super(key: key);

  static Widget withDependencies() {
    return const InboxPage._();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Scaffold(),
    );
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PrimaryScrollController.of(context);

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: _AppBarTitle.withDependencies(controller),
        trailing: Text(
          '編集',
          style: TextStyle(
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () => Future.delayed(const Duration(seconds: 2)),
          ),
          const FlexibleSearchAppBar(),
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

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle._({Key key}) : super(key: key);

  static Widget withDependencies(ScrollController controller) {
    return ChangeNotifierProvider(
      create: (_context) => controller,
      child: const _AppBarTitle._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ScrollController>(context);
    final shouldShow =
        kToolbarHeight + flexibleBottomAreaHeight - 20 <= controller.offset;
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: shouldShow ? 1.0 : 0.0,
      child: const Text('受信'),
    );
  }
}
