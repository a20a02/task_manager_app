// test/generate_mocks.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:task_manager_app/controller/auth_cubit/auth_cubit.dart';

// Import the files that contain the classes you want to mock

@GenerateMocks([AuthCubit, FirebaseAuth, User])
void main() {}
