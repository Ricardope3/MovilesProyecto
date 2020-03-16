part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class OnRegister extends RegisterEvent {
/*   User user2 = User(
      name: "Ricardo",
      email: "ricky.foals@gmail.com",
      gender: "Male",
      language: "es",
      lastname: "Espinoza",
      password: "123",
      passwordConfirmation: "123"); */

  User user;
  OnRegister({
    @required this.user,
  });
  @override
  List<Object> get props => [user];
}
