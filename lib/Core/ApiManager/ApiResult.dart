<<<<<<< HEAD
sealed class ApiResult<T>{}

class SuccessApiResult<T> extends ApiResult<T>{
  T? data;
  SuccessApiResult(this.data);
}

class ErrorApiResult<T> extends ApiResult<T>{
  Exception exception;
  ErrorApiResult(this.exception);
}

class StreamApiResult extends ApiResult{
}
=======
// sealed class ApiResult<T>{}

// class SuccessApiResult<T> extends ApiResult<T>{
//   T? data;
//   SuccessApiResult(this.data);
// }

// class ErrorApiResult<T> extends ApiResult<T>{
//   Exception exception;
//   ErrorApiResult(this.exception);
// }
>>>>>>> c4a13b224fec080ecdd9692b03dd4ea4328f5e3c
