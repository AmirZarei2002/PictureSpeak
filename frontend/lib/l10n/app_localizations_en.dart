// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PictureSpeak';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get newLabel => 'New';

  @override
  String get required => 'Required';

  @override
  String get active => 'Active';

  @override
  String get inactiveTag => 'inactive';

  @override
  String get setActive => 'Set active';

  @override
  String get setInactive => 'Set inactive';

  @override
  String get tryAgain => 'Try again';

  @override
  String get signOut => 'Sign out';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get guest => 'Guest';

  @override
  String get yes => 'yes';

  @override
  String get no => 'no';

  @override
  String get never => 'never';

  @override
  String get nothingToShow => 'Nothing to show.';

  @override
  String get home => 'Home';

  @override
  String get progress => 'Progress';

  @override
  String get settings => 'Settings';

  @override
  String get welcomeTagline => 'See it. Hear it. Say it.';

  @override
  String get welcomeSubtitle => 'Learn words by picture and sound.';

  @override
  String get continueAsGuest => 'Continue as guest';

  @override
  String get signIn => 'Sign in';

  @override
  String get createAccount => 'Create account';

  @override
  String get welcomeError =>
      'Could not continue. Check your connection and try again.';

  @override
  String get emailRequired => 'Please enter your email';

  @override
  String get emailInvalid => 'That doesn\'t look like an email';

  @override
  String get passwordRequired => 'Please enter your password';

  @override
  String get genericError => 'Something went wrong. Please try again.';

  @override
  String get loginFailed =>
      'That email or password didn\'t match. Please try again.';

  @override
  String get serverUnreachable =>
      'Can\'t reach the server. Check your connection and try again.';

  @override
  String get displayNameOptional => 'Display name (optional)';

  @override
  String get passwordHelper =>
      '8+ chars with upper, lower, a number, and a symbol';

  @override
  String get passwordChoose => 'Please choose a password';

  @override
  String get passwordWeak =>
      'Use 8+ chars with upper, lower, a number, and a symbol (@\$!%*?&)';

  @override
  String get emailTaken =>
      'That email is already registered. Try signing in instead.';

  @override
  String get checkDetails => 'Please check your details and try again.';

  @override
  String get greeting => 'Hello!';

  @override
  String greetingNamed(String name) {
    return 'Hello, $name!';
  }

  @override
  String get homeLoadError => 'Could not load categories.';

  @override
  String get noCategoriesYet => 'No categories yet.';

  @override
  String get pickCategory => 'Pick a category to explore';

  @override
  String get detailLoadError => 'Could not load items.';

  @override
  String get noItemsYet => 'No items yet.';

  @override
  String wordsToExplore(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString words to explore',
      one: '1 word to explore',
    );
    return '$_temp0';
  }

  @override
  String wordsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString words',
      one: '1 word',
    );
    return '$_temp0';
  }

  @override
  String get learnTitle => 'Learn';

  @override
  String get playWord => 'Play word';

  @override
  String cardPosition(int current, int total) {
    final intl.NumberFormat currentNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String currentString = currentNumberFormat.format(current);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return '$currentString of $totalString';
  }

  @override
  String get progressLoadError => 'Could not load progress.';

  @override
  String get wordsExplored => 'Words explored';

  @override
  String get timesListened => 'Times listened';

  @override
  String get progressEmpty => 'Your journey starts with one tap.';

  @override
  String exploredOfTotal(int explored, int total) {
    final intl.NumberFormat exploredNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String exploredString = exploredNumberFormat.format(explored);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return '$exploredString of $totalString explored';
  }

  @override
  String get offlineBanner => 'Offline — showing saved content';

  @override
  String get textSize => 'Text size';

  @override
  String get textScaleNormal => 'Normal';

  @override
  String get textScaleLarge => 'Large';

  @override
  String get textScaleExtra => 'Extra';

  @override
  String get previewText => 'The quick brown fox';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get persian => 'فارسی';

  @override
  String get account => 'Account';

  @override
  String get guestAccount => 'Guest account';

  @override
  String get adminSection => 'Admin';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get dashboardSubtitle => 'Overview, top items, active users';

  @override
  String get manageUsers => 'Manage users';

  @override
  String get manageUsersSubtitle => 'List, drill-down, role, delete';

  @override
  String get manageCategories => 'Manage categories';

  @override
  String get manageCategoriesSubtitle => 'Create, edit, activate, delete';

  @override
  String get adminDashboard => 'Admin dashboard';

  @override
  String overviewFailed(Object error) {
    return 'Overview failed: $error';
  }

  @override
  String get users => 'Users';

  @override
  String userBreakdown(int reg, int guest) {
    final intl.NumberFormat regNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String regString = regNumberFormat.format(reg);
    final intl.NumberFormat guestNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String guestString = guestNumberFormat.format(guest);

    return '$regString reg · $guestString guest';
  }

  @override
  String get admins => 'Admins';

  @override
  String get categories => 'Categories';

  @override
  String activeCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString active';
  }

  @override
  String get items => 'Items';

  @override
  String get progressRows => 'Progress rows';

  @override
  String get activeUsers => 'Active users';

  @override
  String activeUsersFailed(Object error) {
    return 'Active users failed: $error';
  }

  @override
  String get dau => 'DAU';

  @override
  String get wau => 'WAU';

  @override
  String get mau => 'MAU';

  @override
  String dailyActiveLastDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    return 'Daily active — last $daysString days';
  }

  @override
  String get noData => 'No data.';

  @override
  String get topItemsByViews => 'Top items by views';

  @override
  String topItemsFailed(Object error) {
    return 'Top items failed: $error';
  }

  @override
  String get noEngagementData => 'No engagement data yet.';

  @override
  String viewsListens(int views, int listens) {
    final intl.NumberFormat viewsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String viewsString = viewsNumberFormat.format(views);
    final intl.NumberFormat listensNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String listensString = listensNumberFormat.format(listens);

    return '${viewsString}v · ${listensString}l';
  }

  @override
  String get manage => 'Manage';

  @override
  String get categoriesAndItems => 'Categories & items';

  @override
  String get signOutQuestion => 'Sign out?';

  @override
  String get signOutAdminBody =>
      'You will need to sign in again to return to the admin area.';

  @override
  String get searchUsersHint => 'Search by email or display name';

  @override
  String get guests => 'Guests';

  @override
  String get registered => 'Registered';

  @override
  String usersLoadFailed(Object error) {
    return 'Failed to load users: $error';
  }

  @override
  String get noUsersMatch => 'No users match the filters.';

  @override
  String get guestTag => 'guest';

  @override
  String progShort(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'prog $countString';
  }

  @override
  String guestWithId(String id) {
    return 'Guest $id';
  }

  @override
  String get prev => 'Prev';

  @override
  String get next => 'Next';

  @override
  String pageInfo(int page, int lastPage, int total) {
    final intl.NumberFormat pageNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String pageString = pageNumberFormat.format(page);
    final intl.NumberFormat lastPageNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String lastPageString = lastPageNumberFormat.format(lastPage);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Page $pageString / $lastPageString  ·  $totalString total';
  }

  @override
  String get userTitle => 'User';

  @override
  String get info => 'Info';

  @override
  String loadFailed(Object error) {
    return 'Failed to load: $error';
  }

  @override
  String get displayName => 'Display name';

  @override
  String get role => 'Role';

  @override
  String get roleAdmin => 'ADMIN';

  @override
  String get roleUser => 'USER';

  @override
  String get lastSeen => 'Last seen';

  @override
  String get created => 'Created';

  @override
  String get actions => 'Actions';

  @override
  String get demoteToUser => 'Demote to USER';

  @override
  String get promoteToAdmin => 'Promote to ADMIN';

  @override
  String get deleteUser => 'Delete user';

  @override
  String get ownAccountNote =>
      'You cannot promote, demote, or delete your own account here.';

  @override
  String get promoteQuestion => 'Promote to ADMIN?';

  @override
  String get demoteQuestion => 'Demote to USER?';

  @override
  String get promoteBody => 'This user will gain full admin access.';

  @override
  String get demoteBody => 'This user will lose admin access.';

  @override
  String updateFailed(Object error) {
    return 'Update failed: $error';
  }

  @override
  String get deleteUserQuestion => 'Delete this user?';

  @override
  String get deleteUserBody =>
      'This permanently deletes the account and all of their progress. This cannot be undone.';

  @override
  String deleteFailed(Object error) {
    return 'Delete failed: $error';
  }

  @override
  String failed(Object error) {
    return 'Failed: $error';
  }

  @override
  String get noProgressYet => 'No progress yet.';

  @override
  String progressViewsListens(int views, int listens) {
    final intl.NumberFormat viewsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String viewsString = viewsNumberFormat.format(views);
    final intl.NumberFormat listensNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String listensString = listensNumberFormat.format(listens);

    return 'views $viewsString · listens $listensString';
  }

  @override
  String get editCategory => 'Edit category';

  @override
  String get newCategory => 'New category';

  @override
  String categorySubtitle(String slug, int sort, int count) {
    final intl.NumberFormat sortNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String sortString = sortNumberFormat.format(sort);
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '/$slug  ·  sort $sortString  ·  $countString items';
  }

  @override
  String deleteNamedQuestion(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String categoryHasItems(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'This category contains $countString item(s). The server will block deletion — set it inactive instead.';
  }

  @override
  String get categoryDeletePermanent =>
      'This permanently deletes the category.';

  @override
  String get name => 'Name';

  @override
  String get slug => 'Slug';

  @override
  String get slugHelper => 'lowercase, numbers, hyphens (e.g. animals)';

  @override
  String get slugInvalid => 'lowercase / digits / hyphens only';

  @override
  String get coverImagePath => 'Cover image path';

  @override
  String get coverImageHelper => 'relative, e.g. categories/animals/cover.webp';

  @override
  String get colorHex => 'Color (hex)';

  @override
  String get colorHexHelper => 'e.g. #7BAFD4';

  @override
  String get colorHexInvalid => 'must be a 6-digit hex color';

  @override
  String get sortOrder => 'Sort order';

  @override
  String get nonNegativeInteger => 'non-negative integer';

  @override
  String get categoryActiveSubtitle =>
      'When off, learners don\'t see this category.';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get createCategory => 'Create category';

  @override
  String saveFailed(Object error) {
    return 'Save failed: $error';
  }

  @override
  String get noItemsToAdd => 'No items yet. Tap New to add one.';

  @override
  String itemSubtitle(String slug, int sort) {
    final intl.NumberFormat sortNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String sortString = sortNumberFormat.format(sort);

    return '/$slug  ·  sort $sortString';
  }

  @override
  String get mediaThumb => 'thumb';

  @override
  String get mediaAudio => 'audio';

  @override
  String get itemDeletePermanent =>
      'This permanently deletes the item and cascades to anyone who has viewed it. This cannot be undone.';

  @override
  String get editItem => 'Edit item';

  @override
  String get newItemTitle => 'New item';

  @override
  String get slugHelperUnique =>
      'lowercase, numbers, hyphens; unique within the category';

  @override
  String get imagePath => 'Image path';

  @override
  String get imagePathHelper => 'relative, e.g. items/animals/lion.webp';

  @override
  String get thumbnailPathOptional => 'Thumbnail path (optional)';

  @override
  String get audioPathOptional => 'Audio path (optional)';

  @override
  String get audioPathHelper => 'e.g. audio/animals/lion.mp3';

  @override
  String get itemActiveSubtitle => 'When off, learners don\'t see this item.';

  @override
  String get createItem => 'Create item';

  @override
  String get couldNotReadFile => 'Could not read the selected file.';

  @override
  String uploadFailed(Object error) {
    return 'Upload failed: $error';
  }

  @override
  String get noImageChosen => 'No image chosen yet';

  @override
  String get noAudioChosen => 'No audio chosen yet';

  @override
  String get clear => 'Clear';

  @override
  String get replace => 'Replace';

  @override
  String get chooseImage => 'Choose image';

  @override
  String get chooseAudio => 'Choose audio';

  @override
  String get tapToChooseImage => 'Tap \"Choose image\" to upload';

  @override
  String get sectionBasics => 'Basics';

  @override
  String get sectionAppearance => 'Appearance';

  @override
  String get sectionMedia => 'Media';

  @override
  String get sectionDisplay => 'Display';

  @override
  String get categoryBasicsCaption =>
      'The name and URL slug for this category.';

  @override
  String get categoryAppearanceCaption =>
      'Cover image shown on the category card, plus an accent color.';

  @override
  String get categoryDisplayCaption =>
      'Order on the home screen and whether learners can see it.';

  @override
  String get coverImageLabel => 'Cover image';

  @override
  String get coverImageUploadHelper =>
      'Shown on the category tile. JPG / PNG / WEBP.';

  @override
  String get sortOrderHelper => 'Lower numbers appear first.';

  @override
  String get uploadCoverImagePrompt => 'Please upload a cover image.';

  @override
  String get itemBasicsCaption =>
      'What learners will see and how the URL is built.';

  @override
  String get itemMediaCaption =>
      'Pick files from your device — they upload as soon as you choose them.';

  @override
  String get itemDisplayCaption =>
      'Where this item appears in the category and whether learners can see it.';

  @override
  String get imageLabel => 'Image';

  @override
  String get imageUploadHelper =>
      'Shown big on the learning card. JPG / PNG / WEBP.';

  @override
  String get thumbnailLabel => 'Thumbnail (optional)';

  @override
  String get thumbnailUploadHelper =>
      'Smaller version used in the grid. Leave empty to reuse the main image.';

  @override
  String get audioLabel => 'Pronunciation audio (optional)';

  @override
  String get audioUploadHelper =>
      'MP3 / M4A / AAC / WAV / OGG — plays when the learner taps the speaker.';

  @override
  String get sortOrderItemHelper =>
      'Lower numbers appear first in the category.';

  @override
  String get uploadImagePrompt => 'Please upload an image.';
}
