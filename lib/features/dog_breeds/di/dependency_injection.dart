import '../data/datasource/dog_api_service.dart';
import '../data/repositories/dog_breed_repository_impl.dart';
import '../domain/repositories/dog_breed_repository.dart';
import '../domain/usecases/fetch_dog_breeds.dart';
import '../domain/usecases/fetch_sub_breeds.dart';
import '../domain/usecases/fetch_random_image.dart';

class DependencyInjection {
  static final DogApiService dogApiService = DogApiServiceImpl();
  static final DogBreedRepository dogBreedRepository =
      DogBreedRepositoryImpl(apiService: dogApiService);

  static final FetchDogBreeds fetchDogBreeds =
      FetchDogBreeds(repository: dogBreedRepository);
  static final FetchSubBreeds fetchSubBreeds =
      FetchSubBreeds(repository: dogBreedRepository);
  static final FetchRandomImage fetchRandomImage =
      FetchRandomImage(repository: dogBreedRepository);
}
