import 'package:comicsawy/providers/add_sound_provider.dart';
import 'package:comicsawy/providers/sounds_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../models/sound_model.dart';

class AddSound extends ConsumerStatefulWidget {
  const AddSound({super.key});
  @override
  ConsumerState<AddSound> createState() => _AddSoundState();
}

class _AddSoundState extends ConsumerState<AddSound> {
  @override
  Widget build(BuildContext context) {
    List<Sound> sounds = ref.watch(soundsProvider);
    List<String> categories = ref.watch(soundsProvider.notifier).categories;
    GlobalKey<FormState> formKey = ref.watch(addSoundProvider);
    AddSoundNotifier formController = ref.watch(addSoundProvider.notifier);
    formController.setState = setState;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Sound'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(label: Text('Title')),
                      onSaved: (newValue) => formController.title = newValue!,
                      validator: (value) =>
                          formController.validator(value, sounds),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: formController.isNewCategory
                        ? TextFormField(
                            decoration:
                                const InputDecoration(label: Text('Category')),
                            onSaved: (newValue) =>
                                formController.category = newValue,
                            validator: formController.categoryValidator,
                          )
                        : DropdownButtonFormField(
                            validator: (value) =>
                                value == null ? 'select category first' : null,
                            value: formController.category,
                            decoration:
                                const InputDecoration(labelText: 'Category'),
                            items: categories
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              formController.category = val!;
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
                            onPressed: formController.picFile,
                            child: const Text('Select')),
                        SizedBox(width: 10),
                        Text(formController.fileName)
                      ],
                    ),
                    Row(
                      children: [
                        const Text('New Category'),
                        Checkbox(
                          value: formController.isNewCategory,
                          onChanged: (value) {
                            formController.toggleIsNewCategory();
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () => formController.submit(context),
                  child: const Text('Upload'))
            ],
          ),
        ),
      ),
    );
  }
}
