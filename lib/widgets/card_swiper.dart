import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:provider/provider.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (movies.isEmpty) {
      return Center(
        child: SizedBox(
          width: double.infinity,
          height: size.height * 0.5,
          child: const CircularProgressIndicator(),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      //Toma el 50 por ciento de la pantalla
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (BuildContext context, int index) {
          final movie = Provider.of<Movie>(context);
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, "details",
                arguments: "movie-instance"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                fit: BoxFit.contain,
                placeholder: NetworkImage(movie.fullPosterImg),
                image: NetworkImage(movie.fullPosterImg),
              ),
            ),
          );
        },
      ),
    );
  }
}
