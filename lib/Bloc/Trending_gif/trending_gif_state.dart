// ignore_for_file: must_be_immutable

part of 'trending_gif_bloc.dart';

@immutable
sealed class TrendingGifState {}

final class TrendingGifInitial extends TrendingGifState {}

final class TrendingGifLoadingState extends TrendingGifState {}

final class TrendingGifLoadedState extends TrendingGifState {
  MainDataModal mainDataModal;
  TrendingGifLoadedState({required this.mainDataModal});
}
final class TrendingGifErrorState extends TrendingGifState
{
  String errorMsg;
  TrendingGifErrorState({required this.errorMsg});
}

final class TrendingInternetErrorState extends TrendingGifState
{
  String errorMsg;
  TrendingInternetErrorState({required this.errorMsg});
}