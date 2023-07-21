import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/home/data/model/gallery_model.dart';
import 'package:naz_gem/features/home/domain/repository/homeRepo.dart';

import '../../../../core/error/failures.dart';
import '../entities/gallery.dart';

class GetGalleryUseCase {
  final HomeRepo repository;

  GetGalleryUseCase({required this.repository});

  Future<Either<Failure, List<Gallery>>> call() async {
    return await repository.getGalleries();
  }
}
