import 'package:after_layout/after_layout.dart';
import 'package:babayev_website/drawer/drawer_view.dart';
import 'package:babayev_website/footer/footer_view.dart';
import 'package:babayev_website/header/header_view.dart';
import 'package:babayev_website/navigationbar/navigationbar_view.dart';
import 'package:babayev_website/project/project_view.dart';
import 'package:babayev_website/skills/skills_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'back_to_top_button.dart';

class PortfolioView extends StatefulWidget {
  const PortfolioView({
    Key key,
  }) : super(key: key);

  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin {
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();

  List<NavigationItem> navigationItems = [];

  final ScrollController scrollController = ScrollController(
    initialScrollOffset: 0,
  );
  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem('Projects', key: projectKey),
        NavigationItem('Skills', key: skillsKey),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(update: (_, __) {
          return navigationItems;
        }),
        ChangeNotifierProvider<ScrollController>(create: (_) {
          return scrollController;
        }),
      ],
      child: Scaffold(
        endDrawer: DrawerView(),
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                NavigationBarView(),
                HeaderView(),
                ProjectView(key: projectKey),
                SkillsView(key: skillsKey),
                FooterView(),
              ],
            ),
          ),
        ),
        floatingActionButton: BackToTopButton(),
      ),
    );
  }
}

class NavigationItem {
  final String text;
  final GlobalKey key;
  NavigationItem(
    this.text, {
    @required this.key,
  });

  double get position => _getPosition(key);
}

double _getPosition(GlobalKey key) {
  final RenderBox renderBox = key.currentContext.findRenderObject();
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}
