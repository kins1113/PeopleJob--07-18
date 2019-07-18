// [KEIS05] keis.COOKIE=======================================================

/**
 * O: 쿠키 관련 유틸클래스.
 * <pre>
 * 보안상 중요한 정보는 절대로 쿠기에 저장해서는 안된다.
 * </pre>
 * @classDescription 쿠키 관련 유틸 클래스로서 쿠키를 컨트롤 한다.
 * @author 통합1팀 응용아키텍트 2011.07.14
 */
keis.cookie = {};

/**
 * F: 쿠키지원여부를 확인한다.
 * @return {Boolean}
 * 
 * */
keis.cookie.isSupported = function() {

  var result;

  if( $.browser.msie ) {

    var chkKey = "_duChkCookieEnabled";
    var chkVal = Math.round( Math.random() * 10000 ) + "";

    keis.cookie.set( chkKey, chkVal, {} );
    result = ( keis.cookie.get(chkKey) == chkVal ) ? true : false;
    keis.cookie.del( chkKey );

  } else {

    result = navigator.cookieEnabled;

  }

  return result;

}

/**
 * F: 쿠키를 설정한다.
 * <pre>
 * keis.cookie.set( "key", "1" ); -> 현재 디렉토리부터 사용할 쿠키 세팅
 * keis.cookie.set( "key", "1", { path:"/pls/pls000/"} ); -> 특정 디렉토리부터 사용할 쿠키를 세팅
 * keis.cookie.set( "key", "1", { path:"/", expires:100} ); -> 전체범위 쿠키 세팅, 만기일은 생성시부터 100일 후
 * </pre>
 * @param {Object} key    키
 * @param {Object} value  값
 * @param {Object} option 옵션
 * <pre>
 * expires : {Number}  만료기간(일자, 기본값:365)
 * path    : {String}  쿠키가 유효하게 사용될 수 있는 URL 디렉토리 (위치는 하위상속됨, 기본값 : 현재위치)
 * secure  : {Boolean} HTTPS 사용여부 (기본값 : false)
 * </pre>
 */
keis.cookie.set = function( key, value, option ) {

  var _path = location.pathname;
  _path = _path.substr( 0, _path.lastIndexOf("/") + 1 );

  var op = $.extend({
    expires : 365,
    path    : _path,
//    domain  : "", IE 에서 domain 설정이 들어가면 쿠키값이 저장이 안된다.
    secure  : false
  }, option || {} );

  var expires = new Date();
  expires.setDate( expires.getDate() + op.expires );

  document.cookie = key + "=" + encodeURIComponent( value )
   + "; expires=" + expires.toUTCString()
   + "; path="    + op.path
   + ( op.secure != false ? "; secure" : "" );

}

/**
 * F: 쿠키를 삭제한다.
 * <pre>
 * keis.cookie.del( "key" ); -> 현재 디렉토리부터 세팅된 쿠키 삭제
 * keis.cookie.del( "key", "/pls/pls000/" ); -> 해당 디렉토리부터 세팅된 쿠키를 삭제
 * keis.cookie.del( "key", "/" ); -> 전체범위 쿠키 삭제
 * </pre>
 * @param {Object} key  키
 * @param {Object} path 쿠키가 유효하게 사용될 수 있는 URL 디렉토리 (위치는 하위상속됨, 기본값 : 현재위치)
 */
keis.cookie.del = function( key, path ) {

  var _path = location.pathname;
  _path = _path.substr( 0, _path.lastIndexOf("/") + 1 );

  path = path || _path;

  var expires = new Date();

  expires.setDate( expires.getDate() - 1 );

  document.cookie = key + "=; expires=" + expires.toGMTString() + "; path=" + path;

}

/**
 * F: 쿠키값을 가져온다.
 * 키가 존재하지 않을 경우 false를 반환받는다.
 * @param {Object} key 키
 * @return {String|Boolean} 값 또는 false
 */
keis.cookie.get = function( key ) {

  var result;

  if( result = new RegExp(key + "=(.*?)(?:;|$)").exec(document.cookie) ) {
    return decodeURIComponent( result[1] );
  }

  return false;

}