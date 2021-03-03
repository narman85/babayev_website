import 'package:babayev_website/components/mobile_desktop_view_builder.dart';
import 'package:babayev_website/constants/constants.dart';
import 'package:babayev_website/portfolio/portfolio_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:babayev_website/util/hover_extension.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: NavigationMobileView(),
      desktopView: NavigationDesktopView(),
    );
  }
}

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
      height: 100,
      width: 1200,
      padding: kScreenPadding,
      child: Row(
        children: [
          Image.asset(
            'images/nariman.webp',
            height: 30,
          ),
          Spacer(),
          for (var item in navigationItems)
            NavigationBarItem(
              color: Colors.white,
              onPressed: () {
                scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                );
              },
              text: item.text,
            ),
        ],
      ),
    );
  }
}

class NavigationMobileView extends StatelessWidget {
  const NavigationMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: 20),
          Image.asset(
            'images/nariman.webp',
            height: 24,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ],
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key key,
    @required this.onPressed,
    @required this.color,
    @required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 650;
    return Container(
      padding: const EdgeInsets.only(left: 64),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: isSmall ? 17 : 24,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    ).moveUpOnHover;
  }
}
