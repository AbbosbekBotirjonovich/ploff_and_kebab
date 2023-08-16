import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:ploff_and_kebab/src/presentation/pages/main/home/home_page_view.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            if (state is HomeLoadingState || state is HomeInitialState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is SuccessDataState) {
              return HomePageView(
                product: state.product,
                bloc: bloc,
                banner: state.banner,
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
      );
}
