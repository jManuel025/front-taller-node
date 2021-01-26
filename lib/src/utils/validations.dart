String isEmail(String email) {
  RegExp pattern = new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}');
  print(pattern.hasMatch(email));
  return pattern.hasMatch(email) ? null : 'Invalid email';
}

// String isPassword(String password) {
//   RegExp pattern =
//       new RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}');
//   return pattern.hasMatch(password)
//       ? 'Enter a valid password'
//       : 'Invalid password';
// }
