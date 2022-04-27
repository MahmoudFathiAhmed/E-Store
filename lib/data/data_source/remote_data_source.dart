import '../../data/network/app_api.dart';
import '../../data/network/requests.dart';
import '../../data/response/responses.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  //store
  Future<ProductsResponse> getProducts();
  Future<ProductsResponse> getJewelery();
  Future<ProductsResponse> getMenClothing();
  Future<ProductsResponse> getWomenClothing();
  Future<ProductsResponse> getElectronics();

  //end of store
  // Future<HomeResponse> getHomeData();
  // Future<StoreDetailsResponse> getStoreDetails();
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final AppServiceClient _appServiceClient;
  final StoreAppServiceClient _storeAppServiceClient;

  RemoteDataSourceImpl(this._appServiceClient, this._storeAppServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

  @override
  Future<AuthenticationResponse> register(RegisterRequest registerRequest) async{
    return await _appServiceClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.mobileNumber,
        registerRequest.email,
        registerRequest.password,
        ""
        // registerRequest.profilePicture
    );
  }

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async{
    return await _appServiceClient.forgotPassword(email);
  }

  // @override
  // Future<HomeResponse> getHomeData() async{
  //   return await _appServiceClient.getHome();
  // }
  //
  // @override
  // Future<StoreDetailsResponse> getStoreDetails() async{
  //   return await _appServiceClient.getStoreDetails();
  // }
//store
  @override
  Future<ProductsResponse> getElectronics() async{
    return await _storeAppServiceClient.getElectronics();
  }

  @override
  Future<ProductsResponse> getJewelery() async{
    return await _storeAppServiceClient.getJewelery();
  }

  @override
  Future<ProductsResponse> getMenClothing() async{
    return await _storeAppServiceClient.getMenClothing();
  }

  @override
  Future<ProductsResponse> getProducts() async{
    return await _storeAppServiceClient.getProducts();
  }

  @override
  Future<ProductsResponse> getWomenClothing() async{
    return await _storeAppServiceClient.getWomenClothing();
  }
//end of store
}