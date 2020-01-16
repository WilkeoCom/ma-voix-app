import 'package:flutter/material.dart';
import 'package:ma_voix_app/projects/models/project.dart';
import 'package:ma_voix_app/projects/widgets/chart.dart';
import 'package:ma_voix_app/projects/widgets/vote_button_list.dart';

class ProjectDetailHeader extends StatelessWidget {
  ProjectDetailHeader(this.project);

  final Project project;

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.darken),
          image: AssetImage(
            'images/education.jpg',
          ),
        ),
      ),
    );

    Widget resumePollFor = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.thumb_up, color: Colors.blue),
        Text('95%',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            )),
        Text('(25)',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14.0,
            )),
      ],
    );

    Widget resumePollAgainst = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.thumb_down, color: Colors.red),
        Text('5%',
            style: TextStyle(
              color: Colors.red,
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            )),
        Text('(25)',
            style: TextStyle(
              color: Colors.red,
              fontSize: 14.0,
            )),
      ],
    );

    Widget chartPoll = Container(
      height: 150,
      child: Chart.withSampleData(),
    );

    Widget voteButtons = Expanded(
      flex: 1,
      child: new VoteButtonList(),
    );

    return SliverAppBar(
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text("Project title",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            )),
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            backgroundImage,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    resumePollFor,
                    chartPoll,
                    resumePollAgainst,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    voteButtons,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
