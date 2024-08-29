import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';

class CustomTabBar extends StatelessWidget {
  final List<TabItem> tabs;
  final int tabLength;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<int> onTabIndexChange;
  final bool isScrollable;
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.tabLength,
    required this.onTabIndexChange,
    this.isScrollable = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context).platformBrightness;

    return DefaultTabController(
      length: tabLength,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: theme == Brightness.light
                ? Colorz.formBorder
                : Colorz.violet.withOpacity(0.4),
            border: Border.all(
              color: Colorz.main,
              width: 0.2,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: TabBar(
            onTap: onTabIndexChange,
            labelPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            indicatorPadding: EdgeInsets.zero,
            indicatorWeight: 0,
            isScrollable: isScrollable,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: theme == Brightness.light
                  ? Colorz.primaryBackground
                  : Colorz.main.withOpacity(0.6),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colorz.tabButtonShadow,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            tabs: [
              ...tabs.map(
                (e) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    e.icon != null
                        ? Icon(
                            e.icon,
                            color: Colors.red,
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        e.title,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme == Brightness.light
                              ? Colorz.main
                              : Colorz.violetGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabItem {
  final String title;
  final IconData? icon;
  // final Widget? widget;
  const TabItem({required this.title, this.icon});
}
