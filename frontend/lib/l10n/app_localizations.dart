import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fa.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fa'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'PictureSpeak'**
  String get appTitle;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @newLabel.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newLabel;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactiveTag.
  ///
  /// In en, this message translates to:
  /// **'inactive'**
  String get inactiveTag;

  /// No description provided for @setActive.
  ///
  /// In en, this message translates to:
  /// **'Set active'**
  String get setActive;

  /// No description provided for @setInactive.
  ///
  /// In en, this message translates to:
  /// **'Set inactive'**
  String get setInactive;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'no'**
  String get no;

  /// No description provided for @never.
  ///
  /// In en, this message translates to:
  /// **'never'**
  String get never;

  /// No description provided for @nothingToShow.
  ///
  /// In en, this message translates to:
  /// **'Nothing to show.'**
  String get nothingToShow;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @welcomeTagline.
  ///
  /// In en, this message translates to:
  /// **'See it. Hear it. Say it.'**
  String get welcomeTagline;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn words by picture and sound.'**
  String get welcomeSubtitle;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuest;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @welcomeError.
  ///
  /// In en, this message translates to:
  /// **'Could not continue. Check your connection and try again.'**
  String get welcomeError;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get emailRequired;

  /// No description provided for @emailInvalid.
  ///
  /// In en, this message translates to:
  /// **'That doesn\'t look like an email'**
  String get emailInvalid;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get passwordRequired;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get genericError;

  /// No description provided for @loginFailed.
  ///
  /// In en, this message translates to:
  /// **'That email or password didn\'t match. Please try again.'**
  String get loginFailed;

  /// No description provided for @serverUnreachable.
  ///
  /// In en, this message translates to:
  /// **'Can\'t reach the server. Check your connection and try again.'**
  String get serverUnreachable;

  /// No description provided for @displayNameOptional.
  ///
  /// In en, this message translates to:
  /// **'Display name (optional)'**
  String get displayNameOptional;

  /// No description provided for @passwordHelper.
  ///
  /// In en, this message translates to:
  /// **'8+ chars with upper, lower, a number, and a symbol'**
  String get passwordHelper;

  /// No description provided for @passwordChoose.
  ///
  /// In en, this message translates to:
  /// **'Please choose a password'**
  String get passwordChoose;

  /// No description provided for @passwordWeak.
  ///
  /// In en, this message translates to:
  /// **'Use 8+ chars with upper, lower, a number, and a symbol (@\$!%*?&)'**
  String get passwordWeak;

  /// No description provided for @emailTaken.
  ///
  /// In en, this message translates to:
  /// **'That email is already registered. Try signing in instead.'**
  String get emailTaken;

  /// No description provided for @checkDetails.
  ///
  /// In en, this message translates to:
  /// **'Please check your details and try again.'**
  String get checkDetails;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello!'**
  String get greeting;

  /// No description provided for @greetingNamed.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}!'**
  String greetingNamed(String name);

  /// No description provided for @homeLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load categories.'**
  String get homeLoadError;

  /// No description provided for @noCategoriesYet.
  ///
  /// In en, this message translates to:
  /// **'No categories yet.'**
  String get noCategoriesYet;

  /// No description provided for @pickCategory.
  ///
  /// In en, this message translates to:
  /// **'Pick a category to explore'**
  String get pickCategory;

  /// No description provided for @detailLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load items.'**
  String get detailLoadError;

  /// No description provided for @noItemsYet.
  ///
  /// In en, this message translates to:
  /// **'No items yet.'**
  String get noItemsYet;

  /// No description provided for @wordsToExplore.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 word to explore} other{{count} words to explore}}'**
  String wordsToExplore(int count);

  /// No description provided for @wordsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 word} other{{count} words}}'**
  String wordsCount(int count);

  /// No description provided for @learnTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learnTitle;

  /// No description provided for @playWord.
  ///
  /// In en, this message translates to:
  /// **'Play word'**
  String get playWord;

  /// No description provided for @cardPosition.
  ///
  /// In en, this message translates to:
  /// **'{current} of {total}'**
  String cardPosition(int current, int total);

  /// No description provided for @progressLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load progress.'**
  String get progressLoadError;

  /// No description provided for @wordsExplored.
  ///
  /// In en, this message translates to:
  /// **'Words explored'**
  String get wordsExplored;

  /// No description provided for @timesListened.
  ///
  /// In en, this message translates to:
  /// **'Times listened'**
  String get timesListened;

  /// No description provided for @progressEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your journey starts with one tap.'**
  String get progressEmpty;

  /// No description provided for @exploredOfTotal.
  ///
  /// In en, this message translates to:
  /// **'{explored} of {total} explored'**
  String exploredOfTotal(int explored, int total);

  /// No description provided for @offlineBanner.
  ///
  /// In en, this message translates to:
  /// **'Offline — showing saved content'**
  String get offlineBanner;

  /// No description provided for @textSize.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get textSize;

  /// No description provided for @textScaleNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get textScaleNormal;

  /// No description provided for @textScaleLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get textScaleLarge;

  /// No description provided for @textScaleExtra.
  ///
  /// In en, this message translates to:
  /// **'Extra'**
  String get textScaleExtra;

  /// No description provided for @previewText.
  ///
  /// In en, this message translates to:
  /// **'The quick brown fox'**
  String get previewText;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @persian.
  ///
  /// In en, this message translates to:
  /// **'فارسی'**
  String get persian;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @guestAccount.
  ///
  /// In en, this message translates to:
  /// **'Guest account'**
  String get guestAccount;

  /// No description provided for @adminSection.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get adminSection;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @dashboardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Overview, top items, active users'**
  String get dashboardSubtitle;

  /// No description provided for @manageUsers.
  ///
  /// In en, this message translates to:
  /// **'Manage users'**
  String get manageUsers;

  /// No description provided for @manageUsersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'List, drill-down, role, delete'**
  String get manageUsersSubtitle;

  /// No description provided for @manageCategories.
  ///
  /// In en, this message translates to:
  /// **'Manage categories'**
  String get manageCategories;

  /// No description provided for @manageCategoriesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create, edit, activate, delete'**
  String get manageCategoriesSubtitle;

  /// No description provided for @adminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Admin dashboard'**
  String get adminDashboard;

  /// No description provided for @overviewFailed.
  ///
  /// In en, this message translates to:
  /// **'Overview failed: {error}'**
  String overviewFailed(Object error);

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @userBreakdown.
  ///
  /// In en, this message translates to:
  /// **'{reg} reg · {guest} guest'**
  String userBreakdown(int reg, int guest);

  /// No description provided for @admins.
  ///
  /// In en, this message translates to:
  /// **'Admins'**
  String get admins;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @activeCount.
  ///
  /// In en, this message translates to:
  /// **'{count} active'**
  String activeCount(int count);

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @progressRows.
  ///
  /// In en, this message translates to:
  /// **'Progress rows'**
  String get progressRows;

  /// No description provided for @activeUsers.
  ///
  /// In en, this message translates to:
  /// **'Active users'**
  String get activeUsers;

  /// No description provided for @activeUsersFailed.
  ///
  /// In en, this message translates to:
  /// **'Active users failed: {error}'**
  String activeUsersFailed(Object error);

  /// No description provided for @dau.
  ///
  /// In en, this message translates to:
  /// **'DAU'**
  String get dau;

  /// No description provided for @wau.
  ///
  /// In en, this message translates to:
  /// **'WAU'**
  String get wau;

  /// No description provided for @mau.
  ///
  /// In en, this message translates to:
  /// **'MAU'**
  String get mau;

  /// No description provided for @dailyActiveLastDays.
  ///
  /// In en, this message translates to:
  /// **'Daily active — last {days} days'**
  String dailyActiveLastDays(int days);

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'No data.'**
  String get noData;

  /// No description provided for @topItemsByViews.
  ///
  /// In en, this message translates to:
  /// **'Top items by views'**
  String get topItemsByViews;

  /// No description provided for @topItemsFailed.
  ///
  /// In en, this message translates to:
  /// **'Top items failed: {error}'**
  String topItemsFailed(Object error);

  /// No description provided for @noEngagementData.
  ///
  /// In en, this message translates to:
  /// **'No engagement data yet.'**
  String get noEngagementData;

  /// No description provided for @viewsListens.
  ///
  /// In en, this message translates to:
  /// **'{views}v · {listens}l'**
  String viewsListens(int views, int listens);

  /// No description provided for @manage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// No description provided for @categoriesAndItems.
  ///
  /// In en, this message translates to:
  /// **'Categories & items'**
  String get categoriesAndItems;

  /// No description provided for @signOutQuestion.
  ///
  /// In en, this message translates to:
  /// **'Sign out?'**
  String get signOutQuestion;

  /// No description provided for @signOutAdminBody.
  ///
  /// In en, this message translates to:
  /// **'You will need to sign in again to return to the admin area.'**
  String get signOutAdminBody;

  /// No description provided for @searchUsersHint.
  ///
  /// In en, this message translates to:
  /// **'Search by email or display name'**
  String get searchUsersHint;

  /// No description provided for @guests.
  ///
  /// In en, this message translates to:
  /// **'Guests'**
  String get guests;

  /// No description provided for @registered.
  ///
  /// In en, this message translates to:
  /// **'Registered'**
  String get registered;

  /// No description provided for @usersLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load users: {error}'**
  String usersLoadFailed(Object error);

  /// No description provided for @noUsersMatch.
  ///
  /// In en, this message translates to:
  /// **'No users match the filters.'**
  String get noUsersMatch;

  /// No description provided for @guestTag.
  ///
  /// In en, this message translates to:
  /// **'guest'**
  String get guestTag;

  /// No description provided for @progShort.
  ///
  /// In en, this message translates to:
  /// **'prog {count}'**
  String progShort(int count);

  /// No description provided for @guestWithId.
  ///
  /// In en, this message translates to:
  /// **'Guest {id}'**
  String guestWithId(String id);

  /// No description provided for @prev.
  ///
  /// In en, this message translates to:
  /// **'Prev'**
  String get prev;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @pageInfo.
  ///
  /// In en, this message translates to:
  /// **'Page {page} / {lastPage}  ·  {total} total'**
  String pageInfo(int page, int lastPage, int total);

  /// No description provided for @userTitle.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userTitle;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @loadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load: {error}'**
  String loadFailed(Object error);

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get displayName;

  /// No description provided for @role.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get role;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'ADMIN'**
  String get roleAdmin;

  /// No description provided for @roleUser.
  ///
  /// In en, this message translates to:
  /// **'USER'**
  String get roleUser;

  /// No description provided for @lastSeen.
  ///
  /// In en, this message translates to:
  /// **'Last seen'**
  String get lastSeen;

  /// No description provided for @created.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// No description provided for @actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// No description provided for @demoteToUser.
  ///
  /// In en, this message translates to:
  /// **'Demote to USER'**
  String get demoteToUser;

  /// No description provided for @promoteToAdmin.
  ///
  /// In en, this message translates to:
  /// **'Promote to ADMIN'**
  String get promoteToAdmin;

  /// No description provided for @deleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete user'**
  String get deleteUser;

  /// No description provided for @ownAccountNote.
  ///
  /// In en, this message translates to:
  /// **'You cannot promote, demote, or delete your own account here.'**
  String get ownAccountNote;

  /// No description provided for @promoteQuestion.
  ///
  /// In en, this message translates to:
  /// **'Promote to ADMIN?'**
  String get promoteQuestion;

  /// No description provided for @demoteQuestion.
  ///
  /// In en, this message translates to:
  /// **'Demote to USER?'**
  String get demoteQuestion;

  /// No description provided for @promoteBody.
  ///
  /// In en, this message translates to:
  /// **'This user will gain full admin access.'**
  String get promoteBody;

  /// No description provided for @demoteBody.
  ///
  /// In en, this message translates to:
  /// **'This user will lose admin access.'**
  String get demoteBody;

  /// No description provided for @updateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed: {error}'**
  String updateFailed(Object error);

  /// No description provided for @deleteUserQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete this user?'**
  String get deleteUserQuestion;

  /// No description provided for @deleteUserBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes the account and all of their progress. This cannot be undone.'**
  String get deleteUserBody;

  /// No description provided for @deleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Delete failed: {error}'**
  String deleteFailed(Object error);

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed: {error}'**
  String failed(Object error);

  /// No description provided for @noProgressYet.
  ///
  /// In en, this message translates to:
  /// **'No progress yet.'**
  String get noProgressYet;

  /// No description provided for @progressViewsListens.
  ///
  /// In en, this message translates to:
  /// **'views {views} · listens {listens}'**
  String progressViewsListens(int views, int listens);

  /// No description provided for @editCategory.
  ///
  /// In en, this message translates to:
  /// **'Edit category'**
  String get editCategory;

  /// No description provided for @newCategory.
  ///
  /// In en, this message translates to:
  /// **'New category'**
  String get newCategory;

  /// No description provided for @categorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'/{slug}  ·  sort {sort}  ·  {count} items'**
  String categorySubtitle(String slug, int sort, int count);

  /// No description provided for @deleteNamedQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String deleteNamedQuestion(String name);

  /// No description provided for @categoryHasItems.
  ///
  /// In en, this message translates to:
  /// **'This category contains {count} item(s). The server will block deletion — set it inactive instead.'**
  String categoryHasItems(int count);

  /// No description provided for @categoryDeletePermanent.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes the category.'**
  String get categoryDeletePermanent;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @slug.
  ///
  /// In en, this message translates to:
  /// **'Slug'**
  String get slug;

  /// No description provided for @slugHelper.
  ///
  /// In en, this message translates to:
  /// **'lowercase, numbers, hyphens (e.g. animals)'**
  String get slugHelper;

  /// No description provided for @slugInvalid.
  ///
  /// In en, this message translates to:
  /// **'lowercase / digits / hyphens only'**
  String get slugInvalid;

  /// No description provided for @coverImagePath.
  ///
  /// In en, this message translates to:
  /// **'Cover image path'**
  String get coverImagePath;

  /// No description provided for @coverImageHelper.
  ///
  /// In en, this message translates to:
  /// **'relative, e.g. categories/animals/cover.webp'**
  String get coverImageHelper;

  /// No description provided for @colorHex.
  ///
  /// In en, this message translates to:
  /// **'Color (hex)'**
  String get colorHex;

  /// No description provided for @colorHexHelper.
  ///
  /// In en, this message translates to:
  /// **'e.g. #7BAFD4'**
  String get colorHexHelper;

  /// No description provided for @colorHexInvalid.
  ///
  /// In en, this message translates to:
  /// **'must be a 6-digit hex color'**
  String get colorHexInvalid;

  /// No description provided for @sortOrder.
  ///
  /// In en, this message translates to:
  /// **'Sort order'**
  String get sortOrder;

  /// No description provided for @nonNegativeInteger.
  ///
  /// In en, this message translates to:
  /// **'non-negative integer'**
  String get nonNegativeInteger;

  /// No description provided for @categoryActiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'When off, learners don\'t see this category.'**
  String get categoryActiveSubtitle;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @createCategory.
  ///
  /// In en, this message translates to:
  /// **'Create category'**
  String get createCategory;

  /// No description provided for @saveFailed.
  ///
  /// In en, this message translates to:
  /// **'Save failed: {error}'**
  String saveFailed(Object error);

  /// No description provided for @noItemsToAdd.
  ///
  /// In en, this message translates to:
  /// **'No items yet. Tap New to add one.'**
  String get noItemsToAdd;

  /// No description provided for @itemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'/{slug}  ·  sort {sort}'**
  String itemSubtitle(String slug, int sort);

  /// No description provided for @mediaThumb.
  ///
  /// In en, this message translates to:
  /// **'thumb'**
  String get mediaThumb;

  /// No description provided for @mediaAudio.
  ///
  /// In en, this message translates to:
  /// **'audio'**
  String get mediaAudio;

  /// No description provided for @itemDeletePermanent.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes the item and cascades to anyone who has viewed it. This cannot be undone.'**
  String get itemDeletePermanent;

  /// No description provided for @editItem.
  ///
  /// In en, this message translates to:
  /// **'Edit item'**
  String get editItem;

  /// No description provided for @newItemTitle.
  ///
  /// In en, this message translates to:
  /// **'New item'**
  String get newItemTitle;

  /// No description provided for @slugHelperUnique.
  ///
  /// In en, this message translates to:
  /// **'lowercase, numbers, hyphens; unique within the category'**
  String get slugHelperUnique;

  /// No description provided for @imagePath.
  ///
  /// In en, this message translates to:
  /// **'Image path'**
  String get imagePath;

  /// No description provided for @imagePathHelper.
  ///
  /// In en, this message translates to:
  /// **'relative, e.g. items/animals/lion.webp'**
  String get imagePathHelper;

  /// No description provided for @thumbnailPathOptional.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail path (optional)'**
  String get thumbnailPathOptional;

  /// No description provided for @audioPathOptional.
  ///
  /// In en, this message translates to:
  /// **'Audio path (optional)'**
  String get audioPathOptional;

  /// No description provided for @audioPathHelper.
  ///
  /// In en, this message translates to:
  /// **'e.g. audio/animals/lion.mp3'**
  String get audioPathHelper;

  /// No description provided for @itemActiveSubtitle.
  ///
  /// In en, this message translates to:
  /// **'When off, learners don\'t see this item.'**
  String get itemActiveSubtitle;

  /// No description provided for @createItem.
  ///
  /// In en, this message translates to:
  /// **'Create item'**
  String get createItem;

  /// No description provided for @couldNotReadFile.
  ///
  /// In en, this message translates to:
  /// **'Could not read the selected file.'**
  String get couldNotReadFile;

  /// No description provided for @uploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Upload failed: {error}'**
  String uploadFailed(Object error);

  /// No description provided for @noImageChosen.
  ///
  /// In en, this message translates to:
  /// **'No image chosen yet'**
  String get noImageChosen;

  /// No description provided for @noAudioChosen.
  ///
  /// In en, this message translates to:
  /// **'No audio chosen yet'**
  String get noAudioChosen;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @replace.
  ///
  /// In en, this message translates to:
  /// **'Replace'**
  String get replace;

  /// No description provided for @chooseImage.
  ///
  /// In en, this message translates to:
  /// **'Choose image'**
  String get chooseImage;

  /// No description provided for @chooseAudio.
  ///
  /// In en, this message translates to:
  /// **'Choose audio'**
  String get chooseAudio;

  /// No description provided for @tapToChooseImage.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Choose image\" to upload'**
  String get tapToChooseImage;

  /// No description provided for @sectionBasics.
  ///
  /// In en, this message translates to:
  /// **'Basics'**
  String get sectionBasics;

  /// No description provided for @sectionAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get sectionAppearance;

  /// No description provided for @sectionMedia.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get sectionMedia;

  /// No description provided for @sectionDisplay.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get sectionDisplay;

  /// No description provided for @categoryBasicsCaption.
  ///
  /// In en, this message translates to:
  /// **'The name and URL slug for this category.'**
  String get categoryBasicsCaption;

  /// No description provided for @categoryAppearanceCaption.
  ///
  /// In en, this message translates to:
  /// **'Cover image shown on the category card, plus an accent color.'**
  String get categoryAppearanceCaption;

  /// No description provided for @categoryDisplayCaption.
  ///
  /// In en, this message translates to:
  /// **'Order on the home screen and whether learners can see it.'**
  String get categoryDisplayCaption;

  /// No description provided for @coverImageLabel.
  ///
  /// In en, this message translates to:
  /// **'Cover image'**
  String get coverImageLabel;

  /// No description provided for @coverImageUploadHelper.
  ///
  /// In en, this message translates to:
  /// **'Shown on the category tile. JPG / PNG / WEBP.'**
  String get coverImageUploadHelper;

  /// No description provided for @sortOrderHelper.
  ///
  /// In en, this message translates to:
  /// **'Lower numbers appear first.'**
  String get sortOrderHelper;

  /// No description provided for @uploadCoverImagePrompt.
  ///
  /// In en, this message translates to:
  /// **'Please upload a cover image.'**
  String get uploadCoverImagePrompt;

  /// No description provided for @itemBasicsCaption.
  ///
  /// In en, this message translates to:
  /// **'What learners will see and how the URL is built.'**
  String get itemBasicsCaption;

  /// No description provided for @itemMediaCaption.
  ///
  /// In en, this message translates to:
  /// **'Pick files from your device — they upload as soon as you choose them.'**
  String get itemMediaCaption;

  /// No description provided for @itemDisplayCaption.
  ///
  /// In en, this message translates to:
  /// **'Where this item appears in the category and whether learners can see it.'**
  String get itemDisplayCaption;

  /// No description provided for @imageLabel.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get imageLabel;

  /// No description provided for @imageUploadHelper.
  ///
  /// In en, this message translates to:
  /// **'Shown big on the learning card. JPG / PNG / WEBP.'**
  String get imageUploadHelper;

  /// No description provided for @thumbnailLabel.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail (optional)'**
  String get thumbnailLabel;

  /// No description provided for @thumbnailUploadHelper.
  ///
  /// In en, this message translates to:
  /// **'Smaller version used in the grid. Leave empty to reuse the main image.'**
  String get thumbnailUploadHelper;

  /// No description provided for @audioLabel.
  ///
  /// In en, this message translates to:
  /// **'Pronunciation audio (optional)'**
  String get audioLabel;

  /// No description provided for @audioUploadHelper.
  ///
  /// In en, this message translates to:
  /// **'MP3 / M4A / AAC / WAV / OGG — plays when the learner taps the speaker.'**
  String get audioUploadHelper;

  /// No description provided for @sortOrderItemHelper.
  ///
  /// In en, this message translates to:
  /// **'Lower numbers appear first in the category.'**
  String get sortOrderItemHelper;

  /// No description provided for @uploadImagePrompt.
  ///
  /// In en, this message translates to:
  /// **'Please upload an image.'**
  String get uploadImagePrompt;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
