import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/screen/main/tab/home/f_home.dart';
import 'package:flutter/material.dart';

import 'all/f_all.dart';
import 'benefit/f_benefit.dart';
import 'pay/f_pay.dart';
import 'stock/f_pay.dart';

enum TabItem {
  home(Icons.home, '홈', HomeFragment()),
  benefit(Icons.star, '혜택', BenefitFragment()),
  pay(Icons.payment, '토스페이', PayFragment()),
  stock(Icons.candlestick_chart, '주식', StockFragment()),
  all(Icons.menu, '전체', AllFragment());

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage, {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;
}

extension TabItemExtension on TabItem {
  BottomNavigationBarItem toNavigationBarItem(BuildContext context, {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color:
              isActivated ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: tabName);
  }
}
