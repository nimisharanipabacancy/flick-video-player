import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';

/// Default portrait controls.
class FlickPortraitControls extends StatelessWidget {
  const FlickPortraitControls(
      {Key? key,
      this.iconSize = 20,
      this.fontSize = 12,
      this.progressBarSettings,
      this.muteChild,
      this.unmuteChild,
      this.soundDecoration,
      this.soundPadding,
      this.isPortrait = true})
      : super(key: key);

  final bool isPortrait;

  /// Icon size.
  ///
  /// This size is used for all the player icons.
  final double iconSize;

  /// Font size.
  ///
  /// This size is used for all the text.
  final double fontSize;

  /// [FlickProgressBarSettings] settings.
  final FlickProgressBarSettings? progressBarSettings;

  final Widget? muteChild;
  final Widget? unmuteChild;
  final EdgeInsetsGeometry? soundPadding;
  final Decoration? soundDecoration;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  child: FlickAutoHideChild(
                    showIfVideoNotInitialized: false,
                    child: FlickPlayToggle(
                      size: 36,
                      color: Colors.white,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        // color: Colors.white70,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if (!isPortrait)
                    FlickVideoProgressBar(
                      flickProgressBarSettings: progressBarSettings,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // FlickPlayToggle(
                      //   size: iconSize,
                      // ),
                      // SizedBox(
                      //   width: iconSize / 2,
                      // ),
                      FlickSoundToggle(
                        size: iconSize,
                        muteChild: muteChild,
                        unmuteChild: unmuteChild,
                        decoration: soundDecoration,
                        padding: soundPadding,
                      ),
                      SizedBox(
                        width: iconSize / 2,
                      ),
                      /*Row(
                        children: <Widget>[
                          FlickCurrentPosition(
                            fontSize: fontSize,
                          ),
                          FlickAutoHideChild(
                            child: Text(
                              ' / ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: fontSize),
                            ),
                          ),
                          FlickTotalDuration(
                            fontSize: fontSize,
                          ),
                        ],
                      ),*/
                      Expanded(
                        child: Container(),
                      ),
                      FlickSubtitleToggle(
                        size: iconSize,
                      ),
                      // SizedBox(
                      //   width: iconSize / 2,
                      // ),
                      FlickFullScreenToggle(
                        size: iconSize,
                        decoration: soundDecoration,
                        padding: soundPadding,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
