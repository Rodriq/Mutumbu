import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'uak9mxod': {
      'en': 'Mutumbu',
      'fr': 'Mutumbu',
    },
    'mi708eba': {
      'en': 'Create Your Sound',
      'fr': 'Créez votre son',
    },
    'bzq1f5m9': {
      'en': 'Transform your ideas into music with AI',
      'fr': 'Transformez vos idées en musique grâce à l\'IA',
    },
    's4vrzhoi': {
      'en': 'Humming to Lyrics',
      'fr': 'Fredonner les paroles',
    },
    '1pn4z2vt': {
      'en': 'Hum your melody, we\'ll create the track',
      'fr': 'Fredonne ta mélodie, on créera le morceau',
    },
    'tfsipkse': {
      'en': 'Prompt/Lyrics to Music',
      'fr': 'Paroles/Invite sur la musique',
    },
    'zot8f6ai': {
      'en': 'Turn your words into melodies',
      'fr': 'Transformez vos mots en mélodies',
    },
    'ty8gdhyo': {
      'en': 'Song Review',
      'fr': 'Critique de chanson',
    },
    '92ysfi2u': {
      'en': 'Get AI-powered feedback on your music',
      'fr': 'Obtenez des retours musicaux basés sur l\'IA',
    },
    'kvu1vseb': {
      'en': 'Developed by team ',
      'fr': 'Développé par l\'équipe',
    },
    's4zzzivq': {
      'en': 'NCS',
      'fr': 'NCS',
    },
    'khf74i02': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Lyrics
  {
    'ayvage18': {
      'en': 'TextField',
      'fr': 'Champ de texte',
    },
    'qcustqbr': {
      'en': 'Generate Music Now',
      'fr': 'Générez de la musique maintenant',
    },
    'oqddl9lw': {
      'en': 'Generating your song, Please stand by :)',
      'fr': 'Génération de votre chanson, veuillez patienter :)',
    },
    'd83k069j': {
      'en': 'Review & Generate',
      'fr': 'Examiner et générer',
    },
    'rds5u04k': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // PromptLyrics
  {
    'u6vcz9su': {
      'en': 'Prompt/Lyrics to Music',
      'fr': 'Paroles/Invite sur la musique',
    },
    '16qs07wy': {
      'en': 'Generate',
      'fr': 'Générer',
    },
    'wf1jap9f': {
      'en': 'What\'s your song about?',
      'fr': 'De quoi parle votre chanson ?',
    },
    'yvestevt': {
      'en': 'Decribe your song idea here',
      'fr': 'Décrivez ici votre idée de chanson',
    },
    'fq2et4bv': {
      'en': 'Genre Tags',
      'fr': 'Étiquettes de genre',
    },
    'g8un1mr5': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    '8kgwfcp4': {
      'en': 'Option 2',
      'fr': 'Option 2',
    },
    '7ysqblcq': {
      'en': 'Option 3',
      'fr': 'Option 3',
    },
    'dyuw17hw': {
      'en': 'Language',
      'fr': 'Langue',
    },
    '25ow70e8': {
      'en': 'English',
      'fr': 'Anglais',
    },
    '1jgi2wjl': {
      'en': 'French',
      'fr': 'Français',
    },
    'qala9j3d': {
      'en': 'Pidgin',
      'fr': 'Sabir',
    },
    '14kxhcrv': {
      'en': 'Song idea or desscription required',
      'fr': 'Idée ou description de chanson requise',
    },
    'talrz4t3': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans le menu déroulant.',
    },
    '185bheq8': {
      'en': 'Lyrics',
      'fr': 'Paroles',
    },
    'emk370ii': {
      'en': 'Enter Your Lyrics',
      'fr': 'Entrez vos paroles',
    },
    '5wevdhks': {
      'en': 'Write your lyrics here...',
      'fr': 'Écrivez vos paroles ici...',
    },
    'nmbnvj9t': {
      'en': 'Genre Tags',
      'fr': 'Étiquettes de genre',
    },
    '5obqz322': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'bz2t6bqu': {
      'en': 'Option 2',
      'fr': 'Option 2',
    },
    'hikjdelu': {
      'en': 'Option 3',
      'fr': 'Option 3',
    },
    'wrk0vnet': {
      'en': 'Generate Music',
      'fr': 'Générer de la musique',
    },
    'mdt0p7wk': {
      'en': 'Song Generation in Progress, Please hold :)',
      'fr': 'Génération de chansons en cours, veuillez patienter :)',
    },
    'wqsz4xx8': {
      'en': 'Generating your pefect lyrics...',
      'fr': 'Générer vos paroles parfaites...',
    },
    '9vaa2g8m': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // SongReview
  {
    '4175q4lm': {
      'en': 'Get Reviewed',
      'fr': 'Obtenez une évaluation',
    },
    '3u5wxhtg': {
      'en': 'Upload Your Song',
      'fr': 'Téléchargez votre chanson',
    },
    '3ydc1ce7': {
      'en': 'Get Professional AI-Powered feedback on your musisc',
      'fr':
          'Obtenez des commentaires professionnels basés sur l\'IA sur votre musique',
    },
    '1r08mxzm': {
      'en': 'Pick a song',
      'fr': 'Choisissez une chanson',
    },
    'jsnpmtml': {
      'en': 'or click to browse',
      'fr': 'ou cliquez pour parcourir',
    },
    'dan8vg55': {
      'en': 'supported: MP3, WAV, M4A (Max 20MB)',
      'fr': 'Formats pris en charge : MP3, WAV, M4A (20 Mo max.)',
    },
    't4hqh1vg': {
      'en': 'Sound Selected',
      'fr': 'Son sélectionné',
    },
    '760vg2dn': {
      'en':
          'You are one step closer to getting an expert opinion. Click below to continue',
      'fr':
          'Vous êtes à un pas d\'obtenir l\'avis d\'un expert. Cliquez ci-dessous pour continuer.',
    },
    'i3hrahmw': {
      'en': 'Get AI Review',
      'fr': 'Obtenez un avis sur l\'IA',
    },
    'hffiu7yg': {
      'en': 'Analyzing your song, please hold :)',
      'fr': 'Analyse de votre chanson en cours, veuillez patienter :)',
    },
    'mt84adtg': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Humm
  {
    'nypd8zyk': {
      'en': 'Humming to Music',
      'fr': 'Fredonner sur de la musique',
    },
    'mh5ytj15': {
      'en': 'Start Humming',
      'fr': 'Commencez à fredonner',
    },
    'lx66kiuv': {
      'en': 'Tap the button and hum your melody',
      'fr': 'Appuyez sur le bouton et fredonnez votre mélodie.',
    },
    'ebh72vpb': {
      'en': 'Genre Tags',
      'fr': 'Étiquettes de genre',
    },
    'yylrk91n': {
      'en': 'Craft better',
      'fr': 'Fabriquer mieux',
    },
    '19c3utbg': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    'kpuqpa14': {
      'en': 'Option 2',
      'fr': 'Option 2',
    },
    'x4hf85eh': {
      'en': 'Option 3',
      'fr': 'Option 3',
    },
    'ttudl78g': {
      'en': 'Add notes (Optional)',
      'fr': 'Ajouter des notes (facultatif)',
    },
    'c7a8jz5x': {
      'en': 'Describe your Melody',
      'fr': 'Décrivez votre mélodie',
    },
    'vyd5x13r': {
      'en': 'Generate Lyrics',
      'fr': 'Générer des paroles',
    },
    '4ekl3wu5': {
      'en': 'Generating the perfecr Lyrics for you...',
      'fr': 'Générer les paroles parfaites pour vous...',
    },
    'wujpig9d': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // SongFeedback
  {
    'hizox7e0': {
      'en': 'Get Reviewed',
      'fr': 'Obtenez une évaluation',
    },
    '480igtja': {
      'en': 'Your Music Feedback is Here',
      'fr': 'Vos commentaires musicaux sont ici',
    },
    'wpun108i': {
      'en': 'Review and improve your sound',
      'fr': 'Examinez et améliorez votre son',
    },
    '798jwkzz': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // PlayMusic
  {
    'ydn3golr': {
      'en': 'Your Music',
      'fr': 'Votre musique',
    },
    'v8u7ou8d': {
      'en': 'Download Track',
      'fr': 'Télécharger le morceau',
    },
    'wel21hy0': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Miscellaneous
  {
    'e6on74v1': {
      'en': 'Option 1',
      'fr': 'Option 1',
    },
    '6kz56m5h': {
      'en': 'Option 2',
      'fr': 'Option 2',
    },
    '1r0m9lvr': {
      'en': 'Option 3',
      'fr': 'Option 3',
    },
    's6ljqb8k': {
      'en': 'Home',
      'fr': 'Maison',
    },
    'w0tcaodm': {
      'en': 'Home',
      'fr': 'Maison',
    },
    's9gsp6dm': {
      'en': 'Home',
      'fr': 'Maison',
    },
    '2u0klb3b': {
      'en': 'Button',
      'fr': 'Bouton',
    },
    '3x6s02mz': {
      'en': 'Allow access to microphone',
      'fr': 'Autoriser l\'accès au microphone',
    },
    '1kx89rqi': {
      'en': 'Needs access to Library',
      'fr': 'Besoin d\'accéder à la bibliothèque',
    },
    'gg48utsx': {
      'en': '',
      'fr': '',
    },
    '4qnnreip': {
      'en': '',
      'fr': '',
    },
    '0kbgv8e8': {
      'en': '',
      'fr': '',
    },
    'f544d4md': {
      'en': '',
      'fr': '',
    },
    'be0xee49': {
      'en': '',
      'fr': '',
    },
    'cy8q1a2o': {
      'en': '',
      'fr': '',
    },
    '4uzekem9': {
      'en': '',
      'fr': '',
    },
    'ahd9ff8y': {
      'en': '',
      'fr': '',
    },
    'j89ofksj': {
      'en': '',
      'fr': '',
    },
    'pb61b1sg': {
      'en': '',
      'fr': '',
    },
    'y6yca9g3': {
      'en': '',
      'fr': '',
    },
    'nth3mqac': {
      'en': '',
      'fr': '',
    },
    'ary4qmwq': {
      'en': '',
      'fr': '',
    },
    'p3asitgz': {
      'en': '',
      'fr': '',
    },
    'ct0l4sbx': {
      'en': '',
      'fr': '',
    },
    'ds2fj685': {
      'en': '',
      'fr': '',
    },
    'en3br4i3': {
      'en': '',
      'fr': '',
    },
    '38h2nzzr': {
      'en': '',
      'fr': '',
    },
    '6yxq680d': {
      'en': '',
      'fr': '',
    },
    'vh82gema': {
      'en': '',
      'fr': '',
    },
    'gzt0vlpp': {
      'en': '',
      'fr': '',
    },
    'qisn2w82': {
      'en': '',
      'fr': '',
    },
    'fgim2juk': {
      'en': '',
      'fr': '',
    },
    'f7vfhe13': {
      'en': '',
      'fr': '',
    },
    'syl791fi': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
