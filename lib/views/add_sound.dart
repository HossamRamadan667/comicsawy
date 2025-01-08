import 'package:comicsawy/providers/categories_provider.dart';
import 'package:comicsawy/providers/add_sound_provider.dart';
import 'package:comicsawy/providers/sounds_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../models/sound_model.dart';

class AddSound extends ConsumerWidget {
  const AddSound({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Sound> sounds = ref.watch(soundsProvider);
    List<String> categories = ref.watch(categoriesProvider);
    GlobalKey<FormState> formKey = ref.watch(addSoundProvider);
    AddSoundNotifier formController = ref.watch(addSoundProvider.notifier);

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
                    child: DropdownButtonFormField(
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: formController.picFile,
                        child: const Text('Select')),
                    ElevatedButton(
                        onPressed: () => formController.submit(context),
                        child: const Text('Upload'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
