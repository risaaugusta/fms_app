part of '../pages.dart';

abstract class LoadingBar{
  static void dialogLoading(BuildContext context) async {

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return  Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children:
                [
                  CircularProgressIndicator(
                    color: Coloring.mainColor,
                  )
                ]
            )
          )
        );
      },
    );
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.of(context,
    rootNavigator: true).pop('dialog');
  }
}