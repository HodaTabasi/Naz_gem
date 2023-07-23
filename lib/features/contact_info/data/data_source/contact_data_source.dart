import 'package:dartz/dartz.dart';
import 'package:naz_gem/features/contact_info/data/model/ContactModel.dart';

abstract class ContactDataSource {
  Future<List<ContactModel>> getContact();
  Future<Unit> Logout();
}