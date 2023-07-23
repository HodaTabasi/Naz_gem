import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/contact_info/domain/entities/contact.dart';

import '../../../../core/error/failures.dart';
import '../repository/contact_repo.dart';

class GetContactUseCase {
  final ContactRepo repository;

  GetContactUseCase({required this.repository});

  Future<Either<Failure, List<Contact>>> call() async {
    return await repository.getContact();
  }
}