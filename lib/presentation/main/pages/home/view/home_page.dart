// import '../../../../../presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:estore/domain/model/models.dart';
import 'package:estore/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:estore/presentation/resources/assets_manager.dart';
import 'package:estore/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../presentation/main/pages/home/viewmodel/home_viewmodel.dart';
// import '../../../../../presentation/resources/color_manager.dart';
// import '../../../../../presentation/resources/routes_manager.dart';
// import '../../../../../presentation/resources/values_manager.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../app/di.dart';
// import '../../../../../domain/model/models.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();
  final TextEditingController _searchEditingController = TextEditingController();
  final _searchFormKey =GlobalKey();

  _bind(){
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _getContentWidget(),
    );

    //   Center(
    //   child: SingleChildScrollView(
    //     child: StreamBuilder<FlowState>(
    //         stream: _viewModel.outputState,
    //         builder: (context, snapshot){
    //           return snapshot.data?.getScreenWidget(context, _getContentWidget(), (){
    //             _viewModel.start();
    //           })??
    //               _getContentWidget();
    //         },
    //     ),
    //   ),
    // );
  }

  // Widget _getContentWidget(){
  //   return StreamBuilder<HomeViewObject>(
  //     stream: _viewModel.outputHomeData,
  //     builder: (context, snapshot){
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           _getBannerWidget(snapshot.data?.banners),
  //           _getSection(AppStrings.services.tr()),
  //           _getServicesWidget(snapshot.data?.services),
  //           _getSection(AppStrings.stores.tr()),
  //           _getStoresWidget(snapshot.data?.stores),
  //         ],
  //       );
  //     },
  //   );
  // }


  // Widget _getBannerWidget(List<BannerAd>? banners){
  //   if(banners != null){
  //     return CarouselSlider(items: banners.map((banner) => SizedBox(
  //       width: double.infinity,
  //       child: Card(
  //         elevation: AppSize.s1_5,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(AppSize.s12),
  //           side: BorderSide(
  //             color: ColorManager.primary,
  //             width: AppSize.s1,
  //           ),
  //         ),
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(AppSize.s12),
  //           child: Image.network(banner.image, fit: BoxFit.cover,),
  //         ),
  //       ),
  //     )).toList(),
  //         options: CarouselOptions(
  //           height: AppSize.s190,
  //           autoPlay: true,
  //           enableInfiniteScroll: true,
  //           enlargeCenterPage: true,
  //         ),
  //     );
  //   }else{
  //     return Container();
  //   }
  // }
  //
  // Widget _getSection(String title){
  //   return Padding(
  //       padding: const EdgeInsets.only(
  //         top: AppPadding.p12,
  //         left: AppPadding.p12,
  //         right: AppPadding.p12,
  //         bottom: AppPadding.p2,
  //       ),
  //     child: Text(title, style: Theme.of(context).textTheme.labelSmall,),
  //   );
  // }
  //
  // Widget _getServicesWidget(List<Service>? services){
  //   if(services != null){
  //     return Padding(
  //       padding: const EdgeInsets.only(
  //         left: AppPadding.p12,
  //         right: AppPadding.p12,
  //       ),
  //       child: Container(
  //         height: AppSize.s160,
  //         margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
  //         child: ListView(
  //           scrollDirection: Axis.horizontal,
  //           children: services.map((service) => Card(
  //             elevation: AppSize.s4,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(AppSize.s12),
  //               side: BorderSide(
  //                 color: ColorManager.white,
  //                 width: AppSize.s1,
  //               ),
  //             ),
  //             child: Column(
  //               children: [
  //                 ClipRRect(
  //                   borderRadius: BorderRadius.circular(AppSize.s12),
  //                   child: Image.network(
  //                     service.image,
  //                     fit: BoxFit.cover,
  //                     width: AppSize.s120,
  //                     height: AppSize.s120,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: AppPadding.p8),
  //                   child: Align(
  //                     alignment: Alignment.center,
  //                     child: Text(
  //                       service.title,
  //                       style: Theme.of(context).textTheme.bodyMedium,
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           ).toList(),
  //         ),
  //       ),
  //     );
  //   }else{
  //     return Container();
  //   }
  //
  // }
  //
  // Widget _getStoresWidget(List<Store>? stores){
  //   if(stores != null){
  //     return Padding(
  //       padding: const EdgeInsets.only(
  //         left: AppPadding.p12,
  //         right: AppPadding.p12,
  //         top: AppPadding.p12,
  //       ),
  //       child: Flex(
  //         direction: Axis.vertical,
  //         children: [
  //           GridView.count(
  //             crossAxisCount: AppCount.c2,
  //             crossAxisSpacing: AppSize.s8,
  //             mainAxisSpacing: AppSize.s8,
  //             physics: const ScrollPhysics(),
  //             shrinkWrap: true,
  //             children:
  //               List.generate(stores.length, (index) {
  //                 return InkWell(
  //                   onTap: (){
  //                     //navigate to store details screen
  //                     Navigator.of(context).pushNamed(Routes.storeDetailsRoute);
  //                   },
  //                   child: Card(
  //                     elevation: AppSize.s4,
  //                     child: Image.network(
  //                       stores[index].image,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 );
  //               })
  //             ,
  //           )
  //         ],
  //       ),
  //     );
  //   }else{
  //     return Container();
  //   }
  // }

  Widget _getContentWidget(){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getSearchFormField(),
            const SizedBox(height: AppSize.s37,),
            _getSectionHeader(header: AppStrings.categories.tr()),
            const SizedBox(height: AppSize.s14,),
            _getStoreCategories(),
            const SizedBox(height: AppSize.s37,),
            _getSectionHeader(header: AppStrings.featured.tr()),
          ],
        );
  }

  Widget _getSearchFormField(){
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p16, right: AppPadding.p16),
      child: TextField(
        key: _searchFormKey,
        controller: _searchEditingController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: AppStrings.searchYourProduct.tr(),
          prefixIcon: SvgPicture.asset(
              ImageAssets.search,
              fit: BoxFit.scaleDown),
        ),
      ),
    );
  }

  Widget _getSectionHeader({required String header}){
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          TextButton(
            onPressed: (){},
            child: Text(AppStrings.seeAll.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),),
        ],),
    );
  }

  Widget _getCategoryCard({
    required String category,
    required String image,
    required Color color,
    required VoidCallback onTap }){
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p15),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s5),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: AppSize.s114,
                  height: AppSize.s65,
                  color: color.withOpacity(AppSize.s0_75),
                  colorBlendMode: BlendMode.srcOver,
                ),
                Text(category,style: Theme.of(context).textTheme.bodyLarge,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getStoreCategories(){
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p22),
      child: Container(
        height: AppSize.s65,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _getCategoryCard(
              image: ImageAssets.women,
              color: ColorManager.lightPrimary,
              category: AppStrings.women.tr(),
              onTap: (){}
            ),
            _getCategoryCard(
              image: ImageAssets.men,
              color: ColorManager.rose,
              category: AppStrings.men.tr(),
              onTap: (){}
            ),
            _getCategoryCard(
              image: ImageAssets.jewelry,
              color: ColorManager.green,
              category: AppStrings.jewelry.tr(),
              onTap: (){}
            ),
            _getCategoryCard(
              image: ImageAssets.electronics,
              color: ColorManager.purple,
              category: AppStrings.electronics.tr(),
              onTap: (){}
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
