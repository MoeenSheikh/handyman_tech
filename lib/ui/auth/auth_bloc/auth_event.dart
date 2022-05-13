import 'package:handyman_tech/models/user_model.dart';

abstract class AuthEvent{}

class AddUserEvent extends AuthEvent{
  UserModel user;
  AddUserEvent({this.user});
}