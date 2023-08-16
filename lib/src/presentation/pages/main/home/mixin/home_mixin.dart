part of 'package:ploff_and_kebab/src/presentation/pages/main/home/home_page.dart';

mixin HomeMixin on State<HomePage> {
  late final HomeBloc bloc;

  @override
  void initState() {
    bloc = context.read<HomeBloc>();
    initEvents();
    super.initState();
  }
  void initEvents(){
    bloc.add(GetMobileApp());
    bloc.add(GetCategoryEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
