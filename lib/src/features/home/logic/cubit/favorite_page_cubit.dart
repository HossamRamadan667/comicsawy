import 'package:comicsawy/src/features/home/data/models/sound_model.dart';
import 'package:comicsawy/src/core/networking/api_result.dart';
import 'package:comicsawy/src/features/home/data/repos/sounds_repo.dart';
import 'package:comicsawy/src/features/home/logic/cubit/sounds_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPageCubit extends Cubit<SoundsState<List<SoundModel>>> {
  final SoundsRepo soundsRepo;
  FavoritesPageCubit(this.soundsRepo) : super(SoundsState.idle());

  void emitFavorites() async {
    ApiResult<List<SoundModel>> response = await soundsRepo.getFavorites();
    response.when(
      success: (sounds) {
        emit(SoundsState.success(sounds));
      },
      fail: (errorMessage) => emit(SoundsState.fail(errorMessage)),
    );
  }
}
