part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class OnRegister extends RegisterEvent {

  final User user;
  OnRegister({
    @required this.user,
  });
  @override
  List<Object> get props => [user];
}
