import 'package:flutter/material.dart';
import 'package:movie_app/widgets/widgets.dart';

class DetailsScreens extends StatelessWidget {
  const DetailsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    //final String movie =
    //ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate(
                  [_PosterAndTitle(), _Overview(), const CastingCards()]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  static const String _asset = "assets/no-image.jpg";

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black45,
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "movie.title",
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage(_asset),
          image: AssetImage(_asset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  static const String _asset = "assets/no-image.jpg";

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
                height: 150,
                placeholder: AssetImage(_asset),
                image: AssetImage(_asset)),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "movile.title",
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "original.title",
                style: textTheme.displaySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "movie.voteAverage",
                    style: textTheme.headlineSmall,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text("Culpa commodo veniam nulla enim.",
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
