import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_manager_app/controller/auth_cubit/auth_cubit.dart';
import 'package:task_manager_app/controller/auth_cubit/auth_state.dart';

import 'auth_cubit_test.mocks.dart';

void main() {
  late AuthCubit authCubit;
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authCubit = AuthCubit();
  });

  group('Sign Up', () {
    test(
        'should emit [SignupLoadingState, SignupSuccessState] when sign up is successful',
        () async {
      // Arrange
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => MockUserCredential());

      // Act
      authCubit.emailAddress = 'test@gmail.com';
      authCubit.password = '123456';
      await authCubit.signUpWithEmailAndPassword();

      // Assert
      expectLater(
        authCubit.stream,
        emitsInOrder([
          isA<SignupLoadingState>(),
          isA<SignupSuccessState>(),
        ]),
      );
    });

    test(
        'should emit [SignupLoadingState, SignupFailureState] when sign up fails with a weak password',
        () async {
      // Arrange
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenThrow(FirebaseAuthException(code: 'weak-password'));

      // Act
      authCubit.emailAddress = 'test@gmail.com';
      authCubit.password = '123456';
      await authCubit.signUpWithEmailAndPassword();

      // Assert
      expectLater(
        authCubit.stream,
        emitsInOrder([
          isA<SignupLoadingState>(),
          isA<SignupFailureState>(),
        ]),
      );
    });

    // ... other tests
  });

  group('Sign In', () {
    test(
        'should emit [SigninLoadingState, SigninSuccessState] when sign in is successful',
        () async {
      // Arrange
      when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: anyNamed('email'),
        password: anyNamed('password'),
      )).thenAnswer((_) async => MockUserCredential());

      // Act
      authCubit.emailAddress = 'test@gmail.com';
      authCubit.password = '123456';
      await authCubit.sigInWithEmailAndPassword();

      // Assert
      expectLater(
        authCubit.stream,
        emitsInOrder([
          isA<SigninLoadingState>(),
          isA<SigninSuccessState>(),
        ]),
      );
    });

    // ... other tests
  });
}
