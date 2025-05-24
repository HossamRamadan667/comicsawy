import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:comicsawy/src/core/networking/api_result.dart';
import 'package:comicsawy/src/features/home/data/repos/sounds_repo.dart';
import 'package:comicsawy/src/features/home/logic/cubit/sounds_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<SoundsState<Map<String, List<SoundModel>>>> {
  final SoundsRepo soundsRepo;
  HomePageCubit(this.soundsRepo) : super(SoundsState.idle());

  void emitSounds() async {
    ApiResult<Map<String, List<SoundModel>>> response =
        await soundsRepo.getSoundsSortedByCategory();
    response.when(
      success: (sounds) {
        emit(SoundsState.success(sounds));
      },
      fail: (errorMessage) => emit(SoundsState.fail(errorMessage)),
    );
  }
}
