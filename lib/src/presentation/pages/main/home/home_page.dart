import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/widgets/home_page_view.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
              if (state is HomeLoadingState || state is HomeInitialState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (state is SuccessDataState) {
                return HomePageView(
                  bloc: bloc,
                  banner: state.banner,
                  category: state.product,
                );
              }
              if (state is SuccessSearchState) {
                return HomePageView(
                  bloc: bloc,
                  searchModel: state.searchProduct,
                );
              }
              if (state is HomeErrorState) {
                return Center(
                  child: Text(state.error),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ),
      );
}
