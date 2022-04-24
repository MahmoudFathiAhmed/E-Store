// import 'package:estore/app/extensions.dart';

import '../../data/data_source/remote_data_source.dart';
import '../../data/mapper/mapper.dart';
import '../../data/network/error_handler.dart';
import '../../data/network/failure.dart';
import '../../data/network/network_info.dart';
import '../../data/network/requests.dart';
import '../../domain/model/models.dart';
import '../../domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../data_source/local_data_source.dart';

class RepositoryImpl implements Repository{
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo, this._localDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{

    if(await _networkInfo.isConnected){
      //it's connected to the internet, it's safe to call API
      try{
        final response  = await _remoteDataSource.login(loginRequest);
        if (response.status==ApiInternalStatus.SUCCESS){
          //success
          //return either right
          //return data
          return Right(response.toDomain());
        }else{
          //failure -- business error
          //return either left
          return Left(Failure(ApiInternalStatus.FAILURE, response.message??ResponseMessage.DEFAULT));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      //return internet connection error
      //return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async{
    if(await _networkInfo.isConnected){
      //it's connected to the internet, it's safe to call API
      try{
        final response  = await _remoteDataSource.forgotPassword(email);
        if (response.status==ApiInternalStatus.SUCCESS){
          //success
          //return either right
          //return data
          return Right(response.toDomain());
        }else{
          //failure -- business error
          //return either left
          return Left(Failure(response.status??ResponseCode.DEFAULT,
            response.message??ResponseMessage.DEFAULT
          ));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      //return internet connection error
      //return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest) async{
    if(await _networkInfo.isConnected){
      //it's connected to the internet, it's safe to call API
      try{
        final response  = await _remoteDataSource.register(registerRequest);
        if (response.status==ApiInternalStatus.SUCCESS){
          //success
          //return either right
          //return data
          return Right(response.toDomain());
        }else{
          //failure -- business error
          //return either left
          return Left(Failure(response.status??ResponseCode.DEFAULT,
              response.message??ResponseMessage.DEFAULT
          ));
        }
      }catch(error){
        return Left(ErrorHandler.handle(error).failure);
      }
    }else{
      //return internet connection error
      //return either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  //store
  @override
  Future<Either<Failure, Products>> getElectronics() async{
    try {
      //get response from cache
      final response = await _localDataSource.getElectronics();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache is not existing or cache is not valid
      //it's the time to get from the API side
      if (await _networkInfo.isConnected) {
        //it's connected to the internet, it's safe to call API
        try {
          final response = await _remoteDataSource.getElectronics();
          if (response.id!.isFinite) {
            //success
            //return either right
            //return data
            //save home response to cache(local data source)
            _localDataSource.saveElectronicsToCache(response);
            return Right(response.toDomain());
          } else {
            //failure -- business error
            //return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                response.title ?? ResponseMessage.DEFAULT
            ));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return internet connection error
        //return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Products>> getJewelery() async{
    try {
      //get response from cache
      final response = await _localDataSource.getJewelery();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache is not existing or cache is not valid
      //it's the time to get from the API side
      if (await _networkInfo.isConnected) {
        //it's connected to the internet, it's safe to call API
        try {
          final response = await _remoteDataSource.getJewelery();
          if (response.id!.isFinite) {
            //success
            //return either right
            //return data
            //save home response to cache(local data source)
            _localDataSource.saveJeweleryToCache(response);
            return Right(response.toDomain());
          } else {
            //failure -- business error
            //return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                response.title ?? ResponseMessage.DEFAULT
            ));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return internet connection error
        //return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Products>> getMenClothing() async{
    try {
      //get response from cache
      final response = await _localDataSource.getMenClothing();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache is not existing or cache is not valid
      //it's the time to get from the API side
      if (await _networkInfo.isConnected) {
        //it's connected to the internet, it's safe to call API
        try {
          final response = await _remoteDataSource.getMenClothing();
          if (response.id!.isFinite) {
            //success
            //return either right
            //return data
            //save home response to cache(local data source)
            _localDataSource.saveMenClothingToCache(response);
            return Right(response.toDomain());
          } else {
            //failure -- business error
            //return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                response.title ?? ResponseMessage.DEFAULT
            ));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return internet connection error
        //return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Products>> getProducts() async{
    try {
      //get response from cache
      final response = await _localDataSource.getProducts();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache is not existing or cache is not valid
      //it's the time to get from the API side
      if (await _networkInfo.isConnected) {
        //it's connected to the internet, it's safe to call API
        try {
          final response = await _remoteDataSource.getProducts();
          if (response.id!.isFinite) {
            //success
            //return either right
            //return data
            //save home response to cache(local data source)
            _localDataSource.saveProductsToCache(response);
            return Right(response.toDomain());
          } else {
            //failure -- business error
            //return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                response.title ?? ResponseMessage.DEFAULT
            ));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return internet connection error
        //return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Products>> getWomenClothing() async{
    try {
      //get response from cache
      final response = await _localDataSource.getWomenClothing();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache is not existing or cache is not valid
      //it's the time to get from the API side
      if (await _networkInfo.isConnected) {
        //it's connected to the internet, it's safe to call API
        try {
          final response = await _remoteDataSource.getWomenClothing();
          if (response.id!.isFinite) {
            //success
            //return either right
            //return data
            //save home response to cache(local data source)
            _localDataSource.saveWomenClothingToCache(response);
            return Right(response.toDomain());
          } else {
            //failure -- business error
            //return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                response.title ?? ResponseMessage.DEFAULT
            ));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return internet connection error
        //return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
//end store

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async {
    try {
      //get response from cache
      final response = await _localDataSource.getHomeData();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache is not existing or cache is not valid
      //it's the time to get from the API side
      if (await _networkInfo.isConnected) {
        //it's connected to the internet, it's safe to call API
        try {
          final response = await _remoteDataSource.getHomeData();
          if (response.status == ApiInternalStatus.SUCCESS) {
            //success
            //return either right
            //return data
            //save home response to cache(local data source)
            _localDataSource.saveHomeToCache(response);
            return Right(response.toDomain());
          } else {
            //failure -- business error
            //return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DEFAULT
            ));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return internet connection error
        //return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() async{
    try {
      //get data from cache
      final response = await _localDataSource.getStoreDetails();
      return Right(response.toDomain());
    } catch (cacheError) {
      //cache is not existing or cache is not valid
      //it's the time to get from the API side
      if (await _networkInfo.isConnected) {
        //it's connected to the internet, it's safe to call API
        try {
          final response = await _remoteDataSource.getStoreDetails();
          if (response.status == ApiInternalStatus.SUCCESS) {
            //success
            //return either right
            //return data
            //save home response to cache(local data source)
            _localDataSource.saveStoreDetailsToCache(response);
            return Right(response.toDomain());
          } else {
            //failure -- business error
            //return either left
            return Left(Failure(ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DEFAULT
            ));
          }
        } catch (error) {
          return Left(ErrorHandler
              .handle(error)
              .failure);
        }
      } else {
        //return internet connection error
        //return either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
}
