import '../../domain/entities/dog_breed.dart';
import '../../domain/entities/sub_breed.dart';

abstract class DogBreedRepository {
  Future<List<DogBreed>> getDogBreeds();
  Future<List<SubBreed>> getSubBreeds(String breed);
  Future<String> getRandomImage(String breed, String subBreed);
}
