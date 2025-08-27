import 'package:flutter/material.dart';
import 'package:movie_app/Features/movie/features/home/presentation/widgets/action_movie_list_widget.dart';
import 'package:movie_app/Features/movie/features/home/presentation/widgets/all_movie_list_widget.dart';
import 'package:movie_app/Features/movie/features/home/presentation/widgets/horror_movie_list_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    print("new Build");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AllMovieListWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [ActionMovieListWidget(), HorrorMovieListWidget()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
