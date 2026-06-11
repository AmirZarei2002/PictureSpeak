import { Locale } from '../enums/locale.enum';

export const SUPPORTED_LOCALES: readonly Locale[] = [Locale.EN, Locale.FA];

export const DEFAULT_LOCALE: Locale = Locale.EN;

export const LANGUAGE_QUERY_PARAM = 'lang';

export const LANGUAGE_HEADER = 'x-lang';
