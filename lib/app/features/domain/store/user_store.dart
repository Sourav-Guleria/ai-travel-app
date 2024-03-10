import 'package:ai_travel_app/app/features/domain/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserStore extends Cubit<User> {
  UserStore() : super(const User.empty());

  setUser(User user) => emit(user);
}
