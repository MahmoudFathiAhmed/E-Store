import '../../app/constants.dart';
import '../../data/response/responses.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.authBaseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST("/auth/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email,
      @Field("password") String password
      );

  @POST("/auth/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(
      @Field("email") String email
      );

  @POST("/auth/register")
  Future<AuthenticationResponse> register(
      @Field("user_name") String userName,
      @Field("country_mobile_code") String countryMobileCode,
      @Field("mobile_number") String mobileNumber,
      @Field("email") String email,
      @Field("password") String password,
      @Field("profile_picture") String profilePicture
      );


// @GET("/home")
// Future<HomeResponse> getHome();
//
// @GET("/storeDetails/1")
// Future<StoreDetailsResponse> getStoreDetails();
}


@RestApi(baseUrl: Constants.baseUrl)
abstract class StoreAppServiceClient{
  factory StoreAppServiceClient(Dio dio, {String baseUrl})=_StoreAppServiceClient;

@GET("/products")
Future<ProductsResponse> getProducts();

@GET("/products/category/electronics")
Future<ProductsResponse> getElectronics();

@GET("/products/category/jewelery")
Future<ProductsResponse> getJewelery();

@GET("/products/category/men's%20clothing")
Future<ProductsResponse> getMenClothing();

@GET("/products/category/women's%20clothing")
Future<ProductsResponse> getWomenClothing();

@POST("/products")
Future<ProductsResponse> addProduct(
    @Field("title") String title,
    @Field("price") double price,
    @Field("description") String description,
    @Field("image") String image,
    @Field("category") String category,
    );

@PUT("/products/{id}")
Future<ProductsResponse> updateProduct(
    @Field("title") String title,
    @Field("price") double price,
    @Field("description") String description,
    @Field("image") String image,
    @Field("category") String category,
    );

}