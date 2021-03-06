import 'dart:ffi';

import '../../../../../presentation/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../domain/model/models.dart';
import '../../../../../domain/usecase/store_use_cases/products_use_case.dart';
import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

class HomeViewModel extends BaseViewModel with HomeViewModelInput, HomeViewModelOutput{
final _productsStreamController = BehaviorSubject<Products>();
final ProductsUseCase productsUseCase;

HomeViewModel(this.productsUseCase);
//inputs

    _getHomeData()async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    (await productsUseCase.execute(Void))
        .fold((failure) => {
      //left -> failure
      inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.message))
    }, (products) {
      //right -> data(success)
      //content
      inputState.add(ContentState());
      inputHomeData.add(products);
    });
  }


  @override
  void start() {
    _getHomeData();
  }

  @override
  void dispose() {
    _productsStreamController.close();
    super.dispose();
  }


  @override
  Sink get inputHomeData => _productsStreamController.sink;

  @override
  Stream<Products> get outputHomeData => _productsStreamController.stream.map((data) => data);

}
abstract class HomeViewModelInput{
  Sink get inputHomeData;
}
abstract class HomeViewModelOutput{
  Stream <Products> get outputHomeData;
}


// import 'dart:async';
// // import 'dart:ffi';
//
// import '../../../../../domain/model/models.dart';
// // import '../../../../../domain/usecase/home_usecase.dart';
// import '../../../../../presentation/base/base_viewmodel.dart';
// import 'package:rxdart/rxdart.dart';
//
// // import '../../../../common/state_renderer/state_renderer.dart';
// // import '../../../../common/state_renderer/state_renderer_impl.dart';
//
// class HomeViewModel extends BaseViewModel with HomeViewModelInput, HomeViewModelOutput{
//   // final StreamController _bannersStreamController = BehaviorSubject<List<BannerAd>>();
//   // final StreamController _servicesStreamController = BehaviorSubject<List<Service>>();
//   // final StreamController _storesStreamController = BehaviorSubject<List<Store>>();
//   // final StreamController _dataStreamController = BehaviorSubject<HomeViewObject>();
//
//   // final HomeUseCase _homeUseCase;
//
//
//   HomeViewModel();
//   // HomeViewModel(this._homeUseCase);
// //inputs
// //   _getHomeData()async{
// //     inputState.add(LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
// //     (await _homeUseCase.execute(Void))
// //         .fold((failure) => {
// //       //left -> failure
// //       inputState.add(ErrorState(StateRendererType.fullScreenErrorState, failure.message))
// //     }, (homeObject) {
// //       //right -> data(success)
// //       //content
// //       inputState.add(ContentState());
// //       inputHomeData.add(HomeViewObject(
// //           homeObject.data.banners,
// //           homeObject.data.services,
// //           homeObject.data.stores
// //       ));
// //       //navigate to main screen
// //     });
// //   }
//
//   @override
//   void start() {
//     // _getHomeData();
//   }
//
//   @override
//   void dispose() {
//     // _dataStreamController.close();
//     super.dispose();
//   }
//
//   // @override
//   // Sink get inputHomeData => _dataStreamController.sink;
//   // @override
//   // Stream<HomeViewObject> get outputHomeData => _dataStreamController.stream.map((data) => data);
// }
//
// abstract class HomeViewModelInput{
//   // Sink get inputHomeData;
// }
//
// abstract class HomeViewModelOutput{
//   // Stream <HomeViewObject> get outputHomeData;
// }
//
// // class HomeViewObject{
// //   List<BannerAd> banners;
// //   List<Service> services;
// //   List<Store> stores;
// //
// //   HomeViewObject(this.banners, this.services, this.stores);
// // }