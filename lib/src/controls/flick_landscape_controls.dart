import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';

/// Default landscape controls.
class FlickLandscapeControls extends StatelessWidget {
  const FlickLandscapeControls(
      {Key? key,
      this.iconSize = 30,
      this.fontSize = 14,
      this.muteChild,
      this.unmuteChild,
      this.soundDecoration,
      this.soundPadding})
      : super(key: key);

  final double iconSize;
  final double fontSize;

  final Widget? muteChild;
  final Widget? unmuteChild;
  final EdgeInsetsGeometry? soundPadding;
  final Decoration? soundDecoration;

  @override
  Widget build(BuildContext context) {
    return FlickPortraitControls(
      fontSize: fontSize,
      iconSize: iconSize,
      progressBarSettings: FlickProgressBarSettings(
        height: 5,
      ),
      muteChild: muteChild,
      unmuteChild: unmuteChild,
      soundDecoration: soundDecoration,
      soundPadding: soundPadding,
      isPortrait: false,
    );
  }
}
