// import 'package:http/http.dart';

class TimeZones {
  /*
    For flags
    https://flagsapi.com/$iso/flat/64.png
  */

  Future<void> getTimezOnes() async {
    List<Map<String, String>> timezones = [
      {"timezone": "Africa/Abidjan", "iso": "CI"},
      {"timezone": "Africa/Algiers", "iso": "DZ"},
      {"timezone": "Africa/Bissau", "iso": "GW"},
      {"timezone": "Africa/Cairo", "iso": "EG"},
      {"timezone": "Africa/Casablanca", "iso": "MA"},
      {"timezone": "Africa/Ceuta", "iso": "ES"},
      {"timezone": "Africa/El_Aaiun", "iso": "EH"},
      {"timezone": "Africa/Johannesburg", "iso": "ZA"},
      {"timezone": "Africa/Juba", "iso": "SS"},
      {"timezone": "Africa/Khartoum", "iso": "SD"},
      {"timezone": "Africa/Lagos", "iso": "NG"},
      {"timezone": "Africa/Maputo", "iso": "MZ"},
      {"timezone": "Africa/Monrovia", "iso": "LR"},
      {"timezone": "Africa/Nairobi", "iso": "KE"},
      {"timezone": "Africa/Ndjamena", "iso": "TD"},
      {"timezone": "Africa/Sao_Tome", "iso": "ST"},
      {"timezone": "Africa/Tripoli", "iso": "LY"},
      {"timezone": "Africa/Tunis", "iso": "TN"},
      {"timezone": "Africa/Windhoek", "iso": "NA"},
      {"timezone": "America/Adak", "iso": "US"},
      {"timezone": "America/Anchorage", "iso": "US"},
      {"timezone": "America/Araguaina", "iso": "BR"},
      {"timezone": "America/Argentina/Buenos_Aires", "iso": "AR"},
      {"timezone": "America/Argentina/Catamarca", "iso": "AR"},
      {"timezone": "America/Argentina/Cordoba", "iso": "AR"},
      {"timezone": "America/Argentina/Jujuy", "iso": "AR"},
      {"timezone": "America/Argentina/La_Rioja", "iso": "AR"},
      {"timezone": "America/Argentina/Mendoza", "iso": "AR"},
      {"timezone": "America/Argentina/Rio_Gallegos", "iso": "AR"},
      {"timezone": "America/Argentina/Salta", "iso": "AR"},
      {"timezone": "America/Argentina/San_Juan", "iso": "AR"},
      {"timezone": "America/Argentina/San_Luis", "iso": "AR"},
      {"timezone": "America/Argentina/Tucuman", "iso": "AR"},
      {"timezone": "America/Argentina/Ushuaia", "iso": "AR"},
      {"timezone": "America/Asuncion", "iso": "PY"},
      {"timezone": "America/Bahia", "iso": "BR"},
      {"timezone": "America/Bahia_Banderas", "iso": "MX"},
      {"timezone": "America/Barbados", "iso": "BB"},
      {"timezone": "America/Belem", "iso": "BR"},
      {"timezone": "Africa/Algiers", "iso": "DZ"},
      {"timezone": "America/Belize", "iso": "BZ"},
      {"timezone": "America/Boa_Vista", "iso": "BR"},
      {"timezone": "America/Bogota", "iso": "CO"},
      {"timezone": "America/Boise", "iso": "US"},
      {"timezone": "America/Cambridge_Bay", "iso": "CA"},
      {"timezone": "America/Campo_Grande", "iso": "BR"},
      {"timezone": "America/Cancun", "iso": "MX"},
      {"timezone": "America/Caracas", "iso": "VE"},
      {"timezone": "America/Cayenne", "iso": "GF"},
      {"timezone": "America/Chicago", "iso": "US"},
      {"timezone": "America/Chihuahua", "iso": "MX"},
      {"timezone": "America/Ciudad_Juarez", "iso": "MX"},
      {"timezone": "America/Costa_Rica", "iso": "CR"},
      {"timezone": "America/Cuiaba", "iso": "BR"},
      {"timezone": "America/Danmarkshavn", "iso": "GL"},
      {"timezone": "America/Dawson", "iso": "CA"},
      {"timezone": "America/Dawson_Creek", "iso": "CA"},
      {"timezone": "America/Denver", "iso": "US"},
      {"timezone": "America/Detroit", "iso": "US"},
      {"timezone": "America/Edmonton", "iso": "CA"},
      {"timezone": "America/Eirunepe", "iso": "BR"},
      {"timezone": "America/El_Salvador", "iso": "SV"},
      {"timezone": "America/Fort_Nelson", "iso": "CA"},
      {"timezone": "America/Fortaleza", "iso": "BR"},
      {"timezone": "America/Glace_Bay", "iso": "CA"},
      {"timezone": "America/Goose_Bay", "iso": "CA"},
      {"timezone": "America/Grand_Turk", "iso": "TC"},
      {"timezone": "America/Guatemala", "iso": "GT"},
      {"timezone": "America/Guayaquil", "iso": "EC"},
      {"timezone": "America/Guyana", "iso": "GY"},
      {"timezone": "America/Halifax", "iso": "CA"},
      {"timezone": "America/Havana", "iso": "CU"},
      {"timezone": "America/Indiana/Indianapolis", "iso": "US"},
      {"timezone": "America/Indiana/Knox", "iso": "US"},
      {"timezone": "America/Indiana/Marengo", "iso": "US"},
      {"timezone": "America/Indiana/Petersburg", "iso": "US"},
      {"timezone": "America/Indiana/Tell_City", "iso": "US"},
      {"timezone": "America/Indiana/Vevay", "iso": "US"},
      {"timezone": "America/Indiana/Vincennes", "iso": "US"},
      {"timezone": "America/Indiana/Winamac", "iso": "US"},
      {"timezone": "America/Inuvik", "iso": "CA"},
      {"timezone": "America/Iqaluit", "iso": "CA"},
      {"timezone": "America/Jamaica", "iso": "JM"},
      {"timezone": "America/Juneau", "iso": "US"},
      {"timezone": "America/Kentucky/Louisville", "iso": "US"},
      {"timezone": "America/Kentucky/Monticello", "iso": "US"},
      {"timezone": "America/La_Paz", "iso": "BO"},
      {"timezone": "America/Lima", "iso": "PE"},
      {"timezone": "America/Los_Angeles", "iso": "US"},
      {"timezone": "America/Maceio", "iso": "BR"},
      {"timezone": "America/Managua", "iso": "NI"},
      {"timezone": "America/Manaus", "iso": "BR"},
      {"timezone": "America/Martinique", "iso": "MQ"},
      {"timezone": "America/Matamoros", "iso": "MX"},
      {"timezone": "America/Mazatlan", "iso": "MX"},
      {"timezone": "America/Menominee", "iso": "US"},
      {"timezone": "America/Merida", "iso": "MX"},
      {"timezone": "America/Metlakatla", "iso": "US"},
      {"timezone": "America/Mexico_City", "iso": "MX"},
      {"timezone": "America/Miquelon", "iso": "PM"},
      {"timezone": "America/Moncton", "iso": "CA"},
      {"timezone": "America/Monterrey", "iso": "MX"},
      {"timezone": "America/Montevideo", "iso": "UY"},
      {"timezone": "America/New_York", "iso": "US"},
      {"timezone": "America/Nome", "iso": "US"},
      {"timezone": "America/Noronha", "iso": "BR"},
      {"timezone": "America/North_Dakota/Beulah", "iso": "US"},
      {"timezone": "America/North_Dakota/Center", "iso": "US"},
      {"timezone": "America/North_Dakota/New_Salem", "iso": "US"},
      {"timezone": "America/Nuuk", "iso": "GL"},
      {"timezone": "America/Ojinaga", "iso": "MX"},
      {"timezone": "America/Panama", "iso": "PA"},
      {"timezone": "America/Paramaribo", "iso": "SR"},
      {"timezone": "America/Phoenix", "iso": "US"},
      {"timezone": "America/Port-au-Prince", "iso": "HT"},
      {"timezone": "America/Porto_Velho", "iso": "BR"},
      {"timezone": "America/Puerto_Rico", "iso": "PR"},
      {"timezone": "America/Punta_Arenas", "iso": "CL"},
      {"timezone": "America/Rankin_Inlet", "iso": "CA"},
      {"timezone": "America/Recife", "iso": "BR"},
      {"timezone": "America/Regina", "iso": "CA"},
      {"timezone": "America/Resolute", "iso": "CA"},
      {"timezone": "America/Rio_Branco", "iso": "BR"},
      {"timezone": "America/Santarem", "iso": "BR"},
      {"timezone": "America/Santiago", "iso": "CL"},
      {"timezone": "America/Santo_Domingo", "iso": "DO"},
      {"timezone": "America/Sao_Paulo", "iso": "BR"},
      {"timezone": "America/Scoresbysund", "iso": "GL"},
      {"timezone": "America/Sitka", "iso": "US"},
      {"timezone": "America/St_Johns", "iso": "CA"},
      {"timezone": "America/Swift_Current", "iso": "CA"},
      {"timezone": "America/Tegucigalpa", "iso": "HN"},
      {"timezone": "America/Thule", "iso": "GL"},
      {"timezone": "America/Tijuana", "iso": "MX"},
      {"timezone": "America/Toronto", "iso": "CA"},
      {"timezone": "America/Vancouver", "iso": "CA"},
      {"timezone": "America/Whitehorse", "iso": "CA"},
      {"timezone": "America/Winnipeg", "iso": "CA"},
      {"timezone": "America/Yakutat", "iso": "US"},
      {"timezone": "Antarctica/Casey", "iso": "AQ"},
      {"timezone": "Antarctica/Davis", "iso": "AQ"},
      {"timezone": "Antarctica/Macquarie", "iso": "AU"},
      {"timezone": "Antarctica/Mawson", "iso": "AQ"},
      {"timezone": "Antarctica/Palmer", "iso": "AQ"},
      {"timezone": "Antarctica/Rothera", "iso": "AQ"},
      {"timezone": "Antarctica/Troll", "iso": "AQ"},
      {"timezone": "Asia/Almaty", "iso": "KZ"},
      {"timezone": "Asia/Amman", "iso": "JO"},
      {"timezone": "Asia/Anadyr", "iso": "RU"},
      {"timezone": "Asia/Aqtau", "iso": "KZ"},
      {"timezone": "Asia/Aqtobe", "iso": "KZ"},
      {"timezone": "Asia/Ashgabat", "iso": "TM"},
      {"timezone": "Asia/Atyrau", "iso": "KZ"},
      {"timezone": "Asia/Baghdad", "iso": "IQ"},
      {"timezone": "Asia/Baku", "iso": "AZ"},
      {"timezone": "Asia/Bangkok", "iso": "TH"},
      {"timezone": "Asia/Barnaul", "iso": "RU"},
      {"timezone": "Asia/Beirut", "iso": "LB"},
      {"timezone": "Asia/Bishkek", "iso": "KG"},
      {"timezone": "Asia/Chita", "iso": "RU"},
      {"timezone": "Asia/Choibalsan", "iso": "MN"},
      {"timezone": "Asia/Colombo", "iso": "LK"},
      {"timezone": "Asia/Damascus", "iso": "SY"},
      {"timezone": "Asia/Dhaka", "iso": "BD"},
      {"timezone": "Asia/Dili", "iso": "TL"},
      {"timezone": "Asia/Dubai", "iso": "AE"},
      {"timezone": "Asia/Dushanbe", "iso": "TJ"},
      {"timezone": "Asia/Famagusta", "iso": "CY"},
      {"timezone": "Asia/Gaza", "iso": "PS"},
      {"timezone": "Asia/Hebron", "iso": "PS"},
      {"timezone": "Asia/Ho_Chi_Minh", "iso": "VN"},
      {"timezone": "Asia/Hong_Kong", "iso": "HK"},
      {"timezone": "Asia/Hovd", "iso": "MN"},
      {"timezone": "Asia/Irkutsk", "iso": "RU"},
      {"timezone": "Asia/Jakarta", "iso": "ID"},
      {"timezone": "Asia/Jayapura", "iso": "ID"},
      {"timezone": "Asia/Jerusalem", "iso": "IL"},
      {"timezone": "Asia/Kabul", "iso": "AF"},
      {"timezone": "Asia/Kamchatka", "iso": "RU"},
      {"timezone": "Asia/Karachi", "iso": "PK"},
      {"timezone": "Asia/Kathmandu", "iso": "NP"},
      {"timezone": "Asia/Khandyga", "iso": "RU"},
      {"timezone": "Asia/Kolkata", "iso": "IN"},
      {"timezone": "Asia/Krasnoyarsk", "iso": "RU"},
      {"timezone": "Asia/Kuching", "iso": "MY"},
      {"timezone": "Asia/Macau", "iso": "MO"},
      {"timezone": "Asia/Magadan", "iso": "RU"},
      {"timezone": "Asia/Makassar", "iso": "ID"},
      {"timezone": "Asia/Manila", "iso": "PH"},
      {"timezone": "Asia/Nicosia", "iso": "CY"},
      {"timezone": "Asia/Novokuznetsk", "iso": "RU"},
      {"timezone": "Asia/Novosibirsk", "iso": "RU"},
      {"timezone": "Asia/Omsk", "iso": "RU"},
      {"timezone": "Asia/Oral", "iso": "KZ"},
      {"timezone": "Asia/Pontianak", "iso": "ID"},
      {"timezone": "Asia/Pyongyang", "iso": "KP"},
      {"timezone": "Asia/Qatar", "iso": "QA"},
      {"timezone": "Asia/Qostanay", "iso": "KZ"},
      {"timezone": "Asia/Qyzylorda", "iso": "KZ"},
      {"timezone": "Asia/Riyadh", "iso": "SA"},
      {"timezone": "Asia/Sakhalin", "iso": "RU"},
      {"timezone": "Asia/Samarkand", "iso": "UZ"},
      {"timezone": "Asia/Seoul", "iso": "KR"},
      {"timezone": "Asia/Shanghai", "iso": "CN"},
      {"timezone": "Asia/Singapore", "iso": "SG"},
      {"timezone": "Asia/Srednekolymsk", "iso": "RU"},
      {"timezone": "Asia/Taipei", "iso": "TW"},
      {"timezone": "Asia/Tashkent", "iso": "UZ"},
      {"timezone": "Asia/Tbilisi", "iso": "GE"},
      {"timezone": "Asia/Tehran", "iso": "IR"},
      {"timezone": "Asia/Thimphu", "iso": "BT"},
      {"timezone": "Asia/Tokyo", "iso": "JP"},
      {"timezone": "Asia/Tomsk", "iso": "RU"},
      {"timezone": "Asia/Ulaanbaatar", "iso": "MN"},
      {"timezone": "Asia/Urumqi", "iso": "CN"},
      {"timezone": "Asia/Ust-Nera", "iso": "RU"},
      {"timezone": "Asia/Vladivostok", "iso": "RU"},
      {"timezone": "Asia/Yakutsk", "iso": "RU"},
      {"timezone": "Asia/Yangon", "iso": "MM"},
      {"timezone": "Asia/Yekaterinburg", "iso": "RU"},
      {"timezone": "Asia/Yerevan", "iso": "AM"},
      {"timezone": "Atlantic/Azores", "iso": "PT"},
      {"timezone": "Atlantic/Bermuda", "iso": "BM"},
      {"timezone": "Atlantic/Canary", "iso": "ES"},
      {"timezone": "Atlantic/Cape_Verde", "iso": "CV"},
      {"timezone": "Atlantic/Faroe", "iso": "FO"},
      {"timezone": "Atlantic/Madeira", "iso": "PT"},
      {"timezone": "Atlantic/South_Georgia", "iso": "GS"},
      {"timezone": "Atlantic/Stanley", "iso": "FK"},
      {"timezone": "Australia/Adelaide", "iso": "AU"},
      {"timezone": "Australia/Brisbane", "iso": "AU"},
      {"timezone": "Australia/Broken_Hill", "iso": "AU"},
      {"timezone": "Australia/Darwin", "iso": "AU"},
      {"timezone": "Australia/Eucla", "iso": "AU"},
      {"timezone": "Australia/Hobart", "iso": "AU"},
      {"timezone": "Australia/Lindeman", "iso": "AU"},
      {"timezone": "Australia/Lord_Howe", "iso": "AU"},
      {"timezone": "Australia/Melbourne", "iso": "AU"},
      {"timezone": "Australia/Perth", "iso": "AU"},
      {"timezone": "Australia/Sydney", "iso": "AU"},
      {"timezone": "CET", "iso": "CET"},
      {"timezone": "CST6CDT", "iso": "CST6CDT"},
      {"timezone": "EET", "iso": "EET"},
      {"timezone": "EST", "iso": "EST"},
      {"timezone": "EST5EDT", "iso": "EST5EDT"},
      {"timezone": "Etc/GMT", "iso": "Etc/GMT"},
      {"timezone": "Etc/GMT+1", "iso": "Etc/GMT+1"},
      {"timezone": "Etc/GMT+10", "iso": "Etc/GMT+10"},
      {"timezone": "Etc/GMT+11", "iso": "Etc/GMT+11"},
      {"timezone": "Etc/GMT+12", "iso": "Etc/GMT+12"},
      {"timezone": "Etc/GMT+2", "iso": "Etc/GMT+2"},
      {"timezone": "Etc/GMT+3", "iso": "Etc/GMT+3"},
      {"timezone": "Etc/GMT+4", "iso": "Etc/GMT+4"},
      {"timezone": "Etc/GMT+5", "iso": "Etc/GMT+5"},
      {"timezone": "Etc/GMT+6", "iso": "Etc/GMT+6"},
      {"timezone": "Etc/GMT+7", "iso": "Etc/GMT+7"},
      {"timezone": "Etc/GMT+8", "iso": "Etc/GMT+8"},
      {"timezone": "Etc/GMT+9", "iso": "Etc/GMT+9"},
      {"timezone": "Etc/GMT-1", "iso": "Etc/GMT-1"},
      {"timezone": "Etc/GMT-10", "iso": "Etc/GMT-10"},
      {"timezone": "Etc/GMT-11", "iso": "Etc/GMT-11"},
      {"timezone": "Etc/GMT-12", "iso": "Etc/GMT-12"},
      {"timezone": "Etc/GMT-13", "iso": "Etc/GMT-13"},
      {"timezone": "Etc/GMT-14", "iso": "Etc/GMT-14"},
      {"timezone": "Etc/GMT-2", "iso": "Etc/GMT-2"},
      {"timezone": "Etc/GMT-3", "iso": "Etc/GMT-3"},
      {"timezone": "Etc/GMT-4", "iso": "Etc/GMT-4"},
      {"timezone": "Etc/GMT-5", "iso": "Etc/GMT-5"},
      {"timezone": "Etc/GMT-6", "iso": "Etc/GMT-6"},
      {"timezone": "Etc/GMT-7", "iso": "Etc/GMT-7"},
      {"timezone": "Etc/GMT-8", "iso": "Etc/GMT-8"},
      {"timezone": "Etc/GMT-9", "iso": "Etc/GMT-9"},
      {"timezone": "Etc/UTC", "iso": "Etc/UTC"},
      {"timezone": "Europe/Andorra", "iso": "AD"},
      {"timezone": "Europe/Astrakhan", "iso": "RU"},
      {"timezone": "Europe/Athens", "iso": "GR"},
      {"timezone": "Europe/Belgrade", "iso": "RS"},
      {"timezone": "Europe/Berlin", "iso": "DE"},
      {"timezone": "Europe/Brussels", "iso": "BE"},
      {"timezone": "Europe/Bucharest", "iso": "RO"},
      {"timezone": "Europe/Budapest", "iso": "HU"},
      {"timezone": "Europe/Chisinau", "iso": "MD"},
      {"timezone": "Europe/Dublin", "iso": "IE"},
      {"timezone": "Europe/Gibraltar", "iso": "GI"},
      {"timezone": "Europe/Helsinki", "iso": "FI"},
      {"timezone": "Europe/Istanbul", "iso": "TR"},
      {"timezone": "Europe/Kaliningrad", "iso": "RU"},
      {"timezone": "Europe/Kirov", "iso": "RU"},
      {"timezone": "Europe/Kyiv", "iso": "UA"},
      {"timezone": "Europe/Lisbon", "iso": "PT"},
      {"timezone": "Europe/London", "iso": "GB"},
      {"timezone": "Europe/Madrid", "iso": "ES"},
      {"timezone": "Europe/Malta", "iso": "MT"},
      {"timezone": "Europe/Minsk", "iso": "BY"},
      {"timezone": "Europe/Moscow", "iso": "RU"},
      {"timezone": "Europe/Paris", "iso": "FR"},
      {"timezone": "Europe/Prague", "iso": "CZ"},
      {"timezone": "Europe/Riga", "iso": "LV"},
      {"timezone": "Europe/Rome", "iso": "IT"},
      {"timezone": "Europe/Samara", "iso": "RU"},
      {"timezone": "Europe/Saratov", "iso": "RU"},
      {"timezone": "Europe/Simferopol", "iso": "RU"},
      {"timezone": "Europe/Sofia", "iso": "BG"},
      {"timezone": "Europe/Tallinn", "iso": "EE"},
      {"timezone": "Europe/Tirane", "iso": "AL"},
      {"timezone": "Europe/Ulyanovsk", "iso": "RU"},
      {"timezone": "Europe/Vienna", "iso": "AT"},
      {"timezone": "Europe/Vilnius", "iso": "LT"},
      {"timezone": "Europe/Volgograd", "iso": "RU"},
      {"timezone": "Europe/Warsaw", "iso": "PL"},
      {"timezone": "Europe/Zurich", "iso": "CH"},
      {"timezone": "HST", "iso": "US"},
      {"timezone": "Indian/Chagos", "iso": "IO"},
      {"timezone": "Indian/Maldives", "iso": "MV"},
      {"timezone": "Indian/Mauritius", "iso": "MU"},
      {"timezone": "MET", "iso": "MET"},
      {"timezone": "MST", "iso": "MST"},
      {"timezone": "MST7MDT", "iso": "MST7MDT"},
      {"timezone": "PST8PDT", "iso": "PST8PDT"},
      {"timezone": "Pacific/Apia", "iso": "WS"},
      {"timezone": "Pacific/Auckland", "iso": "NZ"},
      {"timezone": "Pacific/Bougainville", "iso": "PG"},
      {"timezone": "Pacific/Chatham", "iso": "NZ"},
      {"timezone": "Pacific/Easter", "iso": "CL"},
      {"timezone": "Pacific/Efate", "iso": "VU"},
      {"timezone": "Pacific/Fakaofo", "iso": "TK"},
      {"timezone": "Pacific/Fiji", "iso": "FJ"},
      {"timezone": "Pacific/Galapagos", "iso": "EC"},
      {"timezone": "Pacific/Gambier", "iso": "PF"},
      {"timezone": "Pacific/Guadalcanal", "iso": "SB"},
      {"timezone": "Pacific/Guam", "iso": "GU"},
      {"timezone": "Pacific/Honolulu", "iso": "US"},
      {"timezone": "Pacific/Kanton", "iso": "KI"},
      {"timezone": "Pacific/Kiritimati", "iso": "KI"},
      {"timezone": "Pacific/Kosrae", "iso": "FM"},
      {"timezone": "Pacific/Kwajalein", "iso": "MH"},
      {"timezone": "Pacific/Marquesas", "iso": "PF"},
      {"timezone": "Pacific/Nauru", "iso": "NR"},
      {"timezone": "Pacific/Niue", "iso": "NU"},
      {"timezone": "Pacific/Norfolk", "iso": "NF"},
      {"timezone": "Pacific/Noumea", "iso": "NC"},
      {"timezone": "Pacific/Pago_Pago", "iso": "AS"},
      {"timezone": "Pacific/Palau", "iso": "PW"},
      {"timezone": "Pacific/Pitcairn", "iso": "PN"},
      {"timezone": "Pacific/Port_Moresby", "iso": "PG"},
      {"timezone": "Pacific/Rarotonga", "iso": "CK"},
      {"timezone": "Pacific/Tahiti", "iso": "PF"},
      {"timezone": "Pacific/Tarawa", "iso": "KI"},
      {"timezone": "Pacific/Tongatapu", "iso": "TO"},
      {"timezone": "WET", "iso": "WET"}
    ];

    print(timezones);
  }
}
