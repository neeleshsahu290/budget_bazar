import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/app_color.dart';
import 'package:jds_new/provider/home_screen_notifier.dart';
import 'package:jds_new/screens/home/widgets/categories.dart';
import 'package:jds_new/screens/home/widgets/drawer.dart';
import 'package:jds_new/screens/home/widgets/popular_products.dart';
import 'package:jds_new/screens/home/widgets/slider.dart';
import 'package:jds_new/widget/custom_app_bar.dart';
import 'package:jds_new/widget/my_text.dart';
import 'package:jds_new/widget/primary_button.dart';

final homeScreenProvider =
    ChangeNotifierProvider.autoDispose<HomeScreenNotifier>((ref) {
  return HomeScreenNotifier();
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    getHomeData();
    super.initState();
  }

  getHomeData({bool isRefreshing = false}) {
    ref.read(homeScreenProvider).getHomeData(isRefreshing: isRefreshing);
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerScreen(),
      appBar: CustomAppBar(
          title: "dashboard",
          leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu))),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                ImageSlider(),
                CategoriesHome(),
                PopularProducts(),
                SizedBox(
                  height: 30.0,
                )
              ],
            )),
          ),
          ref.watch(homeScreenProvider).homePageState == DataState.error
              ? AnimatedContainer(
                  color: Colors.redAccent,
                  height: 50.0,
                  duration: const Duration(milliseconds: 800),
                  child: Row(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: MyText(
                          text: "No Internet Found ",
                          color: white,
                        ),
                      ),
                    ),
                    PrimaryButton(
                      color: white,
                      width: 80.0,
                      btnText: "Retry",
                      textColor: commonTextColor,
                      onPressed: () {
                        getHomeData(isRefreshing: true);
                        //   ref.read(homeScreenProvider).retry();
                      },
                    )
                  ]),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
