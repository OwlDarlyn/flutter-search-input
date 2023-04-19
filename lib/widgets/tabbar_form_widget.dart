import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class TabBarForm extends StatefulWidget {
  final TabController tabController;
  const TabBarForm({super.key, required this.tabController});

  @override
  State<TabBarForm> createState() => _TabBarFormState();
}

class _TabBarFormState extends State<TabBarForm> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TabBar(
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            labelColor: AppColors.accentColor1,
            unselectedLabelColor: AppColors.accentColor3,
            isScrollable: true,
            indicator:
                CircleTabIdicator(color: AppColors.helpColor2, radius: 4),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: widget.tabController,
            tabs: const [
              Tab(text: 'Elixirs'),
              Tab(text: 'Wizards'),
              Tab(text: 'Spells'),
            ],
          ),
        ],
      ),
    );
  }
}

class CircleTabIdicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIdicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffcet = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffcet, radius, _paint);
  }
}
