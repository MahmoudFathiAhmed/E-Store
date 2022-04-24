import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../model/models.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class ProductsUseCase implements BaseUseCase<void, Products>{

  final Repository _repository;

  ProductsUseCase(this._repository);

  @override
  Future<Either<Failure, Products>> execute(void input) async{
    return await _repository.getProducts();
  }

}