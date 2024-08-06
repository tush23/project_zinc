// lib/features/dog_breeds/presentation/pages/sub_breed_page.dart
import 'package:flutter/material.dart';
import 'package:project_zinc/core/utils/error_widget.dart';
import 'package:project_zinc/core/utils/loading_widget.dart';
import 'package:project_zinc/core/utils/no_data_widget.dart';
import 'package:project_zinc/features/dog_breeds/di/dependency_injection.dart';
import '../../domain/entities/sub_breed.dart';
import '../../domain/usecases/fetch_sub_breeds.dart';
import '../../utils/breed_utils.dart';
import '../widgets/grouped_listview.dart';
import 'dog_image_page.dart';

class SubBreedPage extends StatefulWidget {
  final String breed;

  const SubBreedPage({super.key, required this.breed});

  @override
  State<SubBreedPage> createState() => _SubBreedPageState();
}

class _SubBreedPageState extends State<SubBreedPage> {
  final FetchSubBreeds _fetchSubBreeds = DependencyInjection.fetchSubBreeds;
  Future<List<SubBreed>>? _subBreeds;

  @override
  void initState() {
    super.initState();
    _subBreeds = _fetchSubBreeds.call(widget.breed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.breed.toUpperCase()} Sub Breeds'),
      ),
      body: FutureBuilder<List<SubBreed>>(
        future: _subBreeds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasError) {
            return CustomErrorWidget(obj: snapshot.error);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const NoDataWidget(msg: 'No sub breeds found');
          } else {
            final groupedSubBreeds =
                BreedUtils.groupSubBreedsAlphabetically(snapshot.data!);

            return GroupedListView(
              groupedItems: groupedSubBreeds,
              onTap: (subBreedName) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DogImagePage(
                      breed: widget.breed,
                      subBreed: subBreedName,
                    ),
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
