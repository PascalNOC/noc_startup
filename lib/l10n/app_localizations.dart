import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// No description provided for @startupName.
  ///
  /// In en, this message translates to:
  /// **'NOC'**
  String get startupName;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @solutions.
  ///
  /// In en, this message translates to:
  /// **'Our Solutions'**
  String get solutions;

  /// No description provided for @partners.
  ///
  /// In en, this message translates to:
  /// **'Our Partners'**
  String get partners;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to our startup'**
  String get welcome;

  /// No description provided for @rejoindre.
  ///
  /// In en, this message translates to:
  /// **'Join Us'**
  String get rejoindre;

  /// No description provided for @accueil_txt1.
  ///
  /// In en, this message translates to:
  /// **'Our startup supports businesses, public organizations, and individuals in their digital transformation through intelligent and sustainable solutions.'**
  String get accueil_txt1;

  /// No description provided for @chiffres.
  ///
  /// In en, this message translates to:
  /// **'Key figures'**
  String get chiffres;

  /// No description provided for @project.
  ///
  /// In en, this message translates to:
  /// **'projects'**
  String get project;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'users'**
  String get user;

  /// No description provided for @accueil_txt2.
  ///
  /// In en, this message translates to:
  /// **'Innovative solutions to support your growth and digital transformation.'**
  String get accueil_txt2;

  /// No description provided for @partners_txt.
  ///
  /// In en, this message translates to:
  /// **'We collaborate with universities, companies, NGOs and institutions to develop innovative solutions.'**
  String get partners_txt;

  /// No description provided for @partnersdescript.
  ///
  /// In en, this message translates to:
  /// **'Would you like to develop an innovative project with us?\nLet\'s build tomorrow\'s solutions together.'**
  String get partnersdescript;

  /// No description provided for @agricultor.
  ///
  /// In en, this message translates to:
  /// **'Farmers'**
  String get agricultor;

  /// No description provided for @agricultordescript.
  ///
  /// In en, this message translates to:
  /// **'Smart Agriculture'**
  String get agricultordescript;

  /// No description provided for @eleveurs.
  ///
  /// In en, this message translates to:
  /// **'Livestock'**
  String get eleveurs;

  /// No description provided for @eleveursdescript.
  ///
  /// In en, this message translates to:
  /// **'Connected Poultry Farms'**
  String get eleveursdescript;

  /// No description provided for @boutiques.
  ///
  /// In en, this message translates to:
  /// **'Shops'**
  String get boutiques;

  /// No description provided for @boutiquesdescript.
  ///
  /// In en, this message translates to:
  /// **'Connected Retail Stores'**
  String get boutiquesdescript;

  /// No description provided for @smartcities.
  ///
  /// In en, this message translates to:
  /// **'Smart Cities'**
  String get smartcities;

  /// No description provided for @smartcitiesdescript.
  ///
  /// In en, this message translates to:
  /// **'Connected and Intelligent Cities'**
  String get smartcitiesdescript;

  /// No description provided for @grandspace.
  ///
  /// In en, this message translates to:
  /// **'Large-Scale Solutions'**
  String get grandspace;

  /// No description provided for @grandespacedescript.
  ///
  /// In en, this message translates to:
  /// **'Tailored solutions for your daily needs'**
  String get grandespacedescript;

  /// No description provided for @populationServices.
  ///
  /// In en, this message translates to:
  /// **'Citizen Services'**
  String get populationServices;

  /// No description provided for @populationServicesdescript.
  ///
  /// In en, this message translates to:
  /// **'Innovative solutions serving the public'**
  String get populationServicesdescript;

  /// No description provided for @gov.
  ///
  /// In en, this message translates to:
  /// **'Government Solutions'**
  String get gov;

  /// No description provided for @govdescription.
  ///
  /// In en, this message translates to:
  /// **'Digital and environmentally friendly solutions for governments'**
  String get govdescription;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get year;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Countries'**
  String get country;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s build the future together'**
  String get heroTitle;

  /// No description provided for @solutionstexte.
  ///
  /// In en, this message translates to:
  /// **'We design innovative solutions based on artificial intelligence, the Internet of Things, digital mapping, and web platforms.'**
  String get solutionstexte;

  /// No description provided for @ia.
  ///
  /// In en, this message translates to:
  /// **'Artificial Intelligence'**
  String get ia;

  /// No description provided for @iadescript.
  ///
  /// In en, this message translates to:
  /// **'Development of Machine Learning and Deep Learning algorithms for decision support.'**
  String get iadescript;

  /// No description provided for @iot.
  ///
  /// In en, this message translates to:
  /// **'Internet of Things'**
  String get iot;

  /// No description provided for @iotdescript.
  ///
  /// In en, this message translates to:
  /// **'Smart sensors, data collection and real-time monitoring.'**
  String get iotdescript;

  /// No description provided for @agri.
  ///
  /// In en, this message translates to:
  /// **'Smart Agriculture'**
  String get agri;

  /// No description provided for @agridescript.
  ///
  /// In en, this message translates to:
  /// **'Optimization of agricultural production through intelligent data analysis.'**
  String get agridescript;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water Management'**
  String get water;

  /// No description provided for @waterdescript.
  ///
  /// In en, this message translates to:
  /// **'Smart irrigation control and water consumption optimization.'**
  String get waterdescript;

  /// No description provided for @maps.
  ///
  /// In en, this message translates to:
  /// **'Mapping'**
  String get maps;

  /// No description provided for @mapsdescript.
  ///
  /// In en, this message translates to:
  /// **'GIS, interactive mapping, geolocation and resource monitoring.'**
  String get mapsdescript;

  /// No description provided for @cloud.
  ///
  /// In en, this message translates to:
  /// **'Cloud & Platforms'**
  String get cloud;

  /// No description provided for @clouddescript.
  ///
  /// In en, this message translates to:
  /// **'Web applications, Flutter, REST APIs and secure cloud solutions.'**
  String get clouddescript;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We develop innovative digital solutions for businesses, organizations and individuals.'**
  String get heroSubtitle;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @ourServices.
  ///
  /// In en, this message translates to:
  /// **'Our Services'**
  String get ourServices;

  /// No description provided for @ourProjects.
  ///
  /// In en, this message translates to:
  /// **'Our Projects'**
  String get ourProjects;

  /// No description provided for @ourMission.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get ourMission;

  /// No description provided for @ourVision.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get ourVision;

  /// No description provided for @ourValues.
  ///
  /// In en, this message translates to:
  /// **'Our Values'**
  String get ourValues;

  /// No description provided for @whyChooseUs.
  ///
  /// In en, this message translates to:
  /// **'Why Choose Us?'**
  String get whyChooseUs;

  /// No description provided for @innovation.
  ///
  /// In en, this message translates to:
  /// **'Innovation'**
  String get innovation;

  /// No description provided for @rapidity.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get rapidity;

  /// No description provided for @quality.
  ///
  /// In en, this message translates to:
  /// **'Quality'**
  String get quality;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @openingHours.
  ///
  /// In en, this message translates to:
  /// **'Opening Hours'**
  String get openingHours;

  /// No description provided for @ourPartners.
  ///
  /// In en, this message translates to:
  /// **'Our Partners'**
  String get ourPartners;

  /// No description provided for @ourTeam.
  ///
  /// In en, this message translates to:
  /// **'Our Team'**
  String get ourTeam;

  /// No description provided for @ourExpertise.
  ///
  /// In en, this message translates to:
  /// **'Our Expertise'**
  String get ourExpertise;

  /// No description provided for @ourHistory.
  ///
  /// In en, this message translates to:
  /// **'Our History'**
  String get ourHistory;

  /// No description provided for @ourAchievements.
  ///
  /// In en, this message translates to:
  /// **'Our Achievements'**
  String get ourAchievements;

  /// No description provided for @ourLocation.
  ///
  /// In en, this message translates to:
  /// **'Our Location'**
  String get ourLocation;

  /// No description provided for @followUs.
  ///
  /// In en, this message translates to:
  /// **'Follow Us'**
  String get followUs;

  /// No description provided for @becomePartner.
  ///
  /// In en, this message translates to:
  /// **'Become a Partner'**
  String get becomePartner;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contactUs_txt.
  ///
  /// In en, this message translates to:
  /// **'Our team is here to answer all your questions.'**
  String get contactUs_txt;

  /// No description provided for @messagesent.
  ///
  /// In en, this message translates to:
  /// **'Message sent'**
  String get messagesent;

  /// No description provided for @sent.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get sent;

  /// No description provided for @gmaps.
  ///
  /// In en, this message translates to:
  /// **'Google Maps'**
  String get gmaps;

  /// No description provided for @whosUs.
  ///
  /// In en, this message translates to:
  /// **'Who Are We?'**
  String get whosUs;

  /// No description provided for @infoinfo.
  ///
  /// In en, this message translates to:
  /// **'An innovative startup driving digital transformation.'**
  String get infoinfo;

  /// No description provided for @stories_txt.
  ///
  /// In en, this message translates to:
  /// **'NOC is a startup founded in 2021 after participating in and being incubated by the VALBIOM Cluster located in Oujda.\n\nThe company\'s mission is to develop innovative solutions that combine traditional and modern technologies. Its first project was an enhanced smart switch, which earned seventh place in an innovation competition.\n\nToday, several solutions are under development, including an intelligent platform dedicated to poultry farmers operating closed-house farms.\n\nAlthough still in its early stages, the startup aims to expand nationally and internationally.'**
  String get stories_txt;

  /// No description provided for @ourVision_txt.
  ///
  /// In en, this message translates to:
  /// **'Building a world where traditional and modern technologies come together to create innovative and environmentally friendly solutions.'**
  String get ourVision_txt;

  /// No description provided for @ourMission_text.
  ///
  /// In en, this message translates to:
  /// **'Design intelligent, simple and accessible solutions that meet the needs of businesses, public organizations and individuals.'**
  String get ourMission_text;

  /// No description provided for @ourValues_text.
  ///
  /// In en, this message translates to:
  /// **'Innovation\nQuality\nTransparency\nSustainability\nCollaboration\nExcellence'**
  String get ourValues_text;

  /// No description provided for @deepia.
  ///
  /// In en, this message translates to:
  /// **'Deep Learning'**
  String get deepia;

  /// No description provided for @flutter_app.
  ///
  /// In en, this message translates to:
  /// **'Flutter Development'**
  String get flutter_app;

  /// No description provided for @cyber.
  ///
  /// In en, this message translates to:
  /// **'Cybersecurity'**
  String get cyber;

  /// No description provided for @visiocomput.
  ///
  /// In en, this message translates to:
  /// **'Computer Vision'**
  String get visiocomput;

  /// No description provided for @bigdata.
  ///
  /// In en, this message translates to:
  /// **'Data Science'**
  String get bigdata;

  /// No description provided for @ourEv.
  ///
  /// In en, this message translates to:
  /// **'Our Evolution'**
  String get ourEv;

  /// No description provided for @ourEv1.
  ///
  /// In en, this message translates to:
  /// **'Startup Founded'**
  String get ourEv1;

  /// No description provided for @ourEv2.
  ///
  /// In en, this message translates to:
  /// **'First Partnerships'**
  String get ourEv2;

  /// No description provided for @ourEv3.
  ///
  /// In en, this message translates to:
  /// **'Deployment of Our First Solutions'**
  String get ourEv3;

  /// No description provided for @ourEv4.
  ///
  /// In en, this message translates to:
  /// **'Seeking Funding'**
  String get ourEv4;

  /// No description provided for @ourEv5.
  ///
  /// In en, this message translates to:
  /// **'Seeking Funding and Partnerships'**
  String get ourEv5;

  /// No description provided for @accompagnement.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get accompagnement;

  /// No description provided for @fin_txt1.
  ///
  /// In en, this message translates to:
  /// **'Together for sustainable, responsible and future-oriented solutions.'**
  String get fin_txt1;

  /// No description provided for @fin_txt2.
  ///
  /// In en, this message translates to:
  /// **'Our ambition is to put technology at the service of sustainable innovation.'**
  String get fin_txt2;

  /// No description provided for @fin_txt3.
  ///
  /// In en, this message translates to:
  /// **'Discover Our Solutions'**
  String get fin_txt3;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get close;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Us a Message'**
  String get sendMessage;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get name;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'All rights reserved.'**
  String get copyright;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
