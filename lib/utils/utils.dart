class Utils {

  String calculateAndReturnDateDifferences(DateTime dbDate) {
    // Get the current date
    DateTime currentDate = DateTime.now();

    // Calculate the difference in days
    int daysDifference = currentDate.difference(dbDate).inDays;

    if (daysDifference == 0) {
      return 'Today';
    } else if (daysDifference >= 30 && daysDifference < 365) {
      // Calculate months difference
      int monthsDifference = (currentDate.year - dbDate.year) * 12 + (currentDate.month - dbDate.month);
      if (dbDate.day > currentDate.day) {
        monthsDifference--; // Adjust if current day is earlier in the month
      }
      return '$monthsDifference Months Ago';
    } else if (daysDifference >= 365) {
      // Calculate years difference
      int yearsDifference = currentDate.year - dbDate.year;
      if (dbDate.month > currentDate.month || (dbDate.month == currentDate.month && dbDate.day > currentDate.day)) {
        yearsDifference--; // Adjust if current date hasn't reached the dbDate month/day
      }
      return '$yearsDifference Years Ago';
    } else {
      return '$daysDifference Days Ago';
    }
  }
}