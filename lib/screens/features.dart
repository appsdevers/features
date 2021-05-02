import 'package:features/app_localizations.dart';
import 'package:features/widgets/language_picker_widget.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../widgets/app_drawer.dart';

class FeaturesScreen extends StatefulWidget {
  static const routeName = '/features';

  @override
  _FeaturesScreenState createState() => _FeaturesScreenState();
}

class _FeaturesScreenState extends State<FeaturesScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.youtube.com/watch?v=LzLt865Jq4Y&ab_channel=DrissAS')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    // build reRendersUI of the apps. Don't use properties and methods here cause will be reset by the app! [appBarSize_use] [isLandscape_use]
    print('reBuilds FeaturesScreen()');
    return Scaffold(
      drawer: FeaturesAppDrawer(),
      appBar: AppBar(
        title: Text('Features'),
        actions: [
          LanguagePickerWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context).translate('first_string')),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context).translate('second_string')),
            const SizedBox(height: 60),
            Container(
              height: 300,
              width: 300,
              child: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

// user__management: Provider__authProvider:    package| //google_maps: package__functionnalities: _SEARCH _FORMKIT _GOOGLE_AUTH
// _PHONE_AUTH  _MAPS _CAMERA  __MAPS__ON_CAMERA  _PAYMENT  __PHONE__AUTHENTICATION __