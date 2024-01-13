import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/screens/home/cubit/home_patient_states.dart';
import 'package:graduation_project/screens/home/cubit/home_patint_cubit.dart';
import 'package:graduation_project/widgets/Laboratories/laboratories_test.dart';

import '../Home/home_body.dart';


class LaoratoriesBody extends StatelessWidget {
  const LaoratoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: BlocProvider.value(
        value: homePatientCubit..emptySearch(),
        child: BlocConsumer<HomeCubit, HomePatientStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit=HomeCubit.get(context);
            print(cubit.labs);
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        icon: Icon(Icons.search),
                        hintText: 'بحث',
                        hintStyle:
                            TextStyle(color: Colors.white, fontSize: 20)),
                    onChanged: (value){
                      cubit.searchLabors(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if(cubit.labors.isNotEmpty)
                Expanded(
                    child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 70.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                    ),
                    ListView.builder(
                      itemCount: cubit.searchListLabs.isNotEmpty?cubit.searchListLabs.length
                          :cubit.labors.length,
                      itemBuilder: (context, index) => LaboratoriesList(
                        itemIndex: index,
                        lab: cubit.searchListLabs.isNotEmpty?cubit.searchListLabs[index]
                            :cubit.labors[index],
                      ),
                    )
                  ],
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}

//Rehaaaaaaaaaam
