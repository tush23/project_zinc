import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_zinc/core/network/endpoints.dart';

abstract class DogApiService {
  Future<Map<String, dynamic>> fetchDogBreeds();
  Future<List<String>> fetchSubBreeds(String breed);
  Future<String> fetchRandomImage(String breed, String subBreed);
}

class DogApiServiceImpl implements DogApiService {
  @override
  Future<Map<String, dynamic>> fetchDogBreeds() async {
    final response = await http.get(Uri.parse(Endpoints.allBreeds));
    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  @override
  Future<List<String>> fetchSubBreeds(String breed) async {
    final response = await http.get(Uri.parse(Endpoints.subBreeds(breed)));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['message'];
      return List<String>.from(data);
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }

  @override
  Future<String> fetchRandomImage(String breed, String subBreed) async {
    final response =
        await http.get(Uri.parse(Endpoints.randomImage(breed, subBreed)));
    if (response.statusCode == 200) {
      return json.decode(response.body)['message'];
    } else {
      throw Exception(json.decode(response.body)['message']);
    }
  }
}
