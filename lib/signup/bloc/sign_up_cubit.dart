import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUpWithGithub() {
    // cant sign up with git hub

    emit(SignUpFailed());
  }

  void signUpWithGoogle() {
    emit(GoogleSignUpNotSupported());
  }
}
