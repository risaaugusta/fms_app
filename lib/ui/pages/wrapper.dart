// wrapper is a relation with bloc. which screen are showed
part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    BlocProvider.of<PageBloc>(context).add(GoToWelcome());

    return BlocBuilder<PageBloc, PageState>(
      builder: (context, pageState) {
        if (pageState is OnWelcome) {
          return Welcome();
        }  else if (pageState is OnLogin) {
          return Login();
        }else {
          return Login();
        }
      },
    );
  }
}
