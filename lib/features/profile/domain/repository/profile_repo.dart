import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user.dart';

abstract class ProfileRepo {
  Future<Either<Failure,User>> getUser();
  Future<Either<Failure,User>> updateUser(User user);
  Future<Either<Failure,User>> updateUserWithoutImage(User user);

}