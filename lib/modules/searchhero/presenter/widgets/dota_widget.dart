import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/modules/searchhero/presenter/states/bloc/search_hero_bloc.dart';

import '../../domain/entities/hero_model.dart';

class DotaWidget extends StatelessWidget {
  final bloc = Modular.get<SearchHeroBloc>();

  DotaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bloc.add(const SearchEvent());
    return Container(
      padding: const EdgeInsets.all(2),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<SearchHeroBloc, SearchHeroState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is ErrorSearchState) {
              return const Center(
                child: Text('Houve um erro'),
              );
            }
            if (state is LoadSearchState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SearchHeroInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final list = (state as SuccessSearchState).result;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  HeroModel hero = list[index];
                  return Card(
                    child: SizedBox(
                      height: 80,
                      child: ListTile(
                        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        leading: CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.grey,
                          backgroundImage: hero.img != null
                              ? NetworkImage(
                                  "https://steamcdn-a.akamaihd.net/" +
                                      hero.img!)
                              : null,
                        ),
                        title: Text(
                          hero.localizedName ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Text(
                          "id: ${hero.heroId} ProWin: ${hero.proWin} \nProPick:${hero.proPick} ProBam: ${hero.proBan}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
