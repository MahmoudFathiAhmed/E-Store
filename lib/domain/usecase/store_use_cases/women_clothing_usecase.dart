import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../model/models.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class WomenClothingUseCase implements BaseUseCase<void, Products> {

  final Repository _repository;

  WomenClothingUseCase(this._repository);

  @override
  Future<Either<Failure, Products>> execute(void input) async {
    return await _repository.getWomenClothing();
  }
}