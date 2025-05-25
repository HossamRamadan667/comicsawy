import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:comicsawy/src/features/home/logic/cubit/home_page_cubit.dart';
import 'package:comicsawy/src/features/home/logic/cubit/sounds_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/sound_by_category_drop_down.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomePageCubit>(context).emitSounds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit,
        SoundsState<Map<String, List<SoundModel>>>>(
      builder: (context, state) {
        return state.when(
          idle: () {
            return const Center(child: CircularProgressIndicator());
          },
          success: (soundsResponse) {
            List<String> categories = soundsResponse.keys.toList()..sort();
            return Container(
              margin: EdgeInsets.only(top: 17.h),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(
                            bottom: index + 1 >= categories.length ? 80.h : 0),
                        child: SoundByCategoryDropDown(
                            soundsByCategory:
                                soundsResponse[categories.elementAt(index)]!,
                            category: categories.elementAt(index)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          fail: (errorMessage) {
            return Center(child: Text(errorMessage));
          },
        );
      },
    );
  }
}
