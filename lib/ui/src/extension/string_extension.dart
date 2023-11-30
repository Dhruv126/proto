extension ValidateString on String? {
  bool isEmailValid() {
    if (this != null)
      return RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(this!);
    else
      return false;
  }

  bool isAlphaNumericValid() {
    if (this != null)
      return RegExp(r'^[a-zA-Z0-9\-]+$').hasMatch(this!);
    else
      return false;
  }

  bool isNullOrEmpty() {
    return this == null || this!.trim().isEmpty;
  }

  bool isNull() {
    return this == null;
  }

  bool hasEqualLength(int value) {
    return this!.length == value;
  }

  bool hasLessLength(int value) {
    return this!.length < value;
  }

  bool hasRangeValue(int lowerValue, upperValue) {
    return this!.length >= lowerValue && this!.length <= upperValue;
  }

  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null;
  }

  bool isYoutubeUrl() {
    if (this != null)
      return RegExp(
              r'((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?')
          .hasMatch(this!);
    else
      return false;
  }
}
