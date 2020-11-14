import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineRender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        TimelineTile(
          axis: TimelineAxis.vertical,
          alignment: TimelineAlign.center,
          endChild: Container(
            constraints: const BoxConstraints(
              minHeight: 100,
            ),
            color: Colors.lightGreenAccent,
          ),
          startChild: Container(
            color: Colors.amberAccent,
          ),
        ),
      ],
    ));
  }
}
