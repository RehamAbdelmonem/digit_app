
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileGetOwnerDataSuccess extends ProfileState {}
class ProfileGetOwnerDataError extends ProfileState {}
class ProfileGetLapDataSuccess extends ProfileState {}
class ProfileGetLabDataError extends ProfileState {}

class ProfileGetPatientDataSuccess extends ProfileState {}
class ProfileGetPatientDataError extends ProfileState {}

class ProfileUpdatePatientDataSuccess extends ProfileState {}
class ProfileUpdatePatientDataError extends ProfileState {}

class UploadImageSuccessState extends ProfileState {}
class UploadImageErrorState extends ProfileState {}

class ProfileUpdateLabDataSuccess extends ProfileState {}
