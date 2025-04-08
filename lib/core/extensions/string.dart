import 'dart:math';

import 'intouch_utills.dart';
import 'package:url_launcher/url_launcher.dart';

enum PasswordStrength {
  notValid,
  weak,
  medium,
  strong,
}

extension GetStringUtils on String {
  /// Discover if the String is a valid number
  bool get isNum => InTouchUtils.isNum(this);

  /// Discover if the String is numeric only
  bool get isNumericOnly => InTouchUtils.isNumericOnly(this);

  String numericOnly({bool firstWordOnly = false}) =>
      InTouchUtils.numericOnly(this, firstWordOnly: firstWordOnly);

  ///Method that that takes a[String] password and returns it's strength from 0 to 8 as 8 is the highest
  int measurePasswordStrength() {
    // Define the criteria for each strength level
    final hasLowercase = RegExp(r'[a-z]').hasMatch(this);
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(this);
    final hasDigits = RegExp(r'\d').hasMatch(this);
    final hasSpecialChars = RegExp(r'[!@#\$%\^&\*]').hasMatch(this);

    int points = 0;

    if (length < 8) {
      points += 1;
    } else if (length < 12) {
      points += 3;
    } else {
      points += 4;
    }

    if (hasLowercase) {
      points += 1;
    }
    if (hasUppercase) {
      points += 1;
    }
    if (hasDigits) {
      points += 1;
    }
    if (hasSpecialChars) {
      points += 1;
    }

    return points;
  }

  /// Discover if the String is alphanumeric only
  bool get isAlphabetOnly => InTouchUtils.isAlphabetOnly(this);

  /// Discover if the String is a boolean
  bool get isBool => InTouchUtils.isBool(this);

  /// Discover if the String is a vector
  bool get isVectorFileName => InTouchUtils.isVector(this);

  /// Discover if the String is a ImageFileName
  bool get isImageFileName => InTouchUtils.isImage(this);

  /// Discover if the String is a AudioFileName
  bool get isAudioFileName => InTouchUtils.isAudio(this);

  /// Discover if the String is a VideoFileName
  bool get isVideoFileName => InTouchUtils.isVideo(this);

  /// Discover if the String is a TxtFileName
  bool get isTxtFileName => InTouchUtils.isTxt(this);

  /// Discover if the String is a Document Word
  bool get isDocumentFileName => InTouchUtils.isWord(this);

  /// Discover if the String is a Document Excel
  bool get isExcelFileName => InTouchUtils.isExcel(this);

  /// Discover if the String is a Document Powerpoint
  bool get isPPTFileName => InTouchUtils.isPPT(this);

  /// Discover if the String is a APK File
  bool get isAPKFileName => InTouchUtils.isAPK(this);

  /// Discover if the String is a PDF file
  bool get isPDFFileName => InTouchUtils.isPDF(this);

  /// Discover if the String is a HTML file
  bool get isHTMLFileName => InTouchUtils.isHTML(this);

  /// Discover if the String is a URL file
  bool get isURL => InTouchUtils.isURL(this);

  /// Discover if the String is a Email
  bool get isEmail => InTouchUtils.isEmail(this);

  /// Discover if the String is a Phone Number
  bool get isPhoneNumber => InTouchUtils.isPhoneNumber(this);

  /// Discover if the String is a DateTime
  bool get isDateTime => InTouchUtils.isDateTime(this);

  /// Discover if the String is a MD5 Hash
  bool get isMD5 => InTouchUtils.isMD5(this);

  /// Discover if the String is a SHA1 Hash
  bool get isSHA1 => InTouchUtils.isSHA1(this);

  /// Discover if the String is a SHA256 Hash
  bool get isSHA256 => InTouchUtils.isSHA256(this);

  /// Discover if the String is a bynary value
  bool get isBinary => InTouchUtils.isBinary(this);

  /// Discover if the String is a ipv4
  bool get isIPv4 => InTouchUtils.isIPv4(this);

  bool get isIPv6 => InTouchUtils.isIPv6(this);

  /// Discover if the String is a Hexadecimal
  bool get isHexadecimal => InTouchUtils.isHexadecimal(this);

  /// Discover if the String is a palindrom
  bool get isPalindrom => InTouchUtils.isPalindrom(this);

  /// Discover if the String is a passport number
  bool get isPassport => InTouchUtils.isPassport(this);

  /// Discover if the String is a currency
  bool get isCurrency => InTouchUtils.isCurrency(this);

  /// Discover if the String is a CPF number
  bool get isCpf => InTouchUtils.isCpf(this);

  /// Discover if the String is a CNPJ number
  bool get isCnpj => InTouchUtils.isCnpj(this);

  /// Discover if the String is a case insensitive
  bool isCaseInsensitiveContains(String b) =>
      InTouchUtils.isCaseInsensitiveContains(this, b);

  /// Discover if the String is a case sensitive and contains any value
  bool isCaseInsensitiveContainsAny(String b) =>
      InTouchUtils.isCaseInsensitiveContainsAny(this, b);

  /// capitalize the String
  String? get capitalize => InTouchUtils.capitalize(this);

  /// Capitalize the first letter of the String
  String? get capitalizeFirst => InTouchUtils.capitalizeFirst(this);

  /// remove all whitespace from the String
  String get removeAllWhitespace => InTouchUtils.removeAllWhitespace(this);

  /// converter the String
  String? get camelCase => InTouchUtils.camelCase(this);

  /// Discover if the String is a valid URL
  String? get paramCase => InTouchUtils.paramCase(this);

  /// add segments to the String
  String createPath([Iterable? segments]) {
    final path = startsWith('/') ? this : '/$this';
    return InTouchUtils.createPath(path, segments);
  }

  /// capitalize only first letter in String words to upper case
  String capitalizeAllWordsFirstLetter() =>
      InTouchUtils.capitalizeAllWordsFirstLetter(this);
}

extension StringExtension on String {
  String get capitalize =>
      isNotEmpty ? this[0].toUpperCase() + substring(1) : this;
}

extension HexString on String {
  int toHex() => int.parse(replaceAll('#', '0xff'));
}

extension DurationExtensions on Duration {
  String toHoursMinutes() {
    String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes";
  }

  String toHoursMinutesSeconds() {
    String twoDigitMinutes = _toTwoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _toTwoDigits(inSeconds.remainder(60));
    return "${_toTwoDigits(inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  String _toTwoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }
}

///Get timing duration
String getTimer(DateTime from, DateTime to) {
  final duration = to.difference(from);
  String twoDigits(int n) => n.toString().padLeft(2, '');
  final hours = "${twoDigits(duration.inHours)}hr";
  final minutes = "${twoDigits(duration.inMinutes.remainder(60))}min";
  final seconds = "${twoDigits(duration.inSeconds.remainder(60))}sec";
  return [if (duration.inHours > 0) hours, minutes, seconds].join(' ');
}

//Capitalize first letter of a word
String cfl(String str) {
  if (str.isEmpty) return str;
  if (str.length == 1) return str.toUpperCase();
  return str[0].toUpperCase() + str.substring(1).toLowerCase();
}

String generateRandomUsername() {
  final random = Random();
  final suffix = random.nextInt(10000);
  const letters = 'abcdefghijklmnopqrstuvwxyz';
  final username =
      '${letters[random.nextInt(26)]}${letters[random.nextInt(26)]}$suffix';
  return username;
}

void openGmailApp() async {
  const url = "https://mail.google.com/mail/u/0/#inbox";

  // Check if the Gmail app is installed
  if (await canLaunchUrl(Uri.parse(url))) {
    // Launch the Gmail app
    await launchUrl(Uri.parse(url));
  } else {
    // Gmail app is not installed, handle the error
    throw 'Gmail app is not installed.';
  }
}
