import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/data_sources/firebase_auth_service.dart';
import 'auth_state.dart';
class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService = AuthService();
  AuthCubit() : super(AuthInitial());
  Future<void> loginUser({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await _authService.login(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      final errorMsg = AuthService.getErrorMessage(e);
      emit(LoginError(errorMsg));
    } catch (e) {
      emit(LoginError('حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.'));
    }
  }
  Future<void> registerUser({required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      await _authService.register(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      final errorMsg = AuthService.getErrorMessage(e);
      emit(RegisterError(errorMsg));
    } catch (e) {
      emit(RegisterError('حدث خطأ غير متوقع، يرجى المحاولة لاحقاً.'));
    }
  }
}