import 'package:estore/presentation/resources/assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../presentation/main/pages/home/view/home_page.dart';
import '../../../presentation/main/pages/notification/notifications_page.dart';
import '../../../presentation/main/pages/search/search_page.dart';
import '../../../presentation/main/pages/settings/settings_page.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  //
  // List<Widget> pages=const [
  //   HomePage(),
  //   SearchPage(),
  //   NotificationsPage(),
  //   SettingsPage()
  // ];
  // List<String> titles=[
  //   AppStrings.home.tr(),
  //   AppStrings.search.tr(),
  //   AppStrings.notifications.tr(),
  //   AppStrings.settings.tr()
  // ];
  // var _title = AppStrings.home.tr();
  // var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.splashIcon),
                  ),
                ),
                child: SvgPicture.asset(ImageAssets.splashIcon,),
              ),
              ListTile(
                title:  Center(child: Text(AppStrings.home.tr(), style: Theme.of(context).textTheme.displayMedium,)),
                onTap: () {
                },
              ),
              ListTile(
                title:  Center(child: Text(AppStrings.profile.tr(),style: Theme.of(context).textTheme.displayMedium,)),
                onTap: () {},
              ),
              ListTile(
                title:  Center(child: Text(AppStrings.myCart.tr(), style: Theme.of(context).textTheme.displayMedium,)),
                onTap: () {},
              ),
              ListTile(
                title:  Center(child: Text(AppStrings.favourite.tr(),style: Theme.of(context).textTheme.displayMedium,)),
                onTap: () {},
              ),
              ListTile(
                title:  Center(child: Text(AppStrings.orders.tr(), style: Theme.of(context).textTheme.displayMedium,)),
                onTap: () {},
              ),
              ListTile(
                title:  Center(child: Text(AppStrings.language.tr(),style: Theme.of(context).textTheme.displayMedium,)),
                onTap: () {},
              ),
              ListTile(
                title:  Center(child: Text(AppStrings.settings.tr(),style: Theme.of(context).textTheme.displayMedium,)),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(ImageAssets.menuBar),
          onPressed: () => scaffoldKey.currentState?.openDrawer(),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset(ImageAssets.filter,),),
        ],

        // title: Text(_title, style: Theme.of(context).textTheme.titleSmall,),
      ),
      body: HomePage(),
    );
  }
  // onTab(int index){
  //   setState(() {
  //     _currentIndex = index;
  //     _title = titles[index];
  //   });
  // }
}


// pages[_currentIndex],
// bottomNavigationBar: Container(
// decoration: BoxDecoration(
// boxShadow: [
// BoxShadow(
// color: ColorManager.lightGrey,
// spreadRadius: AppSize.s1,
// )
// ],
// ),
// child: BottomNavigationBar(
// selectedItemColor: ColorManager.primary,
// unselectedItemColor: ColorManager.grey,
// currentIndex: _currentIndex,
// onTap: onTab,
// items: [
// BottomNavigationBarItem(icon: const Icon(Icons.home_outlined), label: AppStrings.home.tr()),
// BottomNavigationBarItem(icon: const Icon(Icons.search), label: AppStrings.search.tr()),
// BottomNavigationBarItem(icon: const Icon(Icons.notifications), label: AppStrings.notifications.tr()),
// BottomNavigationBarItem(icon: const Icon(Icons.settings), label: AppStrings.settings.tr()),
// ],
// ),
// ),
