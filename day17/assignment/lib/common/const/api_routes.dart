class ApiRoutes {
  // POST
  // - identity (String - required)
  // - password (String -required, 9글자 이상)
  static String authWithPassword =
      'http://52.79.115.43:8090/api/collections/users/auth-with-password';

  // POST
  // - email (String - required, 올바른 이메일형식일 것)
  // - password (String - required, 9자 이상일 것)
  // - passwordConfirm (String - required, 9자 이상일 것)
  // - username (String)
  static String signUp = 'http://52.79.115.43:8090/api/collections/users/records';

  // GET
  static String readUsers = 'http://52.79.115.43:8090/api/collections/users/records?sort=-created';

  // GET
  static String readSecrets = 'http://52.79.115.43:8090/api/collections/secrets/records?sort=-created';

  // POST
  static String uploadSecret = 'http://52.79.115.43:8090/api/collections/secrets/records';
}
