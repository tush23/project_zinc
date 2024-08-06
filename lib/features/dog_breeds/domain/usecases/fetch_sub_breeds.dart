// lib/features/dog_breeds/domain/usecases/fetch_sub_breeds.dart
import 'package:project_zinc/core/usecase/usecase.dart';

import '../../domain/entities/sub_breed.dart';
import '../../domain/repositories/dog_breed_repository.dart';

class FetchSubBreeds implements UseCase<List<SubBreed>, String> {
  final DogBreedRepository repository;

  FetchSubBreeds({required this.repository});

  @override
  Future<List<SubBreed>> call(String breed) async {
    return await repository.getSubBreeds(breed);
  }
}
