import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';

import 'providers/social_account.dart' show PersonalInfo, MediaPersonalInfo;

// authScreen__Finished
// admin___HUB_Finished
// Developer__Provider_Over

// [[SUPER_FORM]]

enum AuthType {
  SignUp,
  ForgotPaws,
  CompleteProfile,
  OTP,
  SignIn,
}

enum FieldType {
  Price,
  Text,
  Description,
  Phone,
  Email,
  Address,
  OtpForm,
  ImageUrl,
  UrlApi,
  Password,
  File,
  Date,
}

class AuthScreenForm extends StatefulWidget {
  static const routeName = '/auth-screen-form';

  @override
  _AuthScreenFormState createState() => _AuthScreenFormState();
}

class _AuthScreenFormState extends State<AuthScreenForm> {
  // [[SUPER_FORM]]

  AuthType _authType2 = AuthType.SignIn;

  final _formKey = GlobalKey<FormState>();

  // [[SUPER_FORM]]

  // Form_FocusNode  Dispose_FocusNode
  final _paws1FocusNode = FocusNode();
  final _paws2FocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();

  final _phoneNumberFocusNode = FocusNode();
  final _otp1FocusNode = FocusNode();
  final _otp2FocusNode = FocusNode();
  final _otp3FocusNode = FocusNode();
  final _otp4FocusNode = FocusNode();
  final _otp5FocusNode = FocusNode();

  // [[SUPER_FORM]]

  // Add_Listener
  final _urlFocusNode = FocusNode();

  // [[SUPER_FORM]]

  // Form_Controller  Dispose_Controller
  final _paws1Controller = TextEditingController();
  final _paws2Controller = TextEditingController();
  final _mailController = TextEditingController();

  // [[SUPER_FORM]]

  // show Preview
  final _urlController = TextEditingController();

  // [[SUPER_FORM]]

  // initialize: ProductInfo
  bool _isInit = true;

  var _initialValues = {
    'persoEmail': '',
    'persoPrice': 0,
    'persoPassword': '',
    'persoIconData': '',
  };

  var _addPersonalInfo = PersonalInfo(
    persoId: null,
    persoEmail: '',
    persoPassword: '',
    persoPrice: 0,
    persoIconData: null,
  );

  // [[SUPER_FORM]]

  // form Color
  static const _kScaffoldBackColor = Color(0xFF4C72F9);
  static const _kColorWhite = Colors.white;
  static const _kColorWhite70 = Colors.white70;
  static const _kColorBlack54 = Colors.black54;
  var _kColorRedSahde200 = Colors.red.shade200;

  // form Color
  static const _kTextButtonStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
  );
  static const _kTextAccountStyle = TextStyle(
    color: _kColorWhite,
    fontSize: 26,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );
  static const _kTextTitleStyle = TextStyle(
    color: _kColorWhite,
    fontSize: 30,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );
  static const _kTextDescStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    color: _kColorWhite70,
  );
  static const _kTextTermsCondStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: _kColorWhite70,
  );

  static const _kLabelStyle = TextStyle(
    fontSize: 17,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    color: _kColorWhite,
  );
  static const _kHintStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    letterSpacing: .4,
    color: _kColorBlack54,
    fontWeight: FontWeight.w600,
  );
  var _kErrorStyle = TextStyle(
    fontSize: 10,
    fontFamily: 'Poppins',
    letterSpacing: .4,
    color: Colors.red.shade200,
    fontWeight: FontWeight.w900,
  );

  // [[SUPER_FORM]]

  // Form Custom-Widgets

  Widget _buildRichText({
    AuthType authType,
  }) {
    Widget _richText(
      String text1,
      String text2, {
      Function function,
    }) {
      return GestureDetector(
        onTap: function,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: _kTextTermsCondStyle,
            children: [
              TextSpan(text: text1),
              TextSpan(
                text: text2,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.lightBlue,
                ),
              ),
            ],
          ),
        ),
      );
    }

    switch (authType) {
      case AuthType.SignUp:
        return _richText('By continue you confirm that you agree our ',
            'Terms and Conditions');
        break;
      case AuthType.CompleteProfile:
        return _richText('By continue you confirm that you agree our ',
            'Terms and Conditions');
        break;
      case AuthType.OTP:
        return _richText('', 'Resend OTP');
        break;
      case AuthType.SignIn:
        return _richText('Don\'t have an account? ', 'Sign Up');
        break;
      default:
        return _richText('By continue you confirm that you agree with our ',
            'Terms and Conditions');
    }
  }

  // [[SUPER_FORM]]

  Widget _buildText({
    String text,
    TextStyle style,
  }) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: style,
    );
  }

  Widget _buildTextButton({
    String text,
    TextStyle style,
    Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }

  // enum_transform: return value due to complexity_text  => switch_statement /return: redoundant /break_need if don't use return;
  // String get complexityText { switch (complexity) {
  // case Complexity.Simple: return 'Simple'; break;
  // case Complexity.Challenging: return 'Challenging'; break;
  // case Complexity.Hard: return 'Hard'; break; default: 'Unkwnown'; } }

  // switch () {
  //   case :

  //     break;
  //   default:
  // }

  // [[SUPER_FORM]]

  Widget _formSuffixIcon(
    FieldType fieldType, {
    IconData iconData,
  }) {
    // FieldType_SuffixIcon
    Widget _buildSuffixIcon(
      IconData iconData,
      IconData fieldIcon,
    ) {
      return iconData != null
          ? Icon(iconData, size: 26)
          : Icon(
              fieldIcon,
              size: 22,
              color: _kColorWhite,
            );
    }

    switch (fieldType) {
      case FieldType.Email:
        return _buildSuffixIcon(iconData, FontAwesomeIcons.mailBulk);
        break;
      case FieldType.Password:
        return _buildSuffixIcon(iconData, FontAwesomeIcons.key);
        break;
      case FieldType.Phone:
        return _buildSuffixIcon(
          iconData,
          Icons.ad_units_rounded,
        );
        break;
      case FieldType.Address:
        return _buildSuffixIcon(
          iconData,
          FontAwesomeIcons.locationArrow,
        );
        break;
      case FieldType.Text:
        return _buildSuffixIcon(iconData, FontAwesomeIcons.textHeight);
        break;
      case FieldType.Description:
        return _buildSuffixIcon(iconData, FontAwesomeIcons.addressBook);
        break;
      case FieldType.Date:
        return _buildSuffixIcon(iconData, FontAwesomeIcons.calendarDay);
        break;
      case FieldType.OtpForm:
        return null;
        break;
      case FieldType.Price:
        return _buildSuffixIcon(iconData, FontAwesomeIcons.docker);
        break;
      case FieldType.ImageUrl:
        return _buildSuffixIcon(iconData, FontAwesomeIcons.link);
        break;

      default:
        _buildSuffixIcon(iconData, Icons.lock_outline_rounded);
    }

    return iconData != null
        ? Icon(iconData, size: 26)
        : Icon(Icons.lock_outline_rounded, size: 26, color: _kColorWhite);
  }

  // [[SUPER_FORM]]

  // Widget _formPrefixIcon(
  //   FieldType fieldType,
  //   IconData iconData,
  // ) {
  //   Widget _buildPrefixIcon(
  //     IconData iconData,
  //     IconData fieldIcon,
  //   ) {
  //     return iconData != null
  //         ? Icon(iconData, size: 26)
  //         : Icon(
  //             fieldIcon,
  //             size: 26,
  //             color: _kColorWhite,
  //           );
  //   }

  //   switch (fieldType) {
  //     case FieldType.Email:
  //       return _buildPrefixIcon(iconData, Icons.mail_outline);
  //       break;
  //     case FieldType.Phone:
  //       return _buildPrefixIcon(
  //         iconData,
  //         FontAwesomeIcons.phone,
  //       );
  //       break;
  //     case FieldType.Text:
  //       return _buildPrefixIcon(iconData, FontAwesomeIcons.textHeight);
  //       break;
  //     case FieldType.Description:
  //       return _buildPrefixIcon(iconData, FontAwesomeIcons.addressBook);
  //       break;
  //     case FieldType.Date:
  //       return _buildPrefixIcon(iconData, FontAwesomeIcons.calendarDay);
  //       break;
  //     case FieldType.OtpForm:
  //       return null;
  //       break;
  //     case FieldType.Price:
  //       return _buildPrefixIcon(iconData, FontAwesomeIcons.docker);
  //       break;
  //     case FieldType.ImageUrl:
  //       return _buildPrefixIcon(iconData, FontAwesomeIcons.link);
  //       break;

  //     default:
  //       _buildPrefixIcon(iconData, Icons.lock_outline_rounded);
  //   }

  //   return iconData != null
  //       ? Icon(iconData, size: 26)
  //       : Icon(Icons.lock_outline_rounded, size: 26, color: _kColorWhite);
  // }

  String _formLabelText(labelText) {
    switch (labelText) {
      case FieldType.Email:
        return 'Email';
        break;
      case FieldType.Password:
        return 'Enter password';

        break;
      case FieldType.Phone:
        return 'Phone';

        break;
      case FieldType.Address:
        return 'Address';

        break;
      case FieldType.Text:
        return '';
        break;
      case FieldType.OtpForm:
        return null;
        break;
      case FieldType.Description:
        return 'Description';

        break;
      case FieldType.Date:
        return 'Date';

        break;
      case FieldType.Price:
        return 'Price';

        break;
      case FieldType.ImageUrl:
        return 'ImageUrl Image';

        break;

      default:
        return '';
    }
  }

  // [[SUPER_FORM]]

  TextStyle _formLabelStyle({TextStyle labelStyle}) {
    return labelStyle != null ? labelStyle : _kLabelStyle;
  }

  // [[SUPER_FORM]]

  String _formHintText(hintText) {
    switch (hintText) {
      case FieldType.Email:
        return 'Enter your email';
        break;
      case FieldType.Password:
        return 'Password';

        break;
      case FieldType.Phone:
        return 'Enter Valid Phone';

        break;
      case FieldType.Address:
        return 'Enter your Address';

        break;
      case FieldType.Text:
        return '';

        break;

      case FieldType.OtpForm:
        return null;

        break;
      case FieldType.Description:
        return 'Your Message';

        break;
      case FieldType.Date:
        return 'Provide Valid DateTime';

        break;
      case FieldType.Price:
        return 'Value';

        break;
      case FieldType.ImageUrl:
        return 'Enter A Valid ImageUrl';

        break;

      default:
        return '';
    }
  }

  // [[SUPER_FORM]]

  TextStyle _formHintStyle({TextStyle hintStyle}) {
    return hintStyle != null ? hintStyle : _kHintStyle;
  }

  // [[SUPER_FORM]]

  // String _formErrorText(errorText) {
  //   switch (errorText) {
  //     case FieldType.Email:
  //       return 'Enter your email';
  //       break;
  //     case FieldType.Password:
  //       return 'Password';

  //       break;
  //     case FieldType.Phone:
  //       return 'Enter Valid Phone';

  //       break;
  //     case FieldType.Address:
  //       return 'Enter Valid Address';

  //       break;
  //     case FieldType.Text:
  //       return '';

  //       break;
  //     case FieldType.Description:
  //       return 'Your Message';

  //       break;
  //     case FieldType.Date:
  //       return '';

  //       break;
  //     case FieldType.Price:
  //       return 'Value';

  //       break;
  //     case FieldType.ImageUrl:
  //       return 'Enter A Valid ImageUrl';

  //       break;

  //     default:
  //       return '';
  //   }
  // }

  // [[SUPER_FORM]]

  TextStyle _formErrorStyle({TextStyle errorStyle}) {
    return errorStyle != null ? errorStyle : _kErrorStyle;
  }

  // [[SUPER_FORM]]

  EdgeInsetsGeometry _formContentPadding({EdgeInsetsGeometry contentPadding}) {
    return contentPadding != null
        ? contentPadding
        : EdgeInsets.only(
            left: 20,
            top: 13,
            right: 15,
            bottom: 13,
          );
  }

  // [[SUPER_FORM]]

  InputBorder _formFocusedBorder({InputBorder focusedBorder}) {
    return focusedBorder != null
        ? focusedBorder
        : OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.solid,
              color: _kColorWhite70,
            ),
          );
  }

  // [[SUPER_FORM]]

  InputBorder _formEnabledBorder({InputBorder enabledBorder}) {
    return enabledBorder != null
        ? enabledBorder
        : OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.solid,
              color: _kColorWhite70,
            ),
          );
  }

  // [[SUPER_FORM]]

  InputBorder _formErrorBorder({InputBorder errorBorder}) {
    return errorBorder != null
        ? errorBorder
        : OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.solid,
              color: _kColorRedSahde200,
            ),
          );
  }

  // [[SUPER_FORM]]

  FocusNode _formFocusNode(FocusNode focusNode) {
    return focusNode;
  }

  // [[SUPER_FORM]]

  TextInputType _formKeyboardType(
    FieldType fieldType,
  ) {
    switch (fieldType) {
      case FieldType.Text:
        return TextInputType.text;
        break;
      case FieldType.Description:
        return TextInputType.multiline;
        break;
      case FieldType.Price:
        return TextInputType.number;
        break;
      case FieldType.Email:
        return TextInputType.emailAddress;
        break;
      case FieldType.ImageUrl:
        return TextInputType.url;
        break;
      case FieldType.Phone:
        return TextInputType.phone;
        break;
      case FieldType.OtpForm:
        return TextInputType.phone;
        break;
      case FieldType.Address:
        return TextInputType.streetAddress;
        break;
      case FieldType.Password:
        return TextInputType.visiblePassword;
        break;

      default:
        return TextInputType.name;
    }
  }

  // [[SUPER_FORM]]

  TextInputAction _formTextInputAction(
    FieldType fieldType,
  ) {
    switch (fieldType) {
      case FieldType.Text:
        return TextInputAction.go;
        break;
      case FieldType.Description:
        break;
      case FieldType.Price:
        return TextInputAction.go;
        break;
      case FieldType.Email:
        return TextInputAction.go;
        break;
      case FieldType.ImageUrl:
        return TextInputAction.done;
        break;
      case FieldType.Phone:
        return TextInputAction.go;
        break;
      case FieldType.OtpForm:
        return TextInputAction.go;
        break;

      case FieldType.Address:
        return TextInputAction.route;
        break;
      case FieldType.Password:
        return TextInputAction.go;
        break;

      default:
        return TextInputAction.go;
    }
    return TextInputAction.go;
  }
  // FocusNode _formFocusNode() {5
  //   return _paws1FocusNode;
  // }

  // [[SUPER_FORM]]

  void _saveForm() {
    if (!_formKey.currentState.validate()) {
      print("[NO FORM VALIDATION]===================[NO FORM VALIDATION]");
      return;
    }

    _formKey.currentState.save();

    FocusScope.of(context).unfocus();

    _printProvidersValue();
    Provider.of<MediaPersonalInfo>(context, listen: false)
        .newPersonalInfo(_addPersonalInfo);
    // fsaveprovider
    print(
        "[SAVEDATA__IN__PROVIDER__[developer/MediaPersonalInfo]__(newPersonalInfo)---->=]");
    print("[SAVEDATA__IN__DB__[helper/db_helper]------------->=]");
  }

  void _printProvidersValue() {
    print("[FORMSAVED]----------------------------->[FORMSAVED]=");
    print(
        "[FORMSAVED]------------------------->>${_addPersonalInfo.persoEmail}");
    print(
        "[FORMSAVED]------------------------>>${_addPersonalInfo.persoPassword}");
    print(
        "[FORMSAVED]------------------------->>${_addPersonalInfo.persoPrice}");
    print("[FORMSAVED]------------------------->>${_addPersonalInfo.persoId}");

    print("[FORMSAVED]----------------------------->[FORMSAVED]=");

    setState(() {
      if (_authType2 == AuthType.SignIn) {
        // check if authenticate then navigate
        _authType2 = AuthType.SignUp;
      } else if (_authType2 == AuthType.SignUp) {
        _authType2 = AuthType.CompleteProfile;
      } else if (_authType2 == AuthType.CompleteProfile) {
        _authType2 = AuthType.OTP;
      } else if (_authType2 == AuthType.OTP) {
        _authType2 = AuthType.SignIn;
      } else
        return;
    });
  }

  // [[SUPER_FORM]]

  // void Function(String) _formOnSaved({
  //   PersonalInfo details,
  // }) {
  //   return (value) {
  //     _addPersonalInfo = PersonalInfo(
  //       persoId: value != null ? value : _addPersonalInfo.persoId,
  //       persoEmail: value != null ? value : _addPersonalInfo.persoEmail,
  //       persoPassword: value != null ? value : _addPersonalInfo.persoPassword,
  //       persoPrice:
  //           value != null ? double.parse(value) : _addPersonalInfo.persoPrice,
  //       persoIconData: value != null ? value : _addPersonalInfo.persoIconData,
  //     );
  //   };
  // }

  // [[SUPER_FORM]]

  void Function(String) _formOnFieldSubmitted({
    FocusNode focusNode,
    bool clearFields,
    // bool unFocus,
    Function savedForm,
  }) {
    return (_) {
      FocusScope.of(context).requestFocus(focusNode);
      savedForm();
      if (clearFields)
        // clearFields() {
        //   _mailController.clear();
        //   _paws1Controller.clear();
        //   _paws2Controller.clear();
        // }

        FocusScope.of(context).unfocus();
      // unFocus ? FocusScope.of(context).unfocus() : null;

      print("----------------------------->FORMFIELDSUBMITTED=");
    };
  }

  void Function(String) _formOnChanged({
    FocusNode focusNode,
    // bool clearFields,
    // bool unFocus,
    Function savedForm,
  }) {
    return (_) {
      FocusScope.of(context).requestFocus(focusNode);
      savedForm();
      // if (clearFields)
      //   clearFields() {
      //     _mailController.clear();
      //     _paws1Controller.clear();
      //     _paws2Controller.clear();
      //   }

      FocusScope.of(context).unfocus();

      print("----------------------------->FORMFIELDCHANGED=");
    };
  }

  // [[SUPER_FORM]]

  Widget _buildTextFormField(
      // String fieldType,
      {
    Key key,
    FieldType fieldType,
    String initialValue,
    FocusNode focusNode,
    TextInputType keyboardType,
    Brightness keyboardAppearance,
    TextInputAction textInputAction,
    // bool obscureText,
    int maxLines,
    int maxLength,
    void Function(String) onFieldSubmitted,
    void Function(String) onChanged,
    void Function(String) onSaved,
    Function onTap,
    TextEditingController controller,
    String labelText,
    String hintText,
    // String errorText,
    TextStyle labelStyle,
    TextStyle hintStyle,
    TextStyle errorStyle,
    Color focusColor,
    EdgeInsetsGeometry contentPadding,
    Widget suffixIcon,
    Widget prefixIcon,
    Widget prefix,
    String prefixText,
    InputBorder focusedBorder,
    InputBorder enabledBorder,
    InputBorder errorBorder,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextFormField(
        key: key,

        // fieldType: OTP
        // obscuringCharacter: fieldType == FieldType.Password ? 'X' : '0*',
        autocorrect: true,
        autofocus: false,
        toolbarOptions: ToolbarOptions(
          copy: true,
          paste: fieldType == FieldType.Password ? false : true,
          selectAll: true,
        ),
        style: fieldType == FieldType.OtpForm
            ? TextStyle(fontSize: 24, color: _kColorWhite)
            : _formHintStyle(),
        // fieldType: OTP
        textAlign:
            fieldType == FieldType.OtpForm ? TextAlign.center : TextAlign.left,
        initialValue:
            controller != null ? controller.text : (initialValue ?? ''),
        enableSuggestions: true,
        maxLines: maxLines != null ? maxLines : 1,
        maxLength: maxLength,
        focusNode: focusNode,
        keyboardAppearance: keyboardAppearance,
        validator: _formValidator(fieldType),
        keyboardType:
            keyboardType != null ? keyboardType : _formKeyboardType(fieldType),
        textInputAction: textInputAction != null
            ? textInputAction
            : _formTextInputAction(fieldType),
        obscureText: fieldType == FieldType.Password ? true : false,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        onSaved: onSaved,
        onTap: onTap,
        controller: controller,
        decoration: InputDecoration(
          focusColor: focusColor,
          labelText: labelText != null ? labelText : _formLabelText(fieldType),
          labelStyle: labelStyle != null ? labelStyle : _formLabelStyle(),
          hintText: hintText != null ? hintText : _formHintText(fieldType),
          hintStyle: hintStyle != null ? hintStyle : _formHintStyle(),
          // errorText: errorText != null ? errorText : _formErrorText(fieldType),
          errorStyle: errorStyle != null ? errorStyle : _formErrorStyle(),
          contentPadding:
              contentPadding != null ? contentPadding : _formContentPadding(),
          suffixIcon:
              suffixIcon != null ? suffixIcon : _formSuffixIcon(fieldType),

          prefix: prefix,
          prefixText: fieldType == FieldType.Phone ? '+228  ' : prefixText,
          prefixStyle: _formHintStyle(),
          prefixIcon: prefixIcon,
          // enabled: ,
          focusedBorder:
              focusedBorder != null ? focusedBorder : _formFocusedBorder(),
          enabledBorder:
              enabledBorder != null ? enabledBorder : _formEnabledBorder(),

          errorBorder: errorBorder != null ? errorBorder : _formErrorBorder(),
          border: focusedBorder != null ? focusedBorder : _formFocusedBorder(),
        ),
      ),
    );
  }

  // [[SUPER_FORM]]

  @override
  void initState() {
    _urlFocusNode.addListener(_updateImage);

    super.initState();
  }

  // [[SUPER_FORM]]

  // fbdw__focusUpdate
  void _updateImage() {
    if (!_urlFocusNode.hasFocus) {
      if (_urlController.text.isEmpty ||
          (!_urlController.text.startsWith('http') &&
                  (!_urlController.text.startsWith('https')) ||
              (!_urlController.text.endsWith('.jpg') &&
                  !_urlController.text.endsWith('.png') &&
                  !_urlController.text.endsWith('.jpeg')))) {
        return;
      }

      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final persoId = ModalRoute.of(context).settings.arguments as String;

      if (persoId != null) {
        final _findPersoId =
            Provider.of<MediaPersonalInfo>(context).findById(persoId);
        _initialValues = {
          'persoEmail': _findPersoId.persoEmail,
          'persoPassword': _findPersoId.persoPassword,
          'persoPrice': _findPersoId.persoPrice.toString(),
          // 'persoIconData': _findPersoId.persoIconData.toString(),
        };

        _urlController.text = _findPersoId.persoIconData.toString();
      }
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  // [[SUPER_FORM]]

  @override
  void dispose() {
    super.dispose();
    // dispose__FocusNode
    _paws1FocusNode.dispose();
    _paws2FocusNode.dispose();

    _lastNameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _otp1FocusNode.dispose();
    _otp2FocusNode.dispose();
    _otp3FocusNode.dispose();
    _otp4FocusNode.dispose();
    _otp5FocusNode.dispose();

    // dispose_TextEditingController
    _paws1Controller.dispose();
    _paws2Controller.dispose();
    _mailController.dispose();
    _urlController.dispose();

    // dispose_Listener
    _urlFocusNode.removeListener(_updateImage);
    _urlFocusNode.dispose();
  }

  // [[SUPER_FORM]]

  Widget _buildContinueButton({
    AuthType authType,
    Function function,
  }) {
    Widget _continueButton(String text) {
      return Column(
        children: [
          RaisedButton(
            color: _kColorWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            onPressed: function,
            child: _buildText(
              text: text,
              style: _kTextButtonStyle,
            ),
          ),
        ],
      );
    }

    switch (authType) {
      case AuthType.SignUp:
        return _continueButton('Sign Up');

        break;
      case AuthType.CompleteProfile:
        return _continueButton('Continue');

        break;
      case AuthType.OTP:
        return _continueButton('Continue');

        break;
      case AuthType.SignIn:
        return _continueButton('Sign In');

        break;
      default:
        return _continueButton('Sign Up');
    }
  }

  // [[SUPER_FORM]]

  Widget _buildIconButton({
    Function function,
    IconData iconData,
  }) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(color: _kColorWhite, shape: BoxShape.circle),
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        onPressed: function,
        child: Center(
          child: Icon(
            iconData,
            color: _kScaffoldBackColor,
          ),
        ),
      ),
    );
  }

  // [[SUPER_FORM]]

  List<Widget> _buildSignText({
    AuthType authType,
  }) {
    List<Widget> _signText({
      String signUpIn,
      String registerAccount,
      String registerDetails,
    }) {
      return [
        Text(
          signUpIn,
          style: _kTextAccountStyle,
        ),
        const SizedBox(height: 40),
        FittedBox(
          child: _buildText(
            text: registerAccount,
            style: _kTextTitleStyle,
          ),
        ),
        const SizedBox(height: 15),
        _buildText(
          text: registerDetails,
          style: _kTextDescStyle,
        ),
        const SizedBox(height: 45),
      ];
    }

    switch (authType) {
      case AuthType.SignUp:
        return _signText(
            signUpIn: 'Sign Up',
            registerAccount: 'Register Account',
            registerDetails:
                'Complete your details or continue with social media');

        break;
      case AuthType.CompleteProfile:
        return _signText(
            signUpIn: 'Sign Up',
            registerAccount: 'Complete Profile',
            registerDetails:
                'Complete your details or continue with social media');

        break;
      case AuthType.OTP:
        return _signText(
            signUpIn: 'OTP',
            registerAccount: 'OTP Verification',
            registerDetails:
                'We send your code to +1 684 23 ...\n This code will expire in 00:22');

        break;
      case AuthType.SignIn:
        return _signText(
            signUpIn: 'Sign In',
            registerAccount: 'Welcome Back',
            registerDetails:
                'Sign In with your email and password or continue with social media');

        break;
      default:
        _signText(
            signUpIn: 'Sign In',
            registerAccount: 'Register Account',
            registerDetails:
                'Complete your details or continue with social media');
    }
    return _signText(
        signUpIn: 'Sign Up',
        registerAccount: 'Register Account',
        registerDetails: 'Complete your details or continue with social media');
  }

  // [[SUPER_FORM]]

  Widget _buildRangeButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildIconButton(
          function: () {},
          iconData: FontAwesomeIcons.google,
        ),
        const SizedBox(width: 20),
        _buildIconButton(
          function: () {},
          iconData: FontAwesomeIcons.facebook,
        ),
        const SizedBox(width: 20),
        _buildIconButton(
          function: () {},
          iconData: FontAwesomeIcons.twitch,
        ),
      ],
    );
  }

  void Function(String) _formValidator(
    FieldType fieldType,
  ) {
    switch (fieldType) {
      case FieldType.Email:
        return (value) {
          final email = RegexPattern.email;
          RegExp regExp = RegExp(email);

          if (!regExp.hasMatch(value)) {
            return 'Please provide a valid Email';
          }
          return null;
        };

        break;
      case FieldType.Price:
        return (value) {
          final price = RegexPattern.numericOnly;
          RegExp regExp = RegExp(price);

          if (!regExp.hasMatch(value)) {
            return 'Please provide a valid Price';
          }
          if (value.isEmpty) {
            return 'Please Enter A Price';
          }
          if (double.tryParse(value) == null) {
            return 'Please enter a valid number';
          }
          if (double.parse(value) <= 0) {
            return 'Please a number greater than 0';
          }
          return null;
        };

        break;
      case FieldType.ImageUrl:
        return (value) {
          final url = RegexPattern.url;
          RegExp regExp = RegExp(url);

          if (!regExp.hasMatch(value)) {
            return 'Please provide a valid Url';
          }
          return null;
        };

        break;
      case FieldType.Date:
        return (value) {
          final date = RegexPattern.basicDateTime;
          RegExp regExp = RegExp(date);

          if (!regExp.hasMatch(value)) {
            return 'Please provide a valid Email';
          }
          return null;
        };

        break;
      case FieldType.Password:
        return (value) {
          final password = RegexPattern.passwordNormal3;
          RegExp regExp = RegExp(password);

          if (!regExp.hasMatch(value)) {
            return '8 Characters minimum: Upper|Lower|Number';
          }
          return null;
        };

        break;
      case FieldType.Phone:
        return (value) {
          // final phone = RegexPattern.phone;
          // RegExp regExp = RegExp(phone);

          // if (!regExp.hasMatch(value)) {
          //   return 'Must Start With: "0", "+55", "(+123)"';
          // }

          if (value.isEmpty) {
            return 'Enter A Number';
          }
          if (int.tryParse(value) == null) {
            return 'Enter a valid number';
          }
          if (int.parse(value) <= 0) {
            return 'Enter a number greater than 0';
          }

          return null;
        };

        break;
      case FieldType.OtpForm:
        return (value) {
          // if (value.isEmpty) {
          //   return '';

          //   // return 'Enter A Number';
          // }
          if (int.parse(value) <= 0) {
            return '';

            // return 'Enter a number greater than 0';
          }

          return null;
        };

        break;
      case FieldType.Description:
        return (value) {
          final username = RegexPattern.username;
          RegExp regExp = RegExp(username);

          if (!regExp.hasMatch(value)) {
            return '3 Minimum Characters - allow "_" and "."  in Name';
          }
          if (value.length < 3) {
            return 'Should Be At Least 8 Characters Long. ';
          }
          return null;
        };

        break;
      default:
    }

    return (value) {
      if (value.isEmpty) {
        return 'Please provide Email';
      }
      return null;
    };
  }

  // FORMS BUILD

  List<Widget> _buildForms(
    AuthType authType,
  ) {
    switch (authType) {

      // SIGN IN
      case AuthType.SignIn:
        return [
          _buildTextFormField(
            key: ValueKey('signIn_email'),
            initialValue: _initialValues['persoEmail'],
            fieldType: FieldType.Email,
            onFieldSubmitted: _formOnFieldSubmitted(focusNode: _paws1FocusNode),
            // controller: _mailController,
            onSaved: (value) {
              _addPersonalInfo = PersonalInfo(
                persoId: _addPersonalInfo.persoId,
                persoPrice: _addPersonalInfo.persoPrice,
                persoEmail: value,
                persoPassword: _addPersonalInfo.persoPassword,
                persoIconData: null,
              );
            },
          ),
          const SizedBox(height: 30),
          _buildTextFormField(
              key: ValueKey('signIn_password'),
              fieldType: FieldType.Password,
              onFieldSubmitted:
                  _formOnFieldSubmitted(savedForm: () => _saveForm()),
              focusNode: _paws1FocusNode,
              // controller: _paws1Controller,
              onSaved: (value) {
                // checkValue == create PersonalInfo
                _addPersonalInfo = PersonalInfo(
                  persoId: _addPersonalInfo.persoId,
                  persoEmail: _addPersonalInfo.persoEmail,
                  persoPrice: _addPersonalInfo.persoPrice,
                  persoPassword: value,
                  persoIconData: null,
                );
              },
              labelText: 'Password',
              hintText: 'Enter your password'
              // validator: (value) {},
              ),
          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: _kColorWhite70, width: 2),
                ),
              ),
              SizedBox(width: 10),
              _buildText(text: 'Remember Me', style: _kTextDescStyle),
              Spacer(),
              _buildTextButton(
                  text: 'Forgot Password',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.lightBlue,
                  )),
            ],
          ),

          SizedBox(height: 35),
          _buildContinueButton(
            authType: _authType2,
            function: () => _saveForm(),
          ),

          SizedBox(height: 38),

          // const SizedBox(height: 48),

          _buildRangeButton(),

          const SizedBox(height: 28),
          _buildRichText(
            authType: _authType2,
          ),
        ];
        break;

      case AuthType.SignUp:
        _buildTextFormField(
          key: ValueKey('signUp_email'),
          initialValue: _initialValues['persoEmail'],
          fieldType: FieldType.Email,
          onFieldSubmitted: _formOnFieldSubmitted(focusNode: _paws1FocusNode),
          onSaved: (value) {
            _addPersonalInfo = PersonalInfo(
              persoId: _addPersonalInfo.persoId,
              persoPrice: _addPersonalInfo.persoPrice,
              persoEmail: value,
              persoPassword: _addPersonalInfo.persoPassword,
              persoIconData: null,
            );
          },
        );
        const SizedBox(height: 12);
        _buildTextFormField(
          key: ValueKey('signUp_password1'),

          fieldType: FieldType.Password,
          onFieldSubmitted: _formOnFieldSubmitted(focusNode: _paws2FocusNode),
          focusNode: _formFocusNode(_paws1FocusNode),
          // controller: _paws1Controller,
          onSaved: (value) {
            // checkValue == create PersonalInfo
            _addPersonalInfo = PersonalInfo(
              persoId: _addPersonalInfo.persoId,
              persoEmail: _addPersonalInfo.persoEmail,
              persoPrice: _addPersonalInfo.persoPrice,
              persoPassword: value,
              persoIconData: null,
            );
          },
          // validator: (value) {},
        );
        const SizedBox(height: 12);

        _buildTextFormField(
          key: ValueKey('signUp_password2'),

          fieldType: FieldType.Password,
          onFieldSubmitted: _formOnFieldSubmitted(savedForm: () => _saveForm()),
          focusNode: _formFocusNode(_paws2FocusNode),
          labelText: 'Confirm Password',
          hintText: 'Re-enter your password',
          onSaved: (value) {
            // checkValue == create PersonalInfo
            _addPersonalInfo = PersonalInfo(
              persoId: _addPersonalInfo.persoId,
              persoEmail: _addPersonalInfo.persoEmail,
              persoPrice: _addPersonalInfo.persoPrice,
              persoPassword: value,
              persoIconData: null,
            );
          },
          // validator: (value) {},
        );
        SizedBox(height: 33);
        _buildContinueButton(
          authType: _authType2,
          function: () => _saveForm(),
        );

        SizedBox(height: 30);

        // const SizedBox(height: 48),

        _buildRangeButton();

        const SizedBox(height: 33);
        _buildRichText(
          authType: _authType2,
        );

        break;

      // COMPLETE PROFILE
      case AuthType.CompleteProfile:
        return [
          _buildTextFormField(
            key: ValueKey('profile_firstName'),
            fieldType: FieldType.Description,
            onFieldSubmitted:
                _formOnFieldSubmitted(focusNode: _lastNameFocusNode),
            labelText: 'First Name',
            hintText: 'Enter Your First Name',
            onSaved: (value) {
              _addPersonalInfo = PersonalInfo(
                persoId: _addPersonalInfo.persoId,
                persoPrice: _addPersonalInfo.persoPrice,
                persoEmail: _addPersonalInfo.persoEmail,
                persoPassword: value,
                persoIconData: null,
              );
            },
          ),
          const SizedBox(height: 12),
          _buildTextFormField(
            key: ValueKey('profile_lastName'),
            fieldType: FieldType.Description,
            onFieldSubmitted:
                _formOnFieldSubmitted(focusNode: _phoneNumberFocusNode),
            focusNode: _formFocusNode(_lastNameFocusNode),
            labelText: 'Last Name',
            hintText: 'Enter Your Last Name',
            onSaved: (value) {
              _addPersonalInfo = PersonalInfo(
                persoId: _addPersonalInfo.persoId,
                persoPrice: _addPersonalInfo.persoPrice,
                persoEmail: _addPersonalInfo.persoEmail,
                persoPassword: value,
                persoIconData: null,
              );
            },
          ),
          const SizedBox(height: 12),
          _buildTextFormField(
            key: ValueKey('profile_phoneNumber'),
            fieldType: FieldType.Phone,
            focusNode: _formFocusNode(_phoneNumberFocusNode),
            onFieldSubmitted: _formOnFieldSubmitted(
              savedForm: () => _saveForm(),
            ),
            labelText: 'Phone Number',
            hintText: 'Your Phone Number',
            onSaved: (value) {
              _addPersonalInfo = PersonalInfo(
                persoId: _addPersonalInfo.persoId,
                persoEmail: _addPersonalInfo.persoEmail,
                persoPrice: double.parse(value),
                persoPassword: _addPersonalInfo.persoPassword,
                persoIconData: null,
              );
            },
          ),
          // const SizedBox(height: 12),
          // _buildTextFormField(
          //   fieldType: FieldType.Address,
          //   onFieldSubmitted: _formOnFieldSubmitted(
          //     savedForm: () => _saveForm(),
          //   ),
          //   onSaved: (value) {
          //     _addPersonalInfo = PersonalInfo(
          //       persoId: _addPersonalInfo.persoId,
          //       persoEmail: _addPersonalInfo.persoEmail,
          //       persoPrice: double.parse(value),
          //       persoPassword: _addPersonalInfo.persoPassword,
          //       persoIconData: null,
          //     );
          //   },
          // ),
          SizedBox(height: 28),
          _buildContinueButton(
            authType: _authType2,
            function: () {
              _saveForm();
            },
          ),

          SizedBox(height: 25),

          // const SizedBox(height: 48),

          _buildRangeButton(),

          const SizedBox(height: 28),
          _buildRichText(
            authType: _authType2,
          ),
        ];
        break;
      case AuthType.OTP:
        return [
          SizedBox(height: 40),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 60,
                child: _buildTextFormField(
                  key: ValueKey('otp_phone1'),
                  fieldType: FieldType.OtpForm,
                  onChanged: _formOnChanged(focusNode: _otp1FocusNode),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorRedSahde200,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),

                  // initialValue: _initialValues['persoPrice'],

                  // controller: _paws2Controller,

                  onSaved: (value) {
                    _addPersonalInfo = PersonalInfo(
                      persoId: _addPersonalInfo.persoId,
                      persoEmail: _addPersonalInfo.persoEmail,
                      persoPrice: double.parse(value),
                      persoPassword: _addPersonalInfo.persoPassword,
                      persoIconData: null,
                    );
                  },
                  onFieldSubmitted: _formOnFieldSubmitted(
                    savedForm: () => _saveForm(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 60,
                child: _buildTextFormField(
                  key: ValueKey('otp_phone2'),
                  fieldType: FieldType.OtpForm,
                  focusNode: _otp1FocusNode,
                  onChanged: _formOnChanged(focusNode: _otp2FocusNode),
                  // print_fieldType__FieldSubmitted
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorRedSahde200,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),

                  onSaved: (value) {
                    _addPersonalInfo = PersonalInfo(
                      persoId: _addPersonalInfo.persoId,
                      persoEmail: _addPersonalInfo.persoEmail,
                      persoPrice: double.parse(value),
                      persoPassword: _addPersonalInfo.persoPassword,
                      persoIconData: null,
                    );
                  },
                  onFieldSubmitted: _formOnFieldSubmitted(
                    savedForm: () => _saveForm(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 60,
                child: _buildTextFormField(
                  key: ValueKey('otp_phone3'),

                  onChanged: _formOnChanged(focusNode: _otp3FocusNode),
                  focusNode: _otp2FocusNode,
                  fieldType: FieldType.OtpForm,
                  // print_fieldType__FieldSubmitted
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorRedSahde200,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),

                  onSaved: (value) {
                    _addPersonalInfo = PersonalInfo(
                      persoId: _addPersonalInfo.persoId,
                      persoEmail: _addPersonalInfo.persoEmail,
                      persoPrice: double.parse(value),
                      persoPassword: _addPersonalInfo.persoPassword,
                      persoIconData: null,
                    );
                  },
                  onFieldSubmitted: _formOnFieldSubmitted(
                    savedForm: () => _saveForm(),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 60,
                child: _buildTextFormField(
                  key: ValueKey('otp_phone3'),

                  focusNode: _otp3FocusNode,
                  onChanged: _formOnChanged(focusNode: _otp4FocusNode),
                  fieldType: FieldType.OtpForm,
                  // print_fieldType__FieldSubmitted
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorRedSahde200,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),

                  onSaved: (value) {
                    _addPersonalInfo = PersonalInfo(
                      persoId: _addPersonalInfo.persoId,
                      persoEmail: _addPersonalInfo.persoEmail,
                      persoPrice: double.parse(value),
                      persoPassword: _addPersonalInfo.persoPassword,
                      persoIconData: null,
                    );
                  },
                  onFieldSubmitted: _formOnFieldSubmitted(
                      // savedForm: () => _saveForm(),
                      ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 60,
                child: _buildTextFormField(
                  key: ValueKey('otp_phone4'),

                  focusNode: _otp4FocusNode,
                  onChanged: _formOnChanged(savedForm: () => _saveForm()),
                  fieldType: FieldType.OtpForm,
                  // print_fieldType__FieldSubmitted
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorRedSahde200,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: _kColorWhite70,
                    ),
                  ),

                  onSaved: (value) {
                    _addPersonalInfo = PersonalInfo(
                      persoId: _addPersonalInfo.persoId,
                      persoEmail: _addPersonalInfo.persoEmail,
                      persoPrice: double.parse(value),
                      persoPassword: _addPersonalInfo.persoPassword,
                      persoIconData: null,
                    );
                  },
                  // onFieldSubmitted: _formOnFieldSubmitted(
                  //   savedForm: () => _saveForm(),
                  // ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 130),
          _buildContinueButton(
            authType: _authType2,
            function: () {
              _saveForm();
            },
          ),

          SizedBox(height: 40),

          // const SizedBox(height: 48),

          _buildRangeButton(),

          const SizedBox(height: 40),
          _buildRichText(
            authType: _authType2,
          ),
        ];
        break;
      default:
    }
    return [
      _buildTextFormField(
        key: ValueKey('signIn_email'),
        initialValue: _initialValues['persoEmail'],
        fieldType: FieldType.Email,
        onFieldSubmitted: _formOnFieldSubmitted(focusNode: _paws1FocusNode),
        // controller: _mailController,
        // validator: (value) {
        //   if (value.isEmpty) {
        //     return 'Please provide Email';
        //   }
        //   return null;
        // },
        onSaved: (value) {
          _addPersonalInfo = PersonalInfo(
            persoId: _addPersonalInfo.persoId,
            persoPrice: _addPersonalInfo.persoPrice,
            persoEmail: value,
            persoPassword: _addPersonalInfo.persoPassword,
            persoIconData: null,
          );
        },
      ),
      const SizedBox(height: 30),
      _buildTextFormField(
          key: ValueKey('signIn_password'),
          fieldType: FieldType.Password,
          onFieldSubmitted: _formOnFieldSubmitted(savedForm: () => _saveForm()),
          focusNode: _paws1FocusNode,
          // controller: _paws1Controller,
          onSaved: (value) {
            // checkValue == create PersonalInfo
            _addPersonalInfo = PersonalInfo(
              persoId: _addPersonalInfo.persoId,
              persoEmail: _addPersonalInfo.persoEmail,
              persoPrice: _addPersonalInfo.persoPrice,
              persoPassword: value,
              persoIconData: null,
            );
          },
          labelText: 'Password',
          hintText: 'Enter your password'
          // validator: (value) {},
          ),
      const SizedBox(height: 25),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(color: _kColorWhite70, width: 2),
            ),
          ),
          SizedBox(width: 10),
          _buildText(text: 'Remember Me', style: _kTextDescStyle),
          Spacer(),
          _buildTextButton(
              text: 'Forgot Password',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.lightBlue,
              )),
        ],
      ),

      SizedBox(height: 35),
      _buildContinueButton(
        authType: _authType2,
        function: () => _saveForm(),
      ),

      SizedBox(height: 38),

      // const SizedBox(height: 48),

      _buildRangeButton(),

      const SizedBox(height: 28),
      _buildRichText(
        authType: _authType2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // build reRendersUI of the apps. Don't use properties and methods here cause will be reset by the app! [appBarSize_use] [isLandscape_use]
    print('reBuilds AuthForm()');
    return Scaffold(
      backgroundColor: _kScaffoldBackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ..._buildSignText(authType: _authType2),

                ..._buildForms(_authType2),

                // _buildTextFormField(
                //   fieldType: FieldType.Price,
                //   // print_fieldType__FieldSubmitted

                //   // initialValue: _initialValues['persoPrice'],

                //   // controller: _paws2Controller,
                //   validator: (value) {
                //     if (value.isEmpty) {
                //       return 'Please Enter A Price';
                //     }
                //     if (double.tryParse(value) == null) {
                //       return 'Please enter a valid number';
                //     }
                //     if (double.parse(value) <= 0) {
                //       return 'Please a number greater than 0';
                //     }
                //     return null;
                //   },
                //   onSaved: (value) {
                //     _addPersonalInfo = PersonalInfo(
                //       persoId: _addPersonalInfo.persoId,
                //       persoEmail: _addPersonalInfo.persoEmail,
                //       persoPrice: double.parse(value),
                //       persoPassword: _addPersonalInfo.persoPassword,
                //       persoIconData: null,
                //     );
                //   },
                //   onFieldSubmitted: _formOnFieldSubmitted(
                //     savedForm: () => _saveForm(),
                //   ),
                // ),
                // const SizedBox(height: 12),

                // Row(
                //   children: <Widget>[
                //     Container(
                //       margin: EdgeInsets.only(left: 4, right: 10),
                //       height: 80,
                //       width: 120,
                //       decoration: BoxDecoration(
                //           border: Border.all(
                //             width: 2,
                //             color: Colors.white70,
                //           ),
                //           borderRadius: BorderRadius.circular(20)),
                //       child: _urlController.text.isEmpty
                //           ? Center(
                //               child: Text(
                //                 'Enter ImageUrl',
                //                 style: TextStyle(
                //                   fontSize: 16,
                //                   fontFamily: 'Poppins',
                //                   letterSpacing: .4,
                //                   fontWeight: FontWeight.w600,
                //                 ),
                //               ),
                //             )
                //           : Image.asset('assets/dry.png', fit: BoxFit.cover),
                //     ),
                //     Expanded(
                //       child: _buildTextFormField(
                //         initialValue: _initialValues['imageUrl'],
                //         onFieldSubmitted: _formOnFieldSubmitted(
                //           savedForm: () => _saveForm(),
                //         ),
                //         focusNode: _urlFocusNode,
                //         validator: (value) {
                //           if (value.isEmpty) {
                //             return 'Enter An Image ImageUrl';
                //           }

                //           // regExp__pattern
                //           if (!value.startsWith('http') &&
                //               !value.startsWith('https')) {
                //             return 'Please Enter A Valid ImageUrl';
                //           }
                //           if (!value.endsWith('.png') &&
                //               !value.endsWith('.jpg')) {
                //             return 'Please Enter A Valid Image ImageUrl';
                //           }
                //           return null;
                //         },
                //         onSaved: (value) {
                //           _addPersonalInfo = PersonalInfo(
                //             persoId: value,
                //             persoPrice: _addPersonalInfo.persoPrice,
                //             persoEmail: _addPersonalInfo.persoEmail,
                //             persoPassword: _addPersonalInfo.persoPassword,
                //             persoIconData: null,
                //           );
                //         },
                //         // controller: _urlController,
                //         fieldType: FieldType.ImageUrl,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
