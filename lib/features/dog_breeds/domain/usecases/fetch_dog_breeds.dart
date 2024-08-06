import 'package:project_zinc/core/usecase/usecase.dart';

import '../../../../core/usecase/no_params.dart';
import '../../domain/entities/dog_breed.dart';
import '../../domain/repositories/dog_breed_repository.dart';

class FetchDogBreeds implements UseCase<List<DogBreed>, NoParams> {
  final DogBreedRepository repository;

  FetchDogBreeds({required this.repository});

  @override
  Future<List<DogBreed>> call(NoParams params) async {
    return await repository.getDogBreeds();
  }
}
