class Endpoints {
  static const String _baseUrl = BaseUrl.baseUrl;

  static String get allBreeds => '$_baseUrl/breeds/list/all';

  static String subBreeds(String breed) => '$_baseUrl/breed/$breed/list';

  static String randomImage(String breed, String subBreed) =>
      '$_baseUrl/breed/$breed/$subBreed/images/random';
}

abstract class BaseUrl {
  static const String baseUrl = 'https://dog.ceo/api';
}
