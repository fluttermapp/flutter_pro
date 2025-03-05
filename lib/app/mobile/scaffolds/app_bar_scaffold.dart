import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarScaffold extends StatefulWidget {
  const AppBarScaffold({
    super.key,
    required this.title,
    this.actions,
    required this.child,
  });

  final String title;
  final List<Widget>? actions;
  final Widget child;

  @override
  State<AppBarScaffold> createState() => _AppBarScaffoldState();
}

class _AppBarScaffoldState extends State<AppBarScaffold> {
  double collapsedBarHeight = 60.0;
  double expandedBarHeight = 100.0;
  ScrollController scrollController = ScrollController();
  bool isCollapsed = false;
  bool didAddFeedback = false;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        isCollapsed = scrollController.hasClients &&
            scrollController.offset > (expandedBarHeight - collapsedBarHeight);
        if (isCollapsed && !didAddFeedback) {
          HapticFeedback.mediumImpact();
          didAddFeedback = true;
        } else if (!isCollapsed) {
          didAddFeedback = false;
        }
        setState(() {});
        return false;
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: expandedBarHeight,
            collapsedHeight: collapsedBarHeight,
            pinned: true,
            snap: false,
            floating: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: null,
            scrolledUnderElevation: 0,
            actions: widget.actions,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 15.0),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: isCollapsed ? 0 : 1,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Divider(
                          color: Theme.of(context).colorScheme.primary,
                          thickness: 3,
                          endIndent: constraints.maxWidth * 0.9,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
