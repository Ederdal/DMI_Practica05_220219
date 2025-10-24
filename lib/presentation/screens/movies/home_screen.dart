import 'package:cinemapedia_220219/presentation/providers/movies/movie_slideshow_provider.dart';
import 'package:cinemapedia_220219/presentation/providers/movies/movies_provider.dart';
import 'package:cinemapedia_220219/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final NowPlaying = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);

    return Column(
      children: [
        CustomAppbar(),
        MoviesSlideshow(movies: slideShowMovies),
        MovieHorizontalListview(
          movies: NowPlaying,
          title: 'En cines',
          subTitle: 'Miercoles 22 de Octubre 2025',
        )
      ],
    );
  }
}
