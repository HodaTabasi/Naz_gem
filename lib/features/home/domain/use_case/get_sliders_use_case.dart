import 'package:dartz/dartz.dart';

import 'package:naz_gem/features/home/data/model/slider_model.dart';
import 'package:naz_gem/features/home/domain/repository/homeRepo.dart';

import '../../../../core/error/failures.dart';
import '../entities/sliders.dart';

class GetSliderUseCase {
  final HomeRepo repository;

  GetSliderUseCase({required this.repository});

  Future<Either<Failure, List<MySlider>>> call() async {
    return await repository.getSliders();
  }
}
