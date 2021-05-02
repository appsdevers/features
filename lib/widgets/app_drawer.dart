import 'package:flutter/material.dart';

// tools:
//       drawer: fdrawer1, fdrawer2...
//       card_widgets:

Widget _drawerListTile({
  IconData iconData,
  String title,
  Function onTap,
}) {
  return ListTile(
    leading: Icon(iconData),
    title: Text('$title'),
    onTap: onTap,
  );
}

class FeaturesAppDrawer extends StatelessWidget {
  // InputData: data can be changed externally by the constructor.

  @override
  Widget build(BuildContext context) {
    // build reRendersUI of the apps. Don't use properties and methods here cause will be reset by the app! [appBarSize_use] [isLandscape_use]
    print('reBuilds FeaturesAppDrawer()');
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.black38,
                  child: Center(
                    child: Text('FEATURES DRAWER'),
                  ),
                ),
                _drawerListTile(
                  iconData: Icons.maps_ugc,
                  title: 'MAPS',
                  onTap: () {},
                ),
                _drawerListTile(
                  iconData: Icons.camera,
                  title: 'CAMERA_MAPS',
                  onTap: () {},
                ),
                _drawerListTile(
                  iconData: Icons.perm_camera_mic_sharp,
                  title: 'CAMERA',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
