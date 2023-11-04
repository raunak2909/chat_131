import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:talklytic/API/Api_helper.dart';
import 'package:talklytic/API/Api_urls.dart';
import 'package:talklytic/API/myException.dart';

import '../../Data/GIPHY/Trending_Modal/GifData_Modal.dart';

part 'trending_gif_event.dart';
part 'trending_gif_state.dart';

class TrendingGifBloc extends Bloc<TrendingGifEvent, TrendingGifState> {
  ApiHelper apiHelper;
  TrendingGifBloc({required this.apiHelper}) : super(TrendingGifInitial()) {
    on<TrendingGifEvent>((event, emit) async {
      emit(TrendingGifLoadingState());
      try {
        var res = await apiHelper.getApiData(url: Gif_api_url.trending_url);
        print('object$res');
        emit(
            TrendingGifLoadedState(mainDataModal: MainDataModal.fromJson(res)));
      } catch (e) {
        if (e is FetchDataException) {
          emit(TrendingInternetErrorState(errorMsg: e.ToString()));
        } else {
          emit(TrendingGifErrorState(
              errorMsg: (e is MyException) ? e.ToString() : 'Unknown Error'));
        }
      }
    });
  }
}
