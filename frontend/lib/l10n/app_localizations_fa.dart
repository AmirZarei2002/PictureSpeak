// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'PictureSpeak';

  @override
  String get cancel => 'انصراف';

  @override
  String get confirm => 'تأیید';

  @override
  String get delete => 'حذف';

  @override
  String get edit => 'ویرایش';

  @override
  String get newLabel => 'جدید';

  @override
  String get required => 'الزامی';

  @override
  String get active => 'فعال';

  @override
  String get inactiveTag => 'غیرفعال';

  @override
  String get setActive => 'فعال‌کردن';

  @override
  String get setInactive => 'غیرفعال‌کردن';

  @override
  String get tryAgain => 'تلاش دوباره';

  @override
  String get signOut => 'خروج از حساب';

  @override
  String get emailLabel => 'ایمیل';

  @override
  String get passwordLabel => 'گذرواژه';

  @override
  String get guest => 'مهمان';

  @override
  String get yes => 'بله';

  @override
  String get no => 'خیر';

  @override
  String get never => 'هرگز';

  @override
  String get nothingToShow => 'چیزی برای نمایش نیست.';

  @override
  String get home => 'خانه';

  @override
  String get progress => 'پیشرفت';

  @override
  String get settings => 'تنظیمات';

  @override
  String get welcomeTagline => 'ببین. بشنو. بگو.';

  @override
  String get welcomeSubtitle => 'واژه‌ها را با تصویر و صدا یاد بگیر.';

  @override
  String get continueAsGuest => 'ادامه به‌عنوان مهمان';

  @override
  String get signIn => 'ورود';

  @override
  String get createAccount => 'ساخت حساب';

  @override
  String get welcomeError =>
      'ادامه ممکن نشد. اتصال خود را بررسی کنید و دوباره تلاش کنید.';

  @override
  String get emailRequired => 'لطفاً ایمیل خود را وارد کنید';

  @override
  String get emailInvalid => 'این یک ایمیل معتبر به نظر نمی‌رسد';

  @override
  String get passwordRequired => 'لطفاً گذرواژه خود را وارد کنید';

  @override
  String get genericError => 'مشکلی پیش آمد. لطفاً دوباره تلاش کنید.';

  @override
  String get loginFailed =>
      'ایمیل یا گذرواژه درست نیست. لطفاً دوباره تلاش کنید.';

  @override
  String get serverUnreachable =>
      'دسترسی به سرور ممکن نیست. اتصال خود را بررسی کنید و دوباره تلاش کنید.';

  @override
  String get displayNameOptional => 'نام نمایشی (اختیاری)';

  @override
  String get passwordHelper =>
      'حداقل ۸ نویسه شامل حرف بزرگ، حرف کوچک، عدد و نماد';

  @override
  String get passwordChoose => 'لطفاً یک گذرواژه انتخاب کنید';

  @override
  String get passwordWeak =>
      'از حداقل ۸ نویسه شامل حرف بزرگ، حرف کوچک، عدد و نماد (@\$!%*?&) استفاده کنید';

  @override
  String get emailTaken => 'این ایمیل قبلاً ثبت شده است. به‌جای آن وارد شوید.';

  @override
  String get checkDetails =>
      'لطفاً اطلاعات خود را بررسی کنید و دوباره تلاش کنید.';

  @override
  String get greeting => 'سلام!';

  @override
  String greetingNamed(String name) {
    return 'سلام، $name!';
  }

  @override
  String get homeLoadError => 'بارگذاری دسته‌بندی‌ها ممکن نشد.';

  @override
  String get noCategoriesYet => 'هنوز دسته‌بندی‌ای وجود ندارد.';

  @override
  String get pickCategory => 'یک دسته‌بندی برای کاوش انتخاب کنید';

  @override
  String get detailLoadError => 'بارگذاری موارد ممکن نشد.';

  @override
  String get noItemsYet => 'هنوز موردی وجود ندارد.';

  @override
  String wordsToExplore(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString واژه برای کاوش',
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
      other: '$countString واژه',
    );
    return '$_temp0';
  }

  @override
  String get learnTitle => 'یادگیری';

  @override
  String get playWord => 'پخش واژه';

  @override
  String cardPosition(int current, int total) {
    final intl.NumberFormat currentNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String currentString = currentNumberFormat.format(current);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return '$currentString از $totalString';
  }

  @override
  String get progressLoadError => 'بارگذاری پیشرفت ممکن نشد.';

  @override
  String get wordsExplored => 'واژه‌های کاوش‌شده';

  @override
  String get timesListened => 'دفعات شنیدن';

  @override
  String get progressEmpty => 'سفر شما با یک لمس آغاز می‌شود.';

  @override
  String exploredOfTotal(int explored, int total) {
    final intl.NumberFormat exploredNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String exploredString = exploredNumberFormat.format(explored);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return '$exploredString از $totalString کاوش شد';
  }

  @override
  String get offlineBanner => 'آفلاین — نمایش محتوای ذخیره‌شده';

  @override
  String get textSize => 'اندازه متن';

  @override
  String get textScaleNormal => 'معمولی';

  @override
  String get textScaleLarge => 'بزرگ';

  @override
  String get textScaleExtra => 'خیلی بزرگ';

  @override
  String get previewText => 'یادگیری واژه‌ها لذت‌بخش است';

  @override
  String get theme => 'پوسته';

  @override
  String get themeSystem => 'سیستم';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تیره';

  @override
  String get language => 'زبان';

  @override
  String get english => 'English';

  @override
  String get persian => 'فارسی';

  @override
  String get account => 'حساب کاربری';

  @override
  String get guestAccount => 'حساب مهمان';

  @override
  String get adminSection => 'مدیریت';

  @override
  String get dashboard => 'داشبورد';

  @override
  String get dashboardSubtitle => 'نمای کلی، موارد برتر، کاربران فعال';

  @override
  String get manageUsers => 'مدیریت کاربران';

  @override
  String get manageUsersSubtitle => 'فهرست، جزئیات، نقش، حذف';

  @override
  String get manageCategories => 'مدیریت دسته‌بندی‌ها';

  @override
  String get manageCategoriesSubtitle => 'ایجاد، ویرایش، فعال‌سازی، حذف';

  @override
  String get adminDashboard => 'داشبورد مدیریت';

  @override
  String overviewFailed(Object error) {
    return 'بارگذاری نمای کلی ناموفق بود: $error';
  }

  @override
  String get users => 'کاربران';

  @override
  String userBreakdown(int reg, int guest) {
    final intl.NumberFormat regNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String regString = regNumberFormat.format(reg);
    final intl.NumberFormat guestNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String guestString = guestNumberFormat.format(guest);

    return '$regString ثبت‌شده · $guestString مهمان';
  }

  @override
  String get admins => 'مدیران';

  @override
  String get categories => 'دسته‌بندی‌ها';

  @override
  String activeCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString فعال';
  }

  @override
  String get items => 'موارد';

  @override
  String get progressRows => 'ردیف‌های پیشرفت';

  @override
  String get activeUsers => 'کاربران فعال';

  @override
  String activeUsersFailed(Object error) {
    return 'بارگذاری کاربران فعال ناموفق بود: $error';
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

    return 'کاربران فعال روزانه — $daysString روز اخیر';
  }

  @override
  String get noData => 'داده‌ای نیست.';

  @override
  String get topItemsByViews => 'موارد برتر بر اساس بازدید';

  @override
  String topItemsFailed(Object error) {
    return 'بارگذاری موارد برتر ناموفق بود: $error';
  }

  @override
  String get noEngagementData => 'هنوز داده‌ای ثبت نشده است.';

  @override
  String viewsListens(int views, int listens) {
    final intl.NumberFormat viewsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String viewsString = viewsNumberFormat.format(views);
    final intl.NumberFormat listensNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String listensString = listensNumberFormat.format(listens);

    return '$viewsString بازدید · $listensString شنیدن';
  }

  @override
  String get manage => 'مدیریت';

  @override
  String get categoriesAndItems => 'دسته‌بندی‌ها و موارد';

  @override
  String get signOutQuestion => 'خروج از حساب؟';

  @override
  String get signOutAdminBody =>
      'برای بازگشت به بخش مدیریت باید دوباره وارد شوید.';

  @override
  String get searchUsersHint => 'جستجو بر اساس ایمیل یا نام نمایشی';

  @override
  String get guests => 'مهمان‌ها';

  @override
  String get registered => 'ثبت‌شده‌ها';

  @override
  String usersLoadFailed(Object error) {
    return 'بارگذاری کاربران ناموفق بود: $error';
  }

  @override
  String get noUsersMatch => 'کاربری با این فیلترها یافت نشد.';

  @override
  String get guestTag => 'مهمان';

  @override
  String progShort(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString پیشرفت';
  }

  @override
  String guestWithId(String id) {
    return 'مهمان $id';
  }

  @override
  String get prev => 'قبلی';

  @override
  String get next => 'بعدی';

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

    return 'صفحه $pageString / $lastPageString  ·  مجموع $totalString';
  }

  @override
  String get userTitle => 'کاربر';

  @override
  String get info => 'اطلاعات';

  @override
  String loadFailed(Object error) {
    return 'بارگذاری ناموفق بود: $error';
  }

  @override
  String get displayName => 'نام نمایشی';

  @override
  String get role => 'نقش';

  @override
  String get roleAdmin => 'مدیر';

  @override
  String get roleUser => 'کاربر';

  @override
  String get lastSeen => 'آخرین بازدید';

  @override
  String get created => 'تاریخ ایجاد';

  @override
  String get actions => 'اقدامات';

  @override
  String get demoteToUser => 'تنزل به کاربر';

  @override
  String get promoteToAdmin => 'ارتقا به مدیر';

  @override
  String get deleteUser => 'حذف کاربر';

  @override
  String get ownAccountNote =>
      'نمی‌توانید حساب خودتان را اینجا ارتقا، تنزل یا حذف کنید.';

  @override
  String get promoteQuestion => 'ارتقا به مدیر؟';

  @override
  String get demoteQuestion => 'تنزل به کاربر؟';

  @override
  String get promoteBody => 'این کاربر دسترسی کامل مدیریت پیدا می‌کند.';

  @override
  String get demoteBody => 'این کاربر دسترسی مدیریت را از دست می‌دهد.';

  @override
  String updateFailed(Object error) {
    return 'به‌روزرسانی ناموفق بود: $error';
  }

  @override
  String get deleteUserQuestion => 'این کاربر حذف شود؟';

  @override
  String get deleteUserBody =>
      'این کار حساب کاربر و همه پیشرفت او را برای همیشه حذف می‌کند. این عمل قابل بازگشت نیست.';

  @override
  String deleteFailed(Object error) {
    return 'حذف ناموفق بود: $error';
  }

  @override
  String failed(Object error) {
    return 'ناموفق: $error';
  }

  @override
  String get noProgressYet => 'هنوز پیشرفتی نیست.';

  @override
  String progressViewsListens(int views, int listens) {
    final intl.NumberFormat viewsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String viewsString = viewsNumberFormat.format(views);
    final intl.NumberFormat listensNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String listensString = listensNumberFormat.format(listens);

    return '$viewsString بازدید · $listensString شنیدن';
  }

  @override
  String get editCategory => 'ویرایش دسته‌بندی';

  @override
  String get newCategory => 'دسته‌بندی جدید';

  @override
  String categorySubtitle(String slug, int sort, int count) {
    final intl.NumberFormat sortNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String sortString = sortNumberFormat.format(sort);
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '/$slug  ·  ترتیب $sortString  ·  $countString مورد';
  }

  @override
  String deleteNamedQuestion(String name) {
    return '«$name» حذف شود؟';
  }

  @override
  String categoryHasItems(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'این دسته‌بندی شامل $countString مورد است. سرور حذف را مسدود می‌کند — به‌جای آن آن را غیرفعال کنید.';
  }

  @override
  String get categoryDeletePermanent =>
      'این کار دسته‌بندی را برای همیشه حذف می‌کند.';

  @override
  String get name => 'نام';

  @override
  String get slug => 'نامک';

  @override
  String get slugHelper => 'حروف کوچک، اعداد، خط تیره (مثلاً animals)';

  @override
  String get slugInvalid => 'فقط حروف کوچک / اعداد / خط تیره';

  @override
  String get coverImagePath => 'مسیر تصویر کاور';

  @override
  String get coverImageHelper => 'نسبی، مثلاً categories/animals/cover.webp';

  @override
  String get colorHex => 'رنگ (هگز)';

  @override
  String get colorHexHelper => 'مثلاً #7BAFD4';

  @override
  String get colorHexInvalid => 'باید یک رنگ هگز ۶ رقمی باشد';

  @override
  String get sortOrder => 'ترتیب نمایش';

  @override
  String get nonNegativeInteger => 'عدد صحیح نامنفی';

  @override
  String get categoryActiveSubtitle =>
      'وقتی خاموش باشد، زبان‌آموزان این دسته‌بندی را نمی‌بینند.';

  @override
  String get saveChanges => 'ذخیره تغییرات';

  @override
  String get createCategory => 'ایجاد دسته‌بندی';

  @override
  String saveFailed(Object error) {
    return 'ذخیره ناموفق بود: $error';
  }

  @override
  String get noItemsToAdd => 'هنوز موردی نیست. برای افزودن روی «جدید» بزنید.';

  @override
  String itemSubtitle(String slug, int sort) {
    final intl.NumberFormat sortNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String sortString = sortNumberFormat.format(sort);

    return '/$slug  ·  ترتیب $sortString';
  }

  @override
  String get mediaThumb => 'بندانگشتی';

  @override
  String get mediaAudio => 'صوت';

  @override
  String get itemDeletePermanent =>
      'این کار مورد را برای همیشه حذف می‌کند و شامل همه کسانی می‌شود که آن را دیده‌اند. این عمل قابل بازگشت نیست.';

  @override
  String get editItem => 'ویرایش مورد';

  @override
  String get newItemTitle => 'مورد جدید';

  @override
  String get slugHelperUnique => 'حروف کوچک، اعداد، خط تیره؛ یکتا در دسته‌بندی';

  @override
  String get imagePath => 'مسیر تصویر';

  @override
  String get imagePathHelper => 'نسبی، مثلاً items/animals/lion.webp';

  @override
  String get thumbnailPathOptional => 'مسیر بندانگشتی (اختیاری)';

  @override
  String get audioPathOptional => 'مسیر صوت (اختیاری)';

  @override
  String get audioPathHelper => 'مثلاً audio/animals/lion.mp3';

  @override
  String get itemActiveSubtitle =>
      'وقتی خاموش باشد، زبان‌آموزان این مورد را نمی‌بینند.';

  @override
  String get createItem => 'ایجاد مورد';

  @override
  String get couldNotReadFile => 'خواندن فایل انتخاب‌شده ممکن نشد.';

  @override
  String uploadFailed(Object error) {
    return 'بارگذاری ناموفق بود: $error';
  }

  @override
  String get noImageChosen => 'هنوز تصویری انتخاب نشده';

  @override
  String get noAudioChosen => 'هنوز صدایی انتخاب نشده';

  @override
  String get clear => 'پاک‌کردن';

  @override
  String get replace => 'جایگزینی';

  @override
  String get chooseImage => 'انتخاب تصویر';

  @override
  String get chooseAudio => 'انتخاب صدا';

  @override
  String get tapToChooseImage => 'برای بارگذاری «انتخاب تصویر» را بزنید';

  @override
  String get sectionBasics => 'اصول';

  @override
  String get sectionAppearance => 'ظاهر';

  @override
  String get sectionMedia => 'رسانه';

  @override
  String get sectionDisplay => 'نمایش';

  @override
  String get categoryBasicsCaption => 'نام و نامک نشانی این دسته‌بندی.';

  @override
  String get categoryAppearanceCaption =>
      'تصویر کاور که روی کارت دسته‌بندی نمایش داده می‌شود، به‌همراه یک رنگ تأکیدی.';

  @override
  String get categoryDisplayCaption =>
      'ترتیب در صفحه خانه و اینکه زبان‌آموزان آن را ببینند یا نه.';

  @override
  String get coverImageLabel => 'تصویر کاور';

  @override
  String get coverImageUploadHelper =>
      'روی کاشی دسته‌بندی نمایش داده می‌شود. JPG / PNG / WEBP.';

  @override
  String get sortOrderHelper => 'اعداد کوچک‌تر زودتر نمایش داده می‌شوند.';

  @override
  String get uploadCoverImagePrompt => 'لطفاً یک تصویر کاور بارگذاری کنید.';

  @override
  String get itemBasicsCaption =>
      'آنچه زبان‌آموزان می‌بینند و نحوه ساخت نشانی.';

  @override
  String get itemMediaCaption =>
      'فایل‌ها را از دستگاه خود انتخاب کنید — به‌محض انتخاب بارگذاری می‌شوند.';

  @override
  String get itemDisplayCaption =>
      'جایگاه این مورد در دسته‌بندی و اینکه زبان‌آموزان آن را ببینند یا نه.';

  @override
  String get imageLabel => 'تصویر';

  @override
  String get imageUploadHelper =>
      'بزرگ روی کارت یادگیری نمایش داده می‌شود. JPG / PNG / WEBP.';

  @override
  String get thumbnailLabel => 'بندانگشتی (اختیاری)';

  @override
  String get thumbnailUploadHelper =>
      'نسخه کوچک‌تر که در شبکه استفاده می‌شود. برای استفاده دوباره از تصویر اصلی، خالی بگذارید.';

  @override
  String get audioLabel => 'صدای تلفظ (اختیاری)';

  @override
  String get audioUploadHelper =>
      'MP3 / M4A / AAC / WAV / OGG — هنگام زدن روی بلندگو پخش می‌شود.';

  @override
  String get sortOrderItemHelper =>
      'اعداد کوچک‌تر زودتر در دسته‌بندی نمایش داده می‌شوند.';

  @override
  String get uploadImagePrompt => 'لطفاً یک تصویر بارگذاری کنید.';
}
