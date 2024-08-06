// lib/features/dog_breeds/presentation/pages/dog_image_page.dart
import 'package:flutter/material.dart';
import 'package:project_zinc/core/utils/error_widget.dart';
import 'package:project_zinc/core/utils/loading_widget.dart';
import 'package:project_zinc/core/utils/no_data_widget.dart';
import '../../data/datasource/dog_api_service.dart';
import '../../data/repositories/dog_breed_repository_impl.dart';
import '../../domain/usecases/fetch_random_image.dart';

class DogImagePage extends StatefulWidget {
  final String breed;
  final String subBreed;

  const DogImagePage({super.key, required this.breed, required this.subBreed});

  @override
  State<DogImagePage> createState() => _DogImagePageState();
}

class _DogImagePageState extends State<DogImagePage> {
  final FetchRandomImage _fetchRandomImage = FetchRandomImage(
      repository: DogBreedRepositoryImpl(apiService: DogApiServiceImpl()));
  Future<String>? _dogImageUrl;

  @override
  void initState() {
    super.initState();
    _dogImageUrl = _fetchRandomImage.call({
      'breed': widget.breed,
      'subBreed': widget.subBreed,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.breed.toUpperCase()} ${widget.subBreed}'),
      ),
      body: FutureBuilder<String>(
        future: _dogImageUrl,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasError) {
            return CustomErrorWidget(obj: snapshot.error);
          } else if (!snapshot.hasData) {
            return const NoDataWidget(msg: 'No image found');
          } else {
            return Center(
              child: Image.network(snapshot.data!),
            );
          }
        },
      ),
    );
  }
}
