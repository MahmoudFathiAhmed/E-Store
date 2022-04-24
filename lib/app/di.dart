import '../../app/app_prefs.dart';
import '../../data/data_source/remote_data_source.dart';
import '../../data/network/app_api.dart';
import '../../data/network/dio_factory.dart';
import '../../data/network/network_info.dart';
import '../../data/repository/repository_impl.dart';
import '../../domain/repository/repository.dart';
import '../../domain/usecase/forgot_password_usecase.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../presentation/forgot_password/viewmodel/forgot_password_viewmodel.dart';
import '../../presentation/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/local_data_source.dart';
import '../domain/usecase/home_usecase.dart';
import '../domain/usecase/register_usecase.dart';
import '../domain/usecase/store_details_usecase.dart';
import '../domain/usecase/store_use_cases/electronics_usecase.dart';
import '../domain/usecase/store_use_cases/jewelery_usecase.dart';
import '../domain/usecase/store_use_cases/men_clothing_usecase.dart';
import '../domain/usecase/store_use_cases/products_use_case.dart';
import '../domain/usecase/store_use_cases/women_clothing_usecase.dart';
import '../presentation/electronics/viewmodel/electronics_viewmodel.dart';
import '../presentation/jewelery/viewmodel/jewelery_viewmodel.dart';
import '../presentation/main/pages/home/viewmodel/home_viewmodel.dart';
import '../presentation/men_clothing/viewmodel/men_clothing_viewmodel.dart';
import '../presentation/products/viewmodel/products_viewmodel.dart';
import '../presentation/regiser/viewmodel/register_viewmodel.dart';
import '../presentation/store_details/viewmodel/store_details_viewmodel.dart';
import '../presentation/women_clothing/viewmodel/women_clothing_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async{
  //app module, it's a module where we put all generic dependencies

  //shared prefs instances
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //app prefs instance
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  //network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()
          ));
  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory> ().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //Store app service client
  instance.registerLazySingleton<StoreAppServiceClient>(() => StoreAppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance(),instance()));

  //local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  //repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance(),instance()));
}



initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initForgotPasswordModule(){
  if(!GetIt.I.isRegistered<ForgotPasswordUseCase>()){
    instance.registerFactory<ForgotPasswordUseCase>(() => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel(instance()));
    
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerFactory<RegisterUseCase>(() =>
        RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(() =>
        RegisterViewModel(instance()));
    instance.registerFactory<ImagePicker>(() =>
        ImagePicker());
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() =>
        HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() =>
        HomeViewModel(instance()));
  }
}

initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
    instance.registerFactory<StoreDetailsUseCase>(() =>
        StoreDetailsUseCase(instance()));
    instance.registerFactory<StoreDetailsViewModel>(() =>
        StoreDetailsViewModel(instance()));
  }
}

initProductsModule() {
  if (!GetIt.I.isRegistered<ProductsUseCase>()) {
    instance.registerFactory<ProductsUseCase>(() =>
        ProductsUseCase(instance()));
    instance.registerFactory<ProductsViewModel>(() =>
        ProductsViewModel());
        // ProductsViewModel(instance()));
  }
}

initElectronicsModule() {
  if (!GetIt.I.isRegistered<ElectronicsUseCase>()) {
    instance.registerFactory<ElectronicsUseCase>(() =>
        ElectronicsUseCase(instance()));
    instance.registerFactory<ElectronicsViewModel>(() =>
        ElectronicsViewModel());
        // ElectronicsViewModel(instance()));
  }
}

initJeweleryModule() {
  if (!GetIt.I.isRegistered<JeweleryUseCase>()) {
    instance.registerFactory<JeweleryUseCase>(() =>
        JeweleryUseCase(instance()));
    instance.registerFactory<JeweleryViewModel>(() =>
        JeweleryViewModel());
        // JeweleryViewModel(instance()));
  }
}

initMenClothingModule() {
  if (!GetIt.I.isRegistered<MenClothingUseCase>()) {
    instance.registerFactory<MenClothingUseCase>(() =>
        MenClothingUseCase(instance()));
    instance.registerFactory<MenClothingViewModel>(() =>
        MenClothingViewModel());
        // MenClothingViewModel(instance()));
  }
}

initWomenClothingModule() {
  if (!GetIt.I.isRegistered<WomenClothingUseCase>()) {
    instance.registerFactory<WomenClothingUseCase>(() =>
        WomenClothingUseCase(instance()));
    instance.registerFactory<WomenClothingViewModel>(() =>
        WomenClothingViewModel());
        // WomenClothingViewModel(instance()));
  }
}