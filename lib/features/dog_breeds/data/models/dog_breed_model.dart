import '../../domain/entities/dog_breed.dart';

class DogBreedModel extends DogBreed {
  DogBreedModel({required super.name});

  factory DogBreedModel.fromJson(String name) {
    return DogBreedModel(name: name);
  }
}
