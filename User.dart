class User
{
  int _id;
  String _username;
  String _password;

  User (this._id, this._username, this._password);

  /// Methods
  int get id => this._id;    // {return _idUser;}
  String get username => this._username;   // same
  String get password => this._password;   // same
}