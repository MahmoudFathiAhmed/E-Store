import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../model/models.dart';
import '../../repository/repository.dart';
import '../base_usecase.dart';



class ElectronicsUseCase implements BaseUseCase<void, Products>{

  final Repository _repository;

  ElectronicsUseCase(this._repository);

  @override
  Future<Either<Failure, Products>> execute(void input) async{
    return await _repository.getElectronics();
  }
}