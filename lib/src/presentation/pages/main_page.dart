import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:testapp/src/presentation/bloc/trip/trip_bloc.dart';
import 'package:testapp/src/presentation/widgets/common_form_field.dart';

import '../../../service_locator.dart';
import '../widgets/common_button.dart';
import '../widgets/trip_widget.dart';

class MainPage extends StatelessWidget {
  TextEditingController departureCity = TextEditingController();
  TextEditingController destinationCity = TextEditingController();
  TextEditingController date = TextEditingController();

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (_) => sl<TripBloc>()..add(LoadTrips(departureCity: 'Казань', destinationCity: 'Уфа', date: '2024-02-20')),
        child: BlocBuilder<TripBloc, TripState>(
          builder: (ctx, state) {
            if(state.status == TripStatus.error){
              return const Center(
                child: Text('Ошибка при загрузке данных'),
              );
            }

            if(state.status == TripStatus.loaded){
              date.text = state.date;

              return Container(
                padding: const EdgeInsets.all(16),
                child: RefreshIndicator(
                  onRefresh: () async {
                    ctx.read<TripBloc>().add(
                      LoadTrips(
                        departureCity: 'Казань',
                        destinationCity: 'Уфа',
                        date: '2024-02-20',
                      ),
                    );
                  },
                  child: SingleChildScrollView(
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(),
                        const SizedBox(height: 50,),
                        _form(ctx),
                        const SizedBox(height: 50,),
                        _body(state)
                      ],
                    ),
                  ),
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget _header(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('Поиск поездок',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic
          ),
        ),
        Icon(Icons.trip_origin)
      ],
    );
  }

  Widget _form(BuildContext ctx){
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.arrow_circle_down_rounded,
              color: Colors.lightGreen,
            ),
            const SizedBox(width: 10,),
            Expanded(
                child: CustomFormField(
                    name: 'Откуда',
                    textEditingController: departureCity,
                )
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.lightGreen,
            ),
            const SizedBox(width: 10,),
            Expanded(
                child: CustomFormField(
                    name: 'Куда',
                    textEditingController: destinationCity,
                )
            )
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: Colors.lightGreen,
            ),
            const SizedBox(width: 10,),
            Expanded(
                child: TextFormField(
                  controller: date,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: ctx,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101)
                    );
                    if(pickedDate != null ){
                      print(pickedDate);
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate);
                      ctx.read<TripBloc>().add(SelectDate(date: formattedDate));
                    }
                  },
                  decoration: InputDecoration(
                      hintText: 'Дата',
                      hintStyle: TextStyle(color: Color.fromRGBO(208, 208, 208, 1)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(234, 235, 236, 1),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(234, 235, 236, 1),
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(top: 0, left: 13),
                        child: Icon(Icons.calendar_month),
                      )
                  ),
                  onSaved: (String? value) {
                  },
                ),
            )
          ],
        ),
        const SizedBox(height: 20,),
        CommonButton(
          name: 'Найти',
          onPressed: (){
            ctx.read<TripBloc>().add(
                LoadTrips(
                    departureCity: departureCity.text,
                    destinationCity: destinationCity.text,
                    date: date.text
                )
            );
          },
        ),
      ],
    );
  }

  Widget _body(TripState state){
    return state.trips.length > 0 ? Column(
      children: List.generate(state.trips.length, (index) {
        return TripWidget(tripEntity: state.trips[index],);
      }),
    ) : const Center(
      child: Text('По вашему запросу ничего не найдено'),
    );
  }
}