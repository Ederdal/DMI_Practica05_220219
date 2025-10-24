import 'package:cinemapedia_220219/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.title,
      this.subTitle,
      this.loadNextPage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 350,
        child: Column(
          children: [
            if (title != null || subTitle != null)
              _Currdate(
                place: title,
                formatedDate: subTitle,
              ),
            Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _Slide(movie: movies[index]);
                  }),
            )
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  return child;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Currdate extends StatelessWidget {
  final String? place;
  final String? formatedDate;

  const _Currdate({this.place, this.formatedDate});

  @override
  Widget build(BuildContext context) {
    final placeStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (place != null)
            Text(
              place!,
              style: placeStyle,
            ),
          const Spacer(),
          if (formatedDate != null)
            FilledButton(onPressed: () {}, child: Text(formatedDate!))
        ],
      ),
    );
  }
}
