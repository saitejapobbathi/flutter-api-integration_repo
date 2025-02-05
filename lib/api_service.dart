import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> fetchUsers() async {
    final response =
        await http.get(Uri.parse("https://dummyjson.com/users"));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print("API Response: $jsonResponse"); // Debugging
      return jsonResponse['users']; // Adjusted to match the response format
    } else {
      throw Exception("Failed to load users");
    }
  }
}
