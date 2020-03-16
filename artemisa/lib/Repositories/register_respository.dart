
import 'package:artemisa/models/user.dart';

abstract class RegisterRepository {
  Future<User> registerUser(User user);
}

class RegisterUser extends RegisterRepository {
  @override
  Future<User> registerUser(User user) {
    return Future.delayed(Duration(seconds: 1,),(){
      return user;
    });
  }
  
}