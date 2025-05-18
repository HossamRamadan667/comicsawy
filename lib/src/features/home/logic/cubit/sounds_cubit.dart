import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:comicsawy/src/core/networking/api_result.dart';
import 'package:comicsawy/src/features/home/data/repos/sounds_repo.dart';
import 'package:comicsawy/src/features/home/logic/cubit/sounds_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SoundsCubit extends Cubit<SoundsState> {
  final SoundsRepo soundsRepo;
  SoundsCubit(this.soundsRepo) : super(SoundsState.idle());

  void emitSounds() async {
    ApiResult<Map<String, List<SoundModel>>> response =
        await soundsRepo.getAllSound();
    response.when(
      success: (sounds) => emit(SoundsState.success(sounds)),
      fail: (errorMessage) => emit(SoundsState.fail(errorMessage)),
    );
  }
}
