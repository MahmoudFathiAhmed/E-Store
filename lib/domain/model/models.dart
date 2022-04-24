
//onboarding models
class SliderObject{
  String title;
  String subTitle;
  String image;
  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject{
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}

//login models
class Customer{
String id;
String name;
int numOfNotifications;

Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts{
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication{
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}
//store models
class Rating{
  double rate;
  int count;

  Rating(this.rate, this.count);
}
class Products{
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating? rating;

  Products(this.id, this.title, this.price, this.description, this.category,
      this.image, this.rating);
}

//end of store models
class Service{
  int id;
  String title;
  String image;

  Service(this.id, this.title, this.image);
}

class BannerAd{
  int id;
  String title;
  String image;
  String link;

  BannerAd(this.id, this.title, this.image, this.link);
}

class Store{
  int id;
  String title;
  String image;

  Store(this.id, this.title, this.image);
}

class HomeData{
  List<Service> services;
  List<BannerAd> banners;
  List<Store> stores;

  HomeData(this.services, this.banners, this.stores);
}

class HomeObject{
// HomeData? data;
  HomeData data;
  HomeObject(this.data);
}

class StoreDetails{
  String image;
  int id;
  String title;
  String details;
  String services;
  String about;

  StoreDetails(
      this.image, this.id, this.title, this.details, this.services, this.about);
}

