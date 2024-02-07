import 'package:aquaria/classes/user.dart';
import 'package:aquaria/services/http_service.dart';

Future<dynamic> registerUser(username, email, password, confirmPassword) async {
  if (password != confirmPassword) {
    print("Password error");
    return "Password doesn't match";
  }

  User user = User(username, email, password);

  int? request = await createUser(user);

  if (request == 200) {
    print("User Registered Successfully!");
    return user;
  } else {
    print("Failed To Register!");
    return null;
  }
}

Future<dynamic> loginUser(username, password) async {
  // Logika buat input

  User user = User(username, null, password);

  int? request = await verifyUser(user);

  if (request == 200) {
    print("User Logged In Successfully!");
    return user;
  } else {
    print("Failed To Log In!");
    return null;
  }
}
