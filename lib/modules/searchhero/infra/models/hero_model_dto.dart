import 'package:workshop_app/modules/searchhero/domain/entities/hero_model.dart';

class HeroModelDto extends HeroModel {
  int? idDto;
  String? nameDto;
  String? localizedNameDto;
  String? imgDto;
  String? iconDto;
  int? proWinDto;
  int? proPickDto;
  int? heroIdDto;
  int? proBanDto;
  int? i1PickDto;
  int? i1WinDto;
  int? i2PickDto;
  int? i2WinDto;
  int? i3PickDto;
  int? i3WinDto;
  int? i4PickDto;
  int? i4WinDto;
  int? i5PickDto;
  int? i5WinDto;
  int? i6PickDto;
  int? i6WinDto;
  int? i7PickDto;
  int? i7WinDto;

  HeroModelDto(
      {required this.idDto,
      required this.nameDto,
      required this.localizedNameDto,
      required this.imgDto,
      required this.iconDto,
      required this.proWinDto,
      required this.proPickDto,
      required this.heroIdDto,
      required this.proBanDto,
      required this.i1PickDto,
      required this.i1WinDto,
      required this.i2PickDto,
      required this.i2WinDto,
      required this.i3PickDto,
      required this.i3WinDto,
      required this.i4PickDto,
      required this.i4WinDto,
      required this.i5PickDto,
      required this.i5WinDto,
      required this.i6PickDto,
      required this.i6WinDto,
      required this.i7PickDto,
      required this.i7WinDto})
      : super(
          heroId: heroIdDto,
          icon: iconDto,
          id: idDto,
          img: imgDto,
          name: nameDto,
          proBan: proBanDto,
          proPick: proPickDto,
          proWin: proWinDto,
          localizedName: localizedNameDto,
          i1Pick: i1PickDto,
          i1Win: i1WinDto,
          i2Pick: i2PickDto,
          i2Win: i2WinDto,
          i3Pick: i3PickDto,
          i3Win: i3WinDto,
          i4Pick: i4PickDto,
          i4Win: i4WinDto,
          i5Pick: i5PickDto,
          i5Win: i5WinDto,
          i6Pick: i6PickDto,
          i6Win: i6WinDto,
          i7Pick: i7PickDto,
          i7Win: i7WinDto,
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = idDto;
    data['name'] = nameDto;
    data['localized_name'] = localizedNameDto;
    data['img'] = imgDto;
    data['icon'] = iconDto;
    data['pro_win'] = proWinDto;
    data['pro_pick'] = proPickDto;
    data['hero_id'] = heroIdDto;
    data['pro_ban'] = proBanDto;
    data['1_pick'] = i1PickDto;
    data['1_win'] = i1WinDto;
    data['2_pick'] = i2PickDto;
    data['2_win'] = i2WinDto;
    data['3_pick'] = i3PickDto;
    data['3_win'] = i3WinDto;
    data['4_pick'] = i4PickDto;
    data['4_win'] = i4WinDto;
    data['5_pick'] = i5PickDto;
    data['5_win'] = i5WinDto;
    data['6_pick'] = i6PickDto;
    data['6_win'] = i6WinDto;
    data['7_pick'] = i7PickDto;
    data['7_win'] = i7WinDto;
    return data;
  }

  factory HeroModelDto.fromJson(Map<String, dynamic> map) {
    return HeroModelDto(
        idDto: map['id'],
        nameDto: map['name'],
        localizedNameDto: map['localized_name'],
        imgDto: map['img'],
        iconDto: map['icon'],
        proWinDto: map['pro_win'],
        proPickDto: map['pro_pick'],
        heroIdDto: map['hero_id'],
        proBanDto: map['pro_ban'],
        i1PickDto: map['1_pick'],
        i1WinDto: map['1_win'],
        i2PickDto: map['2_pick'],
        i2WinDto: map['2_win'],
        i3PickDto: map['3_pick'],
        i3WinDto: map['3_win'],
        i4PickDto: map['4_pick'],
        i4WinDto: map['4_win'],
        i5PickDto: map['5_pick'],
        i5WinDto: map['5_win'],
        i6PickDto: map['6_pick'],
        i6WinDto: map['6_win'],
        i7PickDto: map['7_pick'],
        i7WinDto: map['7_win']);
  }
}
