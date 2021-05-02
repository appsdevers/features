import 'package:flutter/material.dart';

class SocialAccount {
  final String socialId;
  final String socialName;
  final IconData socialIconData;
  final String socialUrl;

  SocialAccount({
    @required this.socialId,
    @required this.socialName,
    this.socialIconData,
    this.socialUrl,
  });
}

class Profile {
  final String profileId;
  final List<SocialAccount> profileSocialAccount;
  final List<PersonalInfo> profilePersonalInfo;

  Profile(
      {this.profileId, this.profileSocialAccount, this.profilePersonalInfo});
}

class PersonalInfo with ChangeNotifier {
  final String persoId;
  final String persoEmail;
  final double persoPrice;
  final String persoPassword;
  final IconData persoIconData;

  PersonalInfo({
    @required this.persoId,
    @required this.persoEmail,
    @required this.persoPrice,
    @required this.persoPassword,
    @required this.persoIconData,
  });

  // void addPersonalInfo(PersonalInfo addData) {
  //   final newInfo = PersonalInfo(
  //     persoId: addData.persoId,
  //     persoPrice: addData.persoPrice,
  //     persoEmail: addData.persoEmail,
  //     persoPassword: addData.persoPassword,
  //     persoIconData: addData.persoIconData,
  //   );
  // }
}

// @paws_auth:  newPersonalInfo[api/json: add[post]|edit[update] -get--post--delete-],
//           :  deleteNewPersonalInfo[api/json: -post-=]
//           :  with  SocialAccounts, Media,
class MediaPersonalInfo with ChangeNotifier {
  List<PersonalInfo> _items = [];

  List<PersonalInfo> get items {
    return [..._items];
  }

  // Find and Return a Single Product by Id
  // Product findById(String id) {
  //   return _items.firstWhere((prod) => prod.id == id);
  // }

  PersonalInfo findById(String id) {
    return _items.firstWhere((persoId) => persoId.persoId == id);
  }

  void newPersonalInfo(PersonalInfo personalInfo) {
    final newPersonalInfo = PersonalInfo(
      persoId: DateTime.now().toString(),
      persoEmail: personalInfo.persoEmail,
      persoPrice: personalInfo.persoPrice,
      persoPassword: personalInfo.persoPassword,
      persoIconData: personalInfo.persoIconData,
    );

    _items.add(newPersonalInfo);
    notifyListeners();
  }
}

class PortFolio {
  final String portfolioId;
  final String portfolioAppTitle;
  final String portfolioAppDes;
  final String portfolioAppUrl;
  final List<String> portfolioImage;
  final DateTime portfolioReleaseDate;
  final DateTime portfolioNewVersion;

  PortFolio({
    @required this.portfolioId,
    @required this.portfolioAppTitle,
    @required this.portfolioAppDes,
    @required this.portfolioAppUrl,
    @required this.portfolioImage,
    @required this.portfolioReleaseDate,
    @required this.portfolioNewVersion,
  });
}

class Price {}

class Developer with ChangeNotifier {
  final String devId;
  final String devName;
  final String devSurname;
  final String devUrl;
  final String devShare;
  final String devRating;
  final Profile devProfile;
  final PortFolio devPortFolio;
  final Price price;

  Developer({
    @required this.devId,
    @required this.devName,
    @required this.devSurname,
    @required this.devUrl,
    @required this.devShare,
    @required this.devRating,
    @required this.devProfile,
    @required this.price,
    @required this.devPortFolio,
  });

  // void _addDeveloper() {}
  // void _deleteDeveloper() {}
}

class Developers with ChangeNotifier {
  List<Developer> _items = [];

  List<Developer> get items {
    return [..._items];
  }

  final url = 'https://devpro-63c6d-default-rtdb.firebaseio.com/';
}
