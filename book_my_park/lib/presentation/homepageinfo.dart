import 'package:book_my_park/application/bloc/parkdata_bloc.dart';
import 'package:book_my_park/presentation/infopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageInfo extends StatelessWidget {
  const HomepageInfo({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ParkdataBloc>(context).add(const ParkdataEvent.getdata());
    });
    return BlocBuilder<ParkdataBloc, ParkdataState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: state.parkdata.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${state.parkdata[index].name}',
                    style: const TextStyle(color: Colors.white)),
                subtitle: const Text("Available"),
                trailing: const Icon(Icons.local_parking_rounded,
                    color: Colors.green),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoAboutPark(
                                index: index,
                              )));
                },
              );
            });
      },
    );
  }
}
