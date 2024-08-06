// lib/features/dog_breeds/domain/usecases/fetch_random_image.dart
import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/dog_breed_repository.dart';

class FetchRandomImage implements UseCase<String, Map<String, String>> {
  final DogBreedRepository repository;

  FetchRandomImage({required this.repository});

  @override
  Future<String> call(Map<String, String> params) async {
    return await repository.getRandomImage(
        params['breed']!, params['subBreed']!);
  }
}
