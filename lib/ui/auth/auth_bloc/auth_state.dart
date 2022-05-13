class AuthState{
 bool dataAdded;
 AuthState({this.dataAdded});

 factory AuthState.init(){
   return AuthState(dataAdded: false);
 }

 AuthState update({bool dataAdded})
 {
   return copyWith(dataAdded: dataAdded);

 }
 AuthState copyWith({bool dataAdded}){
   return AuthState(dataAdded: dataAdded??this.dataAdded);

 }
}