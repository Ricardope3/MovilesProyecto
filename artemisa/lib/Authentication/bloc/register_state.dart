part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class Registering extends RegisterState {
  @override
  List<Object> get props => [];
}

class Registered extends RegisterState {
  User user;
  Registered({
    @required this.user,
  });
  @override
  List<Object> get props => [user];
}

class RegisterError extends RegisterState {
  String message;
  RegisterError({
    @required this.message,
  });
  @override
  List<Object> get props => [message];
}
