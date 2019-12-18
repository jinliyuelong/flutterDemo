
import 'package:rxdart/rxdart.dart';
import 'package:helloworld/网络/random_user.dart';
import 'package:helloworld/bloc/bloc_provider.dart';
import 'package:helloworld/application.dart';

class UserBloc extends BaseBloc {
  RandomUserModel _user;
  RandomUserModel get user => _user;
  BehaviorSubject<RandomUserModel> _controller = BehaviorSubject();
  Observable<RandomUserModel> get stream => Observable(_controller.stream);
  updateUserInfo() {
    Application.http.getRequest('/api').then((response) {
      RandomUserModel model = RandomUserModel.fromMap(response.data);
      _user = model;
      _controller.add(model);
    });
  }

  @override
  void dispose() {
    _controller?.close();
  }
}
