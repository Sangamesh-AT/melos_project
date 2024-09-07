enum ApiMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  patch('PATCH');

  final String value;

  const ApiMethod(this.value);
}
