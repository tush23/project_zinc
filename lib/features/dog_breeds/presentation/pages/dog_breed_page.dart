// lib/features/dog_breeds/presentation/pages/dog_breed_page.dart
import 'package:flutter/material.dart';
import 'package:project_zinc/core/utils/error_widget.dart';
import 'package:project_zinc/core/utils/loading_widget.dart';
import 'package:project_zinc/core/utils/no_data_widget.dart';
import '../../../../core/usecase/no_params.dart';
import '../../data/errors/dog_breed_failure.dart';
import '../../di/dependency_injection.dart';
import '../../domain/entities/dog_breed.dart';
import '../../domain/usecases/fetch_dog_breeds.dart';
import '../../utils/breed_utils.dart';
import '../widgets/grouped_listview.dart';
import 'sub_breed_page.dart';

class DogBreedPage extends StatefulWidget {
  const DogBreedPage({super.key});

  @override
  State<StatefulWidget> createState() => _DogBreedPageState();
}

class _DogBreedPageState extends State<DogBreedPage> {
  final FetchDogBreeds _fetchDogBreeds = DependencyInjection.fetchDogBreeds;
  Future<List<DogBreed>>? _dogBreeds;

  @override
  void initState() {
    super.initState();
    _dogBreeds = _fetchDogBreeds.call(NoParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breeds'),
      ),
      body: FutureBuilder<List<DogBreed>>(
        future: _dogBreeds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasError) {
            return CustomErrorWidget(obj: snapshot.error);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const NoDataWidget(msg: 'No breeds found');
          } else {
            final groupedBreeds =
                BreedUtils.groupBreedsAlphabetically(snapshot.data!);

            return GroupedListView(
              groupedItems: groupedBreeds,
              onTap: (breedName) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubBreedPage(breed: breedName),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
