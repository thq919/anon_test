import 'package:anon_test/features/record_history_screen/presentation/bloc/bloc_record_history.dart';
import 'package:anon_test/features/record_history_screen/presentation/bloc/bloc_record_history_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonPlusHistory extends StatelessWidget {
  const ButtonPlusHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        _pushRecordHistoryPage(context);
      }),
      child: const SizedBox(
          height: 34,
          width: 34,
          child: DecoratedBox(
            decoration:
                BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }

  void _pushRecordHistoryPage(BuildContext context) {
    BlocProvider.of<BlocRecordScreen>(context).add(InitialEvent());
    Navigator.of(context).popAndPushNamed('/recordHistory').then((_) =>
        BlocProvider.of<BlocRecordScreen>(context).add(DropControllerEvent()));
  }
}
