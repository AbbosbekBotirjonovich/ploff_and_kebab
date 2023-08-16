part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();
}

class BannerInitial extends BannerState {
  @override
  List<Object> get props => [];
}
class SuccessBannerState extends BannerState {
  final BannerModel banner;

  const SuccessBannerState({required this.banner});

  @override
  List<Object?> get props => [banner];
}
class BannerErrorState extends BannerState {
  final String error;

  const BannerErrorState({required this.error});

  @override
  List<Object?> get props => [];
}
