class Helper {
  static List fromDatabase(List listData, object) {
    return List<dynamic>.from(
        listData.map((jsonData) => object.fromJson(jsonData)));
  }
}
