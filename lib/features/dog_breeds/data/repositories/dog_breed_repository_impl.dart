import '../../domain/entities/dog_breed.dart';
import '../../domain/entities/sub_breed.dart';
import '../../domain/repositories/dog_breed_repository.dart';
import '../datasource/dog_api_service.dart';
import '../errors/dog_breed_failure.dart';
import '../models/dog_breed_model.dart';
import '../models/sub_breed_model.dart';

class DogBreedRepositoryImpl implements DogBreedRepository {
  final DogApiService apiService;

  DogBreedRepositoryImpl({required this.apiService});

  @override
  Future<List<DogBreed>> getDogBreeds() async {
    try {
      final response = await apiService.fetchDogBreeds();
      final breeds = response.keys
          .toList()
          .map((breed) => DogBreedModel.fromJson(breed))
          .toList();
      return breeds;
    } catch (e) {
      throw DogBreedFailure('Failed to load dog breeds $e');
    }
  }

  @override
  Future<List<SubBreed>> getSubBreeds(String breed) async {
    try {
      final response = await apiService.fetchSubBreeds(breed);
      if (response.isEmpty) {
        return [];
      } else {
        return response
            .map((subBreed) => SubBreedModel.fromJson(subBreed))
            .toList();
      }
    } catch (e) {
      throw DogBreedFailure('Failed to load sub breeds');
    }
  }

  @override
  Future<String> getRandomImage(String breed, String subBreed) async {
    try {
      final imageUrl = await apiService.fetchRandomImage(breed, subBreed);
      return imageUrl;
    } catch (e) {
      throw DogBreedFailure('Failed to load image');
    }
  }
}
