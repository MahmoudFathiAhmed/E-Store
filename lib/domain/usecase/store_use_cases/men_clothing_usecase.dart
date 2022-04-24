import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../model/models.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';

class MenClothingUseCase implements BaseUseCase<void, Products> {

  final Repository _repository;

  MenClothingUseCase(this._repository);

  @override
  Future<Either<Failure, Products>> execute(void input) async {
    return await _repository.getMenClothing();
  }
}