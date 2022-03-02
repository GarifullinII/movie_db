import 'package:flutter/material.dart';
import 'package:movie_db/presentation/ui/widgets/elements/radial_percent_widget.dart';
import 'package:movie_db/resources/resources.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(25.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 25.0,
          ),
          child: _MovieInfo(),
        ),
        SizedBox(
          height: 30.0,
        ),
        _PeopleWidgets(),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(
          image: AssetImage(Images.kingbig),
        ),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(
            image: AssetImage(Images.kingsmall),
          ),
        )
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 4,
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'The King`s Man',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: ' (2021)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              SizedBox(
                width: 50.0,
                height: 50.0,
                child: RadialPercentWidget(
                  percent: 0.58,
                  fillColor: Colors.black,
                  lineColor: Colors.green,
                  filedColor: Colors.yellow,
                  lineWidth: 5,
                  child: Text(
                    '58 %',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Text('User Score'),
            ],
          ),
        ),
        Container(
          width: 1.0,
          height: 15.0,
          color: Colors.grey,
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: const [
              Icon(
                Icons.play_arrow,
              ),
              Text(
                'Play Trailer',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 70,
        ),
        child: Text(
          'R, 12/22/2021 (US), 2h 11m, Action, Adventure, Thriller, War',
          maxLines: 4,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  const _MovieInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _OverviewWidget(),
        SizedBox(
          height: 10,
        ),
        _DescriptionWidget(),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'As a collection of history`s worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _PeopleWidgets extends StatelessWidget {
  const _PeopleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    const positionStyle = TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Matthew Vaughn',
              style: nameStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Director, Screenplay, Story',
              style: positionStyle,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Karl Gajdusek',
              style: nameStyle,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Screenplay',
              style: positionStyle,
            ),
          ],
        )
      ],
    );
  }
}
