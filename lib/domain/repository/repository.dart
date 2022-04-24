import '../../data/network/requests.dart';
import '../../domain/model/models.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';


abstract class Repository{
  Future <Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future <Either<Failure, String>> forgotPassword(String email);
  Future <Either<Failure, Authentication>> register(RegisterRequest registerRequest);
  Future <Either<Failure, Products>> getProducts();
  Future <Either<Failure, Products>> getElectronics();
  Future <Either<Failure, Products>> getJewelery();
  Future <Either<Failure, Products>> getMenClothing();
  Future <Either<Failure, Products>> getWomenClothing();

  Future <Either<Failure, HomeObject>> getHomeData();
  Future <Either<Failure, StoreDetails>> getStoreDetails();
}