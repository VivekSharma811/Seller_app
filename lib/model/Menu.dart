class Menu {
  String? menuId;
  String? sellerUID;
  String? menuInfo;
  String? menuTitle;
  String? publishedDate;
  String? status;
  String? thumbnailUrl;

  Menu(
      {this.menuId,
      this.sellerUID,
      this.menuInfo,
      this.menuTitle,
      this.publishedDate,
      this.status,
      this.thumbnailUrl});

  Menu.fromJson(Map<String, dynamic> json) {
    menuId = json["menuId"];
    sellerUID = json["sellerUID"];
    menuInfo = json["menuInfo"];
    menuTitle = json["menuTitle"];
    publishedDate = json["publishedDate"];
    status = json["status"];
    thumbnailUrl = json["thumbnailUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["menuId"] = menuId;
    data["sellerUID"] = sellerUID;
    data["menuInfo"] = menuInfo;
    data["menuTitle"] = menuTitle;
    data["publishedDate"] = publishedDate;
    data["status"] = status;
    data["thumbnailUrl"] = thumbnailUrl;
    return data;
  }
}
