class TicketModelEntity {
	double commentScore;
	int subCategoryId;
	int cityId;
	int startingPrice;
	String subCategoryName;
	String cover;
	String mainCategoryName;
	String cityName;
	String name;
	int id;
	List<TicketModelTag> tag;
	int colourType;
	int mainCategoryId;
	int ticketFlag;
	int sellNum;
	int status;

	TicketModelEntity({this.commentScore, this.subCategoryId, this.cityId, this.startingPrice, this.subCategoryName, this.cover, this.mainCategoryName, this.cityName, this.name, this.id, this.tag, this.colourType, this.mainCategoryId, this.ticketFlag, this.sellNum, this.status});

	TicketModelEntity.fromJson(Map<String, dynamic> json) {
		commentScore = json['commentScore'];
		subCategoryId = json['subCategoryId'];
		cityId = json['cityId'];
		startingPrice = json['startingPrice'];
		subCategoryName = json['subCategoryName'];
		cover = json['cover'];
		mainCategoryName = json['mainCategoryName'];
		cityName = json['cityName'];
		name = json['name'];
		id = json['id'];
		if (json['tag'] != null) {
			tag = new List<TicketModelTag>();(json['tag'] as List).forEach((v) { tag.add(new TicketModelTag.fromJson(v)); });
		}
		colourType = json['colourType'];
		mainCategoryId = json['mainCategoryId'];
		ticketFlag = json['ticketFlag'];
		sellNum = json['sellNum'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['commentScore'] = this.commentScore;
		data['subCategoryId'] = this.subCategoryId;
		data['cityId'] = this.cityId;
		data['startingPrice'] = this.startingPrice;
		data['subCategoryName'] = this.subCategoryName;
		data['cover'] = this.cover;
		data['mainCategoryName'] = this.mainCategoryName;
		data['cityName'] = this.cityName;
		data['name'] = this.name;
		data['id'] = this.id;
		if (this.tag != null) {
      data['tag'] =  this.tag.map((v) => v.toJson()).toList();
    }
		data['colourType'] = this.colourType;
		data['mainCategoryId'] = this.mainCategoryId;
		data['ticketFlag'] = this.ticketFlag;
		data['sellNum'] = this.sellNum;
		data['status'] = this.status;
		return data;
	}
}

class TicketModelTag {
	int code;
	String name;
	int type;

	TicketModelTag({this.code, this.name, this.type});

	TicketModelTag.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		name = json['name'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['name'] = this.name;
		data['type'] = this.type;
		return data;
	}
}
