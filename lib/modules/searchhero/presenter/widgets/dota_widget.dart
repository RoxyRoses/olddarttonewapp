import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/home/components/dota/dota_controller.dart';

import '../../domain/entities/hero_model.dart';

class DotaWidget extends StatelessWidget {
  final DotaController controller = Modular.get<DotaController>();

 DotaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.listHero!.value == null) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.listHero!.error != null) {
        return Center(
          child: Column(
            children: [
              const Text('Algum erro aconteceu'),
              TextButton(
                  onPressed: controller.getHeros, child: const Text('Try again'))
            ],
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.all(2),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: controller.listHero!.value!.length,
                itemBuilder: (context, index) {
                  HeroModel hero = controller.listHero!.value![index];
                  return Card(
                    child: SizedBox(
                      height: 80,
                      child: ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.grey,
                          backgroundImage: hero.img != null 
                          ? NetworkImage("https://steamcdn-a.akamaihd.net/"+hero.img!)
                          : null,
                        ),
                        title: Text(
                          hero.localizedName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                          ),
                        subtitle: Text(
                          "id: ${hero.heroId} ProWin: ${hero.proWin} \nProPick:${hero.proPick} ProBam: ${hero.proBan}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                          ),
                          ),
                        ),
                      ),
                  );
                }),
          ),
        );
      }
    });
  }
}
