class Validator {
  static String isEmpty(String? value) {
    if (value == null || value.trim() == "") {
      return "Campo obrigatório";
    }

    return "";
  }
}
