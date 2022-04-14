class HeroModel {
  int? id;
  String? name;
  String? localizedName;
  String? img;
  String? icon;
  int? proWin;
  int? proPick;
  int? heroId;
  int? proBan;
  int? i1Pick;
  int? i1Win;
  int? i2Pick;
  int? i2Win;
  int? i3Pick;
  int? i3Win;
  int? i4Pick;
  int? i4Win;
  int? i5Pick;
  int? i5Win;
  int? i6Pick;
  int? i6Win;
  int? i7Pick;
  int? i7Win;

  HeroModel(
      {this.id,
      this.name,
      this.localizedName,
      this.img,
      this.icon,
      this.proWin,
      this.proPick,
      this.heroId,
      this.proBan,
      this.i1Pick,
      this.i1Win,
      this.i2Pick,
      this.i2Win,
      this.i3Pick,
      this.i3Win,
      this.i4Pick,
      this.i4Win,
      this.i5Pick,
      this.i5Win,
      this.i6Pick,
      this.i6Win,
      this.i7Pick,
      this.i7Win});

  HeroModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    img = json['img'];
    icon = json['icon'];
    proWin = json['pro_win'];
    proPick = json['pro_pick'];
    heroId = json['hero_id'];
    proBan = json['pro_ban'];
    i1Pick = json['1_pick'];
    i1Win = json['1_win'];
    i2Pick = json['2_pick'];
    i2Win = json['2_win'];
    i3Pick = json['3_pick'];
    i3Win = json['3_win'];
    i4Pick = json['4_pick'];
    i4Win = json['4_win'];
    i5Pick = json['5_pick'];
    i5Win = json['5_win'];
    i6Pick = json['6_pick'];
    i6Win = json['6_win'];
    i7Pick = json['7_pick'];
    i7Win = json['7_win'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['localized_name'] = localizedName;
    data['img'] = img;
    data['icon'] = icon;
    data['pro_win'] = proWin;
    data['pro_pick'] = proPick;
    data['hero_id'] = heroId;
    data['pro_ban'] = proBan;
    data['1_pick'] = i1Pick;
    data['1_win'] = i1Win;
    data['2_pick'] = i2Pick;
    data['2_win'] = i2Win;
    data['3_pick'] = i3Pick;
    data['3_win'] = i3Win;
    data['4_pick'] = i4Pick;
    data['4_win'] = i4Win;
    data['5_pick'] = i5Pick;
    data['5_win'] = i5Win;
    data['6_pick'] = i6Pick;
    data['6_win'] = i6Win;
    data['7_pick'] = i7Pick;
    data['7_win'] = i7Win;
    return data;
  }
}
