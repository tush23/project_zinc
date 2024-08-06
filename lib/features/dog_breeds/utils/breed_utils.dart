import 'package:project_zinc/features/dog_breeds/domain/entities/sub_breed.dart';

import '../domain/entities/dog_breed.dart';

class BreedUtils {
  /// Groups a list of strings alphabetically.
  static Map<String, List<String>> groupStringsAlphabetically(
      List<String> items) {
    final groupedItems = <String, List<String>>{};

    for (var item in items) {
      final firstLetter = item[0].toUpperCase();
      if (groupedItems[firstLetter] == null) {
        groupedItems[firstLetter] = [];
      }
      groupedItems[firstLetter]!.add(item);
    }

    return groupedItems;
  }

  /// Groups a list of [DogBreed] alphabetically by breed name.
  static Map<String, List<String>> groupBreedsAlphabetically(
      List<DogBreed> breeds) {
    final breedNames = breeds.map((breed) => breed.name).toList();
    return groupStringsAlphabetically(breedNames);
  }

  static Map<String, List<String>> groupSubBreedsAlphabetically(
      List<SubBreed> subBreeds) {
    final subBreedNames = subBreeds.map((subBreed) => subBreed.name).toList();
    return groupStringsAlphabetically(subBreedNames);
  }
}
