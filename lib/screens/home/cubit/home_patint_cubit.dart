import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/components/constants.dart';
import '../../../../shared/network/local/cache_helper.dart';
import '../../../models/owner_model.dart';
import 'home_patient_states.dart';

class HomeCubit extends Cubit<HomePatientStates> {
  HomeCubit() : super(InitializeHomePatientState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<LabModel> labs = [];

  void getLab() {
    FirebaseFirestore.instance
        .collection("labs")
        .snapshots()
        .listen((event) {
      labs = [];
      for (var element in event.docs) {
        labs.add(LabModel.fromJson(element.data()));
      }
      getLabors();
      getRadio();
      emit(SuccessesGetLabsState());
    });
  }

  List<LabModel> labors = [];

  void getLabors() {
    labors = [];
    for (var element in labs) {
      if (element.laboratory != null && element.laboratory!.isNotEmpty) {
        labors.add(element);
      }
    }
      emit(GetLaborsState());
  }

  List<LabModel> radio = [];

  void getRadio() {
    radio = [];
    for (var element in labs) {
      if (element.radiology != null && element.radiology!.isNotEmpty) {
        radio.add(element);
      }
    }
    emit(GetRadioState());
  }

  List<LabModel> searchListLabs = [];

  void searchRadios(String text) {
    searchListLabs = [];
    searchListLabs = List.from(radio.where((element) =>
        element.labName.toLowerCase().contains(text.toLowerCase())));
    emit(SearchState());
  }
  void searchLabors(String text) {
    searchListLabs = [];
    searchListLabs = List.from(labors.where((element) =>
        element.labName.toLowerCase().contains(text.toLowerCase())));
    emit(SearchState());
  }
  void emptySearch() {
    searchListLabs = [];
    emit(SearchState());
  }
}
