import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/contact_info/data/model/ContactModel.dart';

import '../../../../core/error/failures.dart';
import '../entities/contact.dart';

abstract class ContactRepo {
  Future<Either<Failure, List<Contact>>> getContact();
  Future<Either<Failure, Unit>> logout();
}