import '../../data/network/error_handler.dart';

import '../response/responses.dart';

const CACHE_HOME_KEY = "CACHE_HOME_KEY";
const CACHE_HOME_INTERVAL = 60 * 1000; // 1 minute cache
const CACHE_STORE_DETAILS_KEY = "CACHE_STORE_DETAILS_KEY";
const CACHE_STORE_DETAILS_INTERVAL = 60 * 1000; // 1 minute cache

//store
const CACHE_PRODUCTS_KEY = "CACHE_PRODUCTS_KEY";
const CACHE_PRODUCTS_INTERVAL = 60 * 1000;

const CACHE_JEWELERY_KEY = "CACHE_JEWELERY_KEY";
const CACHE_JEWELERY_INTERVAL = 60 * 1000;

const CACHE_MENCLOTHING_KEY = "CACHE_MENCLOTHING_KEY";
const CACHE_MENCLOTHING_INTERVAL = 60 * 1000;

const CACHE_WOMENCLOTHING_KEY = "CACHE_WOMENCLOTHING_KEY";
const CACHE_WOMENCLOTHING_INTERVAL = 60 * 1000;

const CACHE_ELECTRONICS_KEY = "CACHE_ELECTRONICS_KEY";
const CACHE_ELECTRONICS_INTERVAL = 60 * 1000; // 1 minute cache



//end of store

abstract class LocalDataSource{
  Future<HomeResponse> getHomeData();

  Future<void> saveHomeToCache(HomeResponse homeResponse);

  void clearCache();

  void removeFromCache(String key);


  Future<StoreDetailsResponse> getStoreDetails();

  Future<void> saveStoreDetailsToCache(StoreDetailsResponse storeDetailsResponse);

//store
  Future<ProductsResponse> getProducts();
  Future<void> saveProductsToCache(ProductsResponse productsResponse);

  Future<ProductsResponse> getJewelery();
  Future<void> saveJeweleryToCache(ProductsResponse productsResponse);

  Future<ProductsResponse> getMenClothing();
  Future<void> saveMenClothingToCache(ProductsResponse productsResponse);

  Future<ProductsResponse> getWomenClothing();
  Future<void> saveWomenClothingToCache(ProductsResponse productsResponse);

  Future<ProductsResponse> getElectronics();
  Future<void> saveElectronicsToCache(ProductsResponse productsResponse);
//end of store

}
class LocalDataSourceImpl implements LocalDataSource{
  //run time cache
  Map<String, CachedItem> cacheMap = Map();
  @override
  Future<HomeResponse> getHomeData() async{
    CachedItem? cachedItem = cacheMap[CACHE_HOME_KEY];

    if(cachedItem != null && cachedItem.isValid(CACHE_HOME_INTERVAL)){
      //return the response from cache
      return cachedItem.data;
    }else{
      // return an error that cache is not there or it's not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveHomeToCache(HomeResponse homeResponse) async{
    cacheMap[CACHE_HOME_KEY]= CachedItem(homeResponse);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async{
    CachedItem? cachedItem = cacheMap[CACHE_STORE_DETAILS_KEY];

    if(cachedItem != null && cachedItem.isValid(CACHE_STORE_DETAILS_INTERVAL)){
      //return the response from cache
      return cachedItem.data;
    }else{
      // return an error that cache is not there or it's not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveStoreDetailsToCache(StoreDetailsResponse storeDetailsResponse) async{
    cacheMap[CACHE_STORE_DETAILS_KEY]= CachedItem(storeDetailsResponse);
  }


  //store
  @override
  Future<ProductsResponse> getProducts() async{
    CachedItem? cachedItem = cacheMap[CACHE_PRODUCTS_KEY];

    if(cachedItem != null && cachedItem.isValid(CACHE_PRODUCTS_INTERVAL)){
      //return the response from cache
      return cachedItem.data;
    }else{
      // return an error that cache is not there or it's not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveProductsToCache(ProductsResponse productsResponse) async{
    cacheMap[CACHE_PRODUCTS_KEY]= CachedItem(productsResponse);
  }

  @override
  Future<ProductsResponse> getElectronics() async{
    CachedItem? cachedItem = cacheMap[CACHE_ELECTRONICS_KEY];

    if(cachedItem != null && cachedItem.isValid(CACHE_ELECTRONICS_INTERVAL)){
      //return the response from cache
      return cachedItem.data;
    }else{
      // return an error that cache is not there or it's not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<ProductsResponse> getJewelery() async{
    CachedItem? cachedItem = cacheMap[CACHE_JEWELERY_KEY];

    if(cachedItem != null && cachedItem.isValid(CACHE_JEWELERY_INTERVAL)){
      //return the response from cache
      return cachedItem.data;
    }else{
      // return an error that cache is not there or it's not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<ProductsResponse> getMenClothing() async{
    CachedItem? cachedItem = cacheMap[CACHE_MENCLOTHING_KEY];

    if(cachedItem != null && cachedItem.isValid(CACHE_MENCLOTHING_INTERVAL)){
      //return the response from cache
      return cachedItem.data;
    }else{
      // return an error that cache is not there or it's not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<ProductsResponse> getWomenClothing() async{
    CachedItem? cachedItem = cacheMap[CACHE_WOMENCLOTHING_KEY];

    if(cachedItem != null && cachedItem.isValid(CACHE_WOMENCLOTHING_INTERVAL)){
      //return the response from cache
      return cachedItem.data;
    }else{
      // return an error that cache is not there or it's not valid
      throw ErrorHandler.handle(DataSource.CACHE_ERROR);
    }
  }

  @override
  Future<void> saveElectronicsToCache(ProductsResponse productsResponse) async{
    cacheMap[CACHE_ELECTRONICS_KEY]= CachedItem(productsResponse);
  }

  @override
  Future<void> saveJeweleryToCache(ProductsResponse productsResponse) async{
    cacheMap[CACHE_JEWELERY_KEY]= CachedItem(productsResponse);
  }

  @override
  Future<void> saveMenClothingToCache(ProductsResponse productsResponse) async{
    cacheMap[CACHE_MENCLOTHING_KEY]= CachedItem(productsResponse);
  }

  @override
  Future<void> saveWomenClothingToCache(ProductsResponse productsResponse) async{
    cacheMap[CACHE_WOMENCLOTHING_KEY]= CachedItem(productsResponse);
  }




  //end of store

}


class CachedItem{
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;

  CachedItem(this.data);

}

extension CachedItemExtension on CachedItem {
  bool isValid(expirationTimeInMillis){
    int currentTimeInMillis= DateTime.now().millisecondsSinceEpoch;
    bool  isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    // expirationTimeInMillis -> 60 s
    // currentTimeInMillis -> 1:00:00
    // cacheTime -> 12:59:30
    //valid -> until  01:00:30
    return isValid;
  }
}
