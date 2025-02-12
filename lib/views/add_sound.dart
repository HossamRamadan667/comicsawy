import 'package:comicsawy/controllers/add_sound_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sounds_controller.dart';

class AddSound extends StatefulWidget {
  const AddSound({super.key});
  @override
  State<AddSound> createState() => _AddSoundState();
}

class _AddSoundState extends State<AddSound> {
  @override
  Widget build(BuildContext context) {
    SoundsController soundsController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Sound'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<AddSoundController>(builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(label: Text('Title')),
                        onSaved: (newValue) => controller.title = newValue!,
                        validator: (value) => controller.validator(
                            value, soundsController.sounds),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: controller.isNewCategory
                          ? TextFormField(
                              decoration: const InputDecoration(
                                  label: Text('Category')),
                              onSaved: (newValue) =>
                                  controller.category = newValue,
                              validator: controller.categoryValidator,
                            )
                          : DropdownButtonFormField(
                              validator: (value) => value == null
                                  ? 'select category first'
                                  : null,
                              value: controller.category,
                              decoration:
                                  const InputDecoration(labelText: 'Category'),
                              items: soundsController.categories
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (val) {
                                controller.category = val!;
                              }),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          OutlinedButton(
                              onPressed: controller.picFile,
                              child: const Text('Select')),
                          const SizedBox(width: 10),
                          Text(controller.fileName)
                        ],
                      ),
                      Row(
                        children: [
                          const Text('New Category'),
                          Checkbox(
                            value: controller.isNewCategory,
                            onChanged: (value) {
                              controller.toggleIsNewCategory();
                            },
                            activeColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () => controller.submit(context),
                    child: const Text('Upload'))
              ],
            ),
          );
        }),
      ),
    );
  }
}
