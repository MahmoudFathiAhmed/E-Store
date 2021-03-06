import '../../data/response/responses.dart';
import '../../app/extensions.dart';
import '../../app/constants.dart';
import '../../domain/model/models.dart';

extension CustomerResponseMapper on CustomerResponse?{
  Customer toDomain(){
    return Customer(
        this?.id.orEmpty()??Constants.empty,
        this?.name.orEmpty()??Constants.empty,
        this?.numOfNotifications.orZero()??Constants.zero
    );
  }
}

extension ContactsResponseMapper on ContactsResponse?{
  Contacts toDomain(){
    return Contacts(
        this?.phone.orEmpty()??Constants.empty,
        this?.email.orEmpty()??Constants.empty,
        this?.link.orEmpty()??Constants.empty
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(
        this?.customer.toDomain(),
        this?.contacts.toDomain(),
    );
  }
}
//store mappers
extension RatingResponseMapper on RatingResponse?{
  Rating toDomain(){
    return Rating(
        this?.rate.orZeroD()??Constants.zeroD,
        this?.count.orZero()??Constants.zero
    );
  }
}

extension ProductsResponseMapper on ProductsResponse?{
  Products toDomain(){
    return Products(
        this?.id.orZero()??Constants.zero,
        this?.title.orEmpty()??Constants.empty,
        this?.price.orZeroD()??Constants.zeroD,
        this?.description.orEmpty()??Constants.empty,
        this?.category.orEmpty()??Constants.empty,
        this?.image.orEmpty()??Constants.empty,
        this?.rating.toDomain(),
    );
  }
}


//end of store mappers
extension ForgotPasswordResponseMapper on ForgotPasswordResponse?{
  String toDomain(){
    return this?.support?.orEmpty()??Constants.empty;
  }
}

// extension ServiceResponseMapper on ServicesResponse?{
//   Service toDomain(){
//     return Service(
//         this?.id.orZero()??Constants.zero,
//         this?.title.orEmpty()??Constants.empty,
//         this?.image.orEmpty()??Constants.empty);
//   }
// }
//
//
// extension BannersResponseMapper on BannersResponse?{
//   BannerAd toDomain(){
//     return BannerAd(
//         this?.id.orZero()??Constants.zero,
//         this?.title.orEmpty()??Constants.empty,
//         this?.image.orEmpty()??Constants.empty,
//         this?.link.orEmpty()??Constants.empty);
//   }
// }
//
// extension StoreResponseMapper on StoreResponse?{
//   Store toDomain(){
//     return Store(
//         this?.id.orZero()??Constants.zero,
//         this?.title.orEmpty()??Constants.empty,
//         this?.image.orEmpty()??Constants.empty);
//   }
// }
//
// extension HomeResponseMapper on HomeResponse?{
//   HomeObject toDomain(){
//     List<Service> services =
//     (this?.data?.services?.map((serviceResponse) => serviceResponse.toDomain())??const Iterable.empty()).cast<Service>().toList();
//
//     List<BannerAd> banners =
//     (this?.data?.banners?.map((bannersResponse) => bannersResponse.toDomain())??const Iterable.empty()).cast<BannerAd>().toList();
//
//     List<Store> stores =
//     (this?.data?.stores?.map((storeResponse) => storeResponse.toDomain())??const Iterable.empty()).cast<Store>().toList();
//
//     var data = HomeData(services, banners, stores);
//     return HomeObject(data);
//   }
// }
//
// extension StoreDetailsResponseMapper on StoreDetailsResponse?{
//   StoreDetails toDomain(){
//     return StoreDetails(
//         this?.image.orEmpty()??Constants.empty,
//         this?.id.orZero()??Constants.zero,
//         this?.title.orEmpty()??Constants.empty,
//         this?.details.orEmpty()??Constants.empty,
//         this?.services.orEmpty()??Constants.empty,
//         this?.about.orEmpty()??Constants.empty
//     );
//   }
// }