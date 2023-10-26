// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jds_new/constants/assets.dart';
import 'package:jds_new/helper/navigator_help.dart';
import 'package:jds_new/screens/home/ui/home_screen.dart';
import 'package:jds_new/screens/orders/ui/orders_screen.dart';
import 'package:jds_new/screens/profile/ui/profile_screen.dart';
import 'package:jds_new/screens/search/ui/search_screen.dart';
import 'package:jds_new/screens/shopping_cart/ui/shopping_cart_screen.dart';
import 'package:jds_new/widget/keep_alive_page.dart';

import '../../../constants/app_color.dart';

final currentIndexNotifier = StateProvider<int>((ref) {
  return 0;
});

final pageControllerProvider = Provider.autoDispose<PageController>((ref) {
  final controller = PageController();
  controller.addListener(() {
    ref.read(currentIndexNotifier.notifier).state =
        controller.page?.toInt() ?? 0;
  });
  return controller;
});

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _screenList = [
    const KeepAlivePage(child: HomeScreen()),
    const KeepAlivePage(child: SearchScreen()),
    KeepAlivePage(child: Container()),
    const KeepAlivePage(child: OrdersScreen()),
    const KeepAlivePage(child: ProfileScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: ((context, ref, child) => PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: ref.watch(pageControllerProvider),
              restorationId: "dashboard_pageview",
              itemBuilder: ((context, index) => _screenList[index]),
              itemCount: _screenList.length,
            )),
      ),
      bottomNavigationBar: Consumer(
        builder: ((context, ref, child) {
          final currentPage = ref.watch(currentIndexNotifier);
          return BottomAppBar(
            elevation: 5,
            notchMargin: 5,
            color: Theme.of(context).cardColor,
            clipBehavior: Clip.antiAlias,
            shape: const CircularNotchedRectangle(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(
                  child: BottomNavItem(
                      iconData: homeIcon,
                      isSelected: currentPage == 0,
                      onTap: () => setIndex(ref, index: 0)),
                ),
                Expanded(
                  child: BottomNavItem(
                      iconData: searchcon,
                      isSelected: currentPage == 1,
                      onTap: () => setIndex(ref, index: 1)),
                ),
                const Expanded(child: SizedBox()),
                Expanded(
                  child: BottomNavItem(
                      iconData: noteIcon,
                      isSelected: currentPage == 3,
                      onTap: () => setIndex(ref, index: 3)),
                ),
                Expanded(
                  child: BottomNavItem(
                      iconData: personIcon,
                      isSelected: currentPage == 4,
                      onTap: () => setIndex(ref, index: 4)),
                ),
              ]),
            ),
          );
          // return BottomNavigationBar(
          //   backgroundColor: white,
          //   elevation: 8.0,

          //   currentIndex: currentPage,
          //   showSelectedLabels: true,
          //   showUnselectedLabels: true,
          //   selectedItemColor: colorPrimary,
          //   type: BottomNavigationBarType.fixed,
          //   selectedLabelStyle: Theme.of(context)
          //       .textTheme
          //       .titleSmall
          //       ?.copyWith(color: colorPrimary, fontSize: 14),
          //   unselectedLabelStyle: Theme.of(context)
          //       .textTheme
          //       .bodyMedium
          //       ?.copyWith(color: commonTextColor, fontSize: 12),

          //   items: [
          //     buildBottomNavItem(
          //         label: "Home", icon: homeIcon, isSelected: currentPage == 0),
          //     buildBottomNavItem(
          //         label: "Search",
          //         icon: searchcon,
          //         isSelected: currentPage == 1),
          //     buildBottomNavItem(
          //         label: "Cart", icon: cartIcon, isSelected: currentPage == 2),
          //     buildBottomNavItem(
          //         label: "Note", icon: noteIcon, isSelected: currentPage == 3),
          //     buildBottomNavItem(
          //         label: "Profile",
          //         icon: personIcon,
          //         isSelected: currentPage == 4),
          //   ],
          //   onTap: (index) {
          //     WidgetsBinding.instance.addPostFrameCallback((_) {
          //       if (ref.read(pageControllerProvider).hasClients) {
          //         ref.read(pageControllerProvider).jumpToPage(index);
          //       }
          //     });
          //   },
          // );
        }),
      ),
      floatingActionButton: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      //  visible: true,
        child: FloatingActionButton(
          isExtended: false,
          elevation: 5,
          backgroundColor: white,
          onPressed: () {
            navigatorPush(context, const ShoppingCartScreen());
          },
          child: const BottomNavItem(
            //    isSelected: true,
            iconData: cartIcon,
            //  isSelected: currentPage == 4,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  setIndex(WidgetRef ref, {required int index}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(pageControllerProvider).hasClients) {
        ref.read(pageControllerProvider).jumpToPage(index);
      }
    });
  }
}

//   buildBottomNavItem(
//       {required String label, required String icon, required bool isSelected}) {
//     return BottomNavigationBarItem(
//       tooltip: label,
//       icon: SvgPicture.asset(
//         icon,
//         color: isSelected ? colorPrimary : Colors.grey.shade600,
//         width: isSelected ? 24 : 20,
//         height: isSelected ? 24 : 20,
//       ),
//       label: "",
//     );
//   }
// }

class BottomNavItem extends StatelessWidget {
  final String iconData;
  final Function? onTap;
  final bool isSelected;
  const BottomNavItem(
      {Key? key, required this.iconData, this.onTap, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        iconData,
        color: isSelected ? colorPrimary : Colors.grey,
        width: isSelected ? 24 : 20,
        height: isSelected ? 24 : 20,
      ),
      onPressed: onTap as void Function()?,
    );
  }
}
