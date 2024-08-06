//we can also use singl emodel for all this but creat seprate will essier for learger project
import '../../domain/entities/sub_breed.dart';

class SubBreedModel extends SubBreed {
  SubBreedModel({required super.name});

  factory SubBreedModel.fromJson(String name) {
    return SubBreedModel(name: name);
  }
}
