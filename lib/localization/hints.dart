class HintTexts {
  final String searchHint;
  final String clearSearchTooltip;
  final String zoomInTooltip;
  final String zoomOutTooltip;
  final String showFilter;
  final String hideFilter;
  final String cartoCredit;
  final String openDirectory;
  final String copyPhoneNumber;
  final String copyEmail;
  final String phoneNumberCopied;
  final String emailCopied;
  final String openWebsite;
  final String openMaps;
  final String mapsDirections;
  final String openingHours;
  final String monday;
  final String tuesday;
  final String wednesday;
  final String thursday;
  final String friday;
  final String saturday;
  final String sunday;
  final String reviews;
  final String review;

  const HintTexts({
    required this.searchHint,
    required this.clearSearchTooltip,
    required this.zoomInTooltip,
    required this.zoomOutTooltip,
    required this.showFilter,
    required this.hideFilter,
    this.cartoCredit = '© CARTO',
    this.openDirectory = 'Open directory',
    this.copyPhoneNumber = 'Copy phone number',
    this.phoneNumberCopied = 'Phone number copied',
    this.copyEmail = 'Copy email',
    this.emailCopied = 'Email copied',
    this.openWebsite = 'Open website',
    this.openMaps = 'Open in Maps',
    this.mapsDirections = 'Get Directions on Maps',
    this.openingHours = 'Opening Hours',
    this.monday = 'Monday',
    this.tuesday = 'Tuesday',
    this.wednesday = 'Wednesday',
    this.thursday = 'Thursday',
    this.friday = 'Friday',
    this.saturday = 'Saturday',
    this.sunday = 'Sunday',
    this.reviews = 'reviews',
    this.review = 'review',
  });

  static HintTexts of(String languageCode) {
    switch (languageCode.toLowerCase()) {
      case 'es':
        return const HintTexts(
          searchHint: 'Buscar ubicaciones o categorías...',
          clearSearchTooltip: 'Borrar búsqueda',
          zoomInTooltip: 'Acercar',
          zoomOutTooltip: 'Alejar',
          showFilter: 'Mostrar filtro',
          hideFilter: 'Ocultar filtro',
          openDirectory: 'Abrir directorio',
          copyPhoneNumber: 'Copiar número',
          phoneNumberCopied: 'Número copiado',
          copyEmail: 'Copiar correo',
          emailCopied: 'Correo copiado',
          openWebsite: 'Abrir sitio web',
          openMaps: 'Abrir en Maps',
          mapsDirections: 'Cómo llegar en Maps',
          openingHours: 'Horario',
          monday: 'Lunes',
          tuesday: 'Martes',
          wednesday: 'Miércoles',
          thursday: 'Jueves',
          friday: 'Viernes',
          saturday: 'Sábado',
          sunday: 'Domingo',
          reviews: 'reseñas',
          review: 'reseña',
        );
      case 'fr':
        return const HintTexts(
          searchHint: 'Rechercher des lieux ou des catégories...',
          clearSearchTooltip: 'Effacer la recherche',
          zoomInTooltip: 'Zoomer',
          zoomOutTooltip: 'Dézoomer',
          showFilter: 'Afficher les filtres',
          hideFilter: 'Masquer les filtres',
          openDirectory: 'Ouvrir l’annuaire',
          copyPhoneNumber: 'Copier le numéro',
          phoneNumberCopied: 'Numéro copié',
          copyEmail: 'Copier l’e-mail',
          emailCopied: 'E-mail copié',
          openWebsite: 'Ouvrir le site',
          openMaps: 'Ouvrir dans Maps',
          mapsDirections: 'Obtenir l’itinéraire dans Maps',
          openingHours: 'Heures d\'ouverture',
          monday: 'Lundi',
          tuesday: 'Mardi',
          wednesday: 'Mercredi',
          thursday: 'Jeudi',
          friday: 'Vendredi',
          saturday: 'Samedi',
          sunday: 'Dimanche',
          reviews: 'avis',
          review: 'avis',
        );
      case 'de':
        return const HintTexts(
          searchHint: 'Standorte oder Kategorien suchen...',
          clearSearchTooltip: 'Suche löschen',
          zoomInTooltip: 'Vergrößern',
          zoomOutTooltip: 'Verkleinern',
          showFilter: 'Filter anzeigen',
          hideFilter: 'Filter ausblenden',
          openDirectory: 'Verzeichnis öffnen',
          copyPhoneNumber: 'Telefonnummer kopieren',
          phoneNumberCopied: 'Nummer kopiert',
          copyEmail: 'E-Mail kopieren',
          emailCopied: 'E-Mail kopiert',
          openWebsite: 'Website öffnen',
          openMaps: 'In Maps öffnen',
          mapsDirections: 'Route in Maps anzeigen',
          openingHours: 'Öffnungszeiten',
          monday: 'Montag',
          tuesday: 'Dienstag',
          wednesday: 'Mittwoch',
          thursday: 'Donnerstag',
          friday: 'Freitag',
          saturday: 'Samstag',
          sunday: 'Sonntag',
          reviews: 'Bewertungen',
          review: 'Bewertung',
        );
      case 'nl':
        return const HintTexts(
          searchHint: 'Zoek locaties of categorieën...',
          clearSearchTooltip: 'Zoekopdracht wissen',
          zoomInTooltip: 'Inzoomen',
          zoomOutTooltip: 'Uitzoomen',
          showFilter: 'Filter tonen',
          hideFilter: 'Filter verbergen',
          openDirectory: 'Open gids',
          copyPhoneNumber: 'Telefoonnummer kopiëren',
          phoneNumberCopied: 'Nummer gekopieerd',
          copyEmail: 'E-mailadres kopiëren',
          emailCopied: 'E-mailadres gekopieerd',
          openWebsite: 'Website openen',
          openMaps: 'Openen in Maps',
          mapsDirections: 'Routebeschrijving in Maps',
          openingHours: 'Openingstijden',
          monday: 'Maandag',
          tuesday: 'Dinsdag',
          wednesday: 'Woensdag',
          thursday: 'Donderdag',
          friday: 'Vrijdag',
          saturday: 'Zaterdag',
          sunday: 'Zondag',
          reviews: 'beoordelingen',
          review: 'beoordeling',
        );
      case 'ru':
        return const HintTexts(
          searchHint: 'Поиск мест или категорий...',
          clearSearchTooltip: 'Очистить поиск',
          zoomInTooltip: 'Приблизить',
          zoomOutTooltip: 'Отдалить',
          showFilter: 'Показать фильтр',
          hideFilter: 'Скрыть фильтр',
          openDirectory: 'Открыть справочник',
          copyPhoneNumber: 'Скопировать номер',
          phoneNumberCopied: 'Номер скопирован',
          copyEmail: 'Скопировать email',
          emailCopied: 'Email скопирован',
          openWebsite: 'Открыть сайт',
          openMaps: 'Открыть в Maps',
          mapsDirections: 'Проложить маршрут в Maps',
          openingHours: 'Часы работы',
          monday: 'Понедельник',
          tuesday: 'Вторник',
          wednesday: 'Среда',
          thursday: 'Четверг',
          friday: 'Пятница',
          saturday: 'Суббота',
          sunday: 'Воскресенье',
          reviews: 'отзывы',
          review: 'отзыв',
        );
      case 'it':
        return const HintTexts(
          searchHint: 'Cerca luoghi o categorie...',
          clearSearchTooltip: 'Cancella ricerca',
          zoomInTooltip: 'Zoom avanti',
          zoomOutTooltip: 'Zoom indietro',
          showFilter: 'Mostra filtri',
          hideFilter: 'Nascondi filtri',
          openDirectory: 'Apri directory',
          copyPhoneNumber: 'Copia numero',
          phoneNumberCopied: 'Numero copiato',
          copyEmail: 'Copia email',
          emailCopied: 'Email copiata',
          openWebsite: 'Apri sito web',
          openMaps: 'Apri in Maps',
          mapsDirections: 'Indicazioni su Maps',
          openingHours: 'Orari di apertura',
          monday: 'Lunedì',
          tuesday: 'Martedì',
          wednesday: 'Mercoledì',
          thursday: 'Giovedì',
          friday: 'Venerdì',
          saturday: 'Sabato',
          sunday: 'Domenica',
          reviews: 'recensioni',
          review: 'recensione',
        );
      default:
        return const HintTexts(
          searchHint: 'Search locations or categories...',
          clearSearchTooltip: 'Clear search',
          zoomInTooltip: 'Zoom in',
          zoomOutTooltip: 'Zoom out',
          showFilter: 'Show filter',
          hideFilter: 'Hide filter',
          openDirectory: 'Open directory',
          copyPhoneNumber: 'Copy phone number',
          phoneNumberCopied: 'Phone number copied',
          copyEmail: 'Copy email',
          emailCopied: 'Email copied',
          openWebsite: 'Open website',
          openMaps: 'Open in Maps',
          mapsDirections: 'Get Directions on Maps',
          openingHours: 'Opening Hours',
          monday: 'Monday',
          tuesday: 'Tuesday',
          wednesday: 'Wednesday',
          thursday: 'Thursday',
          friday: 'Friday',
          saturday: 'Saturday',
          sunday: 'Sunday',
          reviews: 'reviews',
          review: 'review',
        );

    }
  }
}
