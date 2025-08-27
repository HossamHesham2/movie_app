import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/assets/assets_manager.dart';
import 'package:movie_app/core/styles/style_manager.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key});

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    int? movieId;
    if (args is int) {
      movieId = args;
    }

    print("Movie Id is ---> $movieId");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleManager.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: StyleManager.white,
            size: 30.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgsManager.favIcon,
              color: StyleManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
