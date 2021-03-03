import 'package:babayev_website/components/desktop_view_builder.dart';
import 'package:babayev_website/components/mobile_desktop_view_builder.dart';
import 'package:babayev_website/components/mobile_view_builder.dart';
import 'package:flutter/material.dart';

import 'project_item_body.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;
  ProjectItem({
    @required this.image,
    @required this.title,
    @required this.description,
    @required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: 'images/3.webp',
    title: 'The Cashier App',
    description:
        'The Cashier App helps you to easily manage all your accounts.',
    technologies: [
      'Flutter',
      'Firebase',
    ],
  ),
  ProjectItem(
    image: 'images/2.webp',
    title: 'The Courier App',
    description: 'The Courier App helps you to easily track all your orders.',
    technologies: [
      'Flutter',
      'Firebase',
    ],
  ),
  ProjectItem(
    image: 'images/1.webp',
    title: 'The Wish App',
    description: 'The Wish App helps you to memorize all your wishes.',
    technologies: [
      'Flutter',
      'Firebase',
    ],
  ),
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
  static const title = 'Projects';

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
        mobileView: ProjectMobileView(), desktopView: ProjectDesktopView());
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.title,
      children: [
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProjectItemBody(item: item),
                ),
              )
          ],
        ),
        SizedBox(height: 70),
      ],
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.title,
      children: [for (final item in kProjectItems) ProjectItemBody(item: item)],
    );
  }
}
