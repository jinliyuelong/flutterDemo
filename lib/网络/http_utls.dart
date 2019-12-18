import 'package:dio/dio.dart';

typedef ErrorCallback = void Function(String msg);

class HttpUtils {
  static const GET = 'get';
  static const POST = 'post';

  static Dio _dio;
  static HttpUtils _instance;

  Dio get hp => _dio;

  // dio 可以在 BaseOptions 中指定域名 baseUrl，
  // 后续接口就不需要再添加域名了
  // 如果请求的接口域名发生了变化，只要把全部 url 写全，就会自动使用新的域名
  HttpUtils._internal(String base) {
    // 生成一个单例，防止多次打开关闭造成开销
    _dio = Dio(BaseOptions(baseUrl: base, connectTimeout: 10000, receiveTimeout: 10000));
  }

  factory HttpUtils(String base) {
    if (_instance == null) _instance = HttpUtils._internal(base);
    return _instance;
  }

  // 添加拦截器
  addInterceptor(List<InterceptorsWrapper> interceptors) {
    _dio.interceptors.clear();
    _dio.interceptors.addAll(interceptors);
  }

  Future<Response<T>> getRequest<T>(url, {Map params, ErrorCallback callback}) =>
      _request(url, GET, params: params, callback: callback);

  Future<Response<T>> postRequest<T>(url, {Map params, ErrorCallback callback}) =>
      _request(url, POST, params: params, callback: callback);

  Future<Response> download(url, path, {ProgressCallback receive, CancelToken token}) =>
      _dio.download(url, path, onReceiveProgress: receive, cancelToken: token);

// T 可以指定返回的类型，String 或者 Map<String, dynamic>
  Future<Response<T>> _request<T>(
    url,
    String method, {
    Map params, // 上传的参数
    Options opt,
    ErrorCallback callback, // 错误回调
    ProgressCallback send, // 上传进度监听
    ProgressCallback receive, // 下载监听
    CancelToken token, // 用于取消的 token，可以多个请求绑定一个 token
  }) async {
    try {
      Response<T> rep;

      if (method == GET) {
        // 如果不是重新创建 Dio 实例，get 方法使用 queryParams 会出错，不懂原因，使用拼接没有问题
        if (params != null && params.isNotEmpty) {
          var sb = StringBuffer('?');
          params.forEach((key, value) {
            sb.write('$key=$value&');
          });
          // get 请求下拼接路径
          url += sb.toString().substring(0, sb.length - 1);
        }
        rep = await _dio.get(url, options: opt, onReceiveProgress: receive, cancelToken: token);
      } else if (method == POST) {
        // post 参数放请求体
        rep = params == null
            ? await _dio.post(url,
                options: opt, cancelToken: token, onSendProgress: send, onReceiveProgress: receive)
            : await _dio.post(url,
                data: params,
                options: opt,
                cancelToken: token,
                onSendProgress: send,
                onReceiveProgress: receive);
      }

      // 如果 statusCode 不是 200 则错误回调，返回空的 Response
      if (rep.statusCode != 200 && callback != null) {
        callback('network error, and code is ${rep.statusCode}');
        return null;
      }
      return rep;
    } catch (e) {
      if (callback != null) {
        callback('network error, catch error: ${e.toString()}');
      }
      return null;
    }
  }
}
