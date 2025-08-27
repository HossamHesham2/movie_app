import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Features/movie/features/home/presentation/widgets/custom_film_card.dart';

class CustomCarouselSliderMovieList extends StatefulWidget {
  final List listMovies;
  final Function(int) selectedIndexFunction;
  final void Function()? onTap;

  const CustomCarouselSliderMovieList({
    super.key,
    required this.listMovies,
    required this.selectedIndexFunction,
    this.onTap,
  });

  @override
  State<CustomCarouselSliderMovieList> createState() =>
      _CustomCarouselSliderMovieListState();
}

class _CustomCarouselSliderMovieListState
    extends State<CustomCarouselSliderMovieList> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.listMovies.length,
      itemBuilder: (context, index, realIndex) => GestureDetector(
        onTap: widget.onTap,
        child: CustomFilmCard(
          posterImage: widget.listMovies[index].largeCoverImage ?? "",
          rate: widget.listMovies[index].rating ?? 0.0,
        ),
      ),
      options: CarouselOptions(
        height: 350.h,

        enlargeCenterPage: true,
        viewportFraction: 0.6,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          setState(() {
            currentPageIndex = index;
            widget.selectedIndexFunction(currentPageIndex);
          });
        },
      ),
    );
  }
}
