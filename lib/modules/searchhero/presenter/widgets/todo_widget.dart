import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:workshop_app/app/modules/home/components/todo/todo_controller.dart';
import 'package:workshop_app/modules/searchhero/presenter/widgets/item_widget.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController controller = Modular.get();
    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    scrollPadding: const EdgeInsets.all(12),
                    decoration: const InputDecoration(labelText: 'Digite um item'),
                    onChanged: controller.setText,
                  ),
                ),
                GestureDetector(
                  child: const Icon(Icons.add),
                  onTap: controller.save,
                )
              ],
            ),
            SizedBox(
              height: 450,
              child: ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (_, index) {
                    return ItemWidget(index: index,);
                  }),
            )
          ],
        ),
      );
    });
  }
}
