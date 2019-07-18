// [KEIS12] keis.STR=======================================================

/**
* F: 문자열 처리함수<br>
* <pre>
* alert( keis.str("M123erong").getNum().val() ); -> "123"  출력
* </pre>
* @classDescription 문자열 관련 유틸리티
* @return {keis.str}
* @author 통합1팀 응용아키텍트 2011.07.14
*/
keis.str = function( string ) {

  var z_self = arguments.callee;

  if(!(this instanceof z_self)) return new z_self(string);

  this.val( string );

}

keis.str.prototype = {

  /**
  * F: 처리된 문자열을 가져온다.<br>
  * 처리에 필요한 문자열을 세팅할 수도 있다.
  * <pre>
  * alert( keis.str("Merong").val() ); -> "Merong"  출력
  * alert( keis.str("Merong).val(A).val() ); -> "A" 출력
  * </pre>
  * @param {Object|String} value 세팅할 문자열 (또는 오브젝트)
  * @return {String,keis.str}
  */
  val : function( value ) {

    if( arguments.length == 0 ) return this.z_val;

    if( keis.chk.isNull(value) ) {
      this.z_val = "";
    } else if( keis.chk.isTypStr(value) ) {
      this.z_val = value;
    } else if( value instanceof keis.str ) {
      this.z_val = value.val();
    } else if( keis.chk.isTypObj(value) ) {
      this.z_val = "" + $(value).val();
    } else {
      this.z_val = "" + value;
    }

    return this;

  },

  /**
  * F: 문자열을 치환한다.
  * <pre>
  * alert( keis.str( "my body is male" ).replace("male", "female").val() );
  * --> "my body is female"
  * </pre>
  * @param {String,RegExp} pattern  찾을 문자열 또는 정규식 패턴
  * @param {String} replaceStr  치환할 문자열
  * @return {keis.str}
  */
  replace : function( pattern, replaceStr ) {

    if( pattern != null && (keis.chk.isTypStr(replaceStr) || keis.chk.isTypNum(replaceStr)) ) {
      this.z_val = this.z_val.replace( pattern, replaceStr );
    }

    return this;

  },

  /**
  * F: 문자열을 모두 치환한다.
  * <pre>
  * alert( keis.str( "m A m" ).replace("m", "a").val() ); --> "a A m"
  * alert( keis.str( "m A m" ).replaceAll("m", "a").val() ); --> "a A a"
  * </pre>
  * @param {String} pattern  찾을 문자열
  * @param {String} replaceStr  치환할 문자열
  * @return {keis.str}
  */
  replaceAll : function( pattern, replaceStr ) {
    var ptn = ( keis.chk.isTypStr(pattern) || keis.chk.isTypNum(replaceStr) ) ? eval( "/" + pattern + "/g" ) : pattern;
    return this.replace( ptn, replaceStr );
  },

  /**
  * F: 문자열을 없앤다.
  * @param {String,RegExp} pattern  찾을 문자열 또는 정규식 패턴
  * @return {keis.str}
  */
  remove : function( pattern ) {
    return this.replace( pattern, "" );
  },

  /**
  * F: 문자열을 모두 없앤다.
  * @param {String,RegExp} pattern  찾을 문자열 또는 정규식 패턴
  * @return {keis.str}
  */
  removeAll : function( pattern ) {
    return this.replaceAll( pattern, "" );
  },

  /**
  * F: 앞뒤 공백문자를 제거한다.
  * @return {keis.str}
  */
  trim : function() {
    return this.remove( keis.c.REG_PTN.TRIM );
  },

  /**
  * F: 앞 공백문자를 제거한다.
  * @return {keis.str}
  */
  ltrim : function() {
    return this.remove( keis.c.REG_PTN.LTRIM );
  },

  /**
  * F: 뒤 공백문자를 제거한다.
  * @return {keis.str}
  */
  rtrim : function() {
    return this.remove( keis.c.REG_PTN.RTRIM );
  },

  /**
  * F: 모든 공백문자를 제거한다.
  * @return {keis.str}
  */
  allTrim : function( string ) {
    return this.remove( keis.c.REG_PTN.INNER_SPACE );
  },

  /**
  * F: 중복 빈칸을 1개의 빈칸으로 만든다.
  * @return {keis.str}
  */
  innerTrim : function() {
    return this.replace( keis.c.REG_PTN.INNER_TRIM, " " );
  },

  /**
  * F: LPAD 처리를 수행한다.
  * <pre>
  * alert( keis.str("A").lpad(3,'0').val() ); -> 00A
  * </pre>
  * @param {Number} length 전체길이
  * @param {String} fillChar 패딩문자
  * @return {keis.str}
  */
  lpad : function( length, fillChar ) {

    if( !keis.chk.isEmpty(this.z_val) ) {
      var srcStr = this.z_val.substr( 0, length );
      var cnt = 0;
      for( var i = srcStr.length; i < length; i++ ) {
        srcStr = fillChar.charAt(cnt) + srcStr;
        cnt++;
        cnt = ( cnt == fillChar.length ) ? 0 : cnt;
      }
      this.z_val = srcStr;
    }

    return this;

  },

  /**
  * F: RPAD 처리를 수행한다.
  * <pre>
  * alert( keis.str("A").rpad(3,'0').val() ); -> A00
  * </pre>
  * @param {Number} length 전체길이
  * @param {String} fillChar 패딩문자
  * @return {keis.str}
  */
  rpad : function( length, fillChar ) {

      if( !keis.chk.isEmpty(this.z_val) ) {
        var srcStr = this.z_val.substr( 0, length );
        var cnt = 0;
        for( var i = srcStr.length; i < length; i++ ) {
          srcStr = srcStr + fillChar.charAt(cnt);
          cnt++;
          cnt = ( cnt == fillChar.length ) ? 0 : cnt;
        }
        this.z_val = srcStr;
      }

      return this;

  },

  /**
  * F: byte 수를 확인한다.
  * @return {Number} 문자열의바이트
  */
  bytes : function() {
    var z_add = ( keis.window.getCharset() == "UTF-8" ) ? 2 : 1;
    var z_len = 0;
    for( var i = 0, cnt = this.z_val.length; i < cnt; i++, z_len++ ) {
      if( this.z_val.charCodeAt(i) < 0 || this.z_val.charCodeAt(i) > 127 ) z_len += z_add;
    }
    return z_len;
  },

  /**
  * F: 숫자만 남긴다.
  * @return {keis.str}
  */
  setNum : function() {
    return this.remove( keis.c.REG_PTN.NOT_NUM );
  },

  /**
  * F: 부호와 소수점을 포함한 숫자만 남긴다.
  * @return {keis.str}
  */
  setParseNum : function() {
    return this.remove( keis.c.REG_PTN.NOT_NUM_PARSE );
  },

  /**
  * F: 숫자만 제외시킨다.
  * @return {keis.str}
  */
  setNotNum : function() {
    return this.remove( keis.c.REG_PTN.NUM );
  },

  /**
  * F: 정수 형태로 추출한다.
  * @return {Number} 정수
  */
  parseInt : function() {
    this.setParseNum();
    if( this.z_val == "" ) return 0;
    return parseInt( this.z_val );
  },

  /**
   * F: 실수 형태로 추출한다.
   * @return {Number} 실수
   */
  parseFloat : function() {
    this.setParseNum();
    if( this.z_val == "" ) return 0.0;
    return parseFloat( this.z_val );
  },

  /**
  * F: 영문자만 남긴다.
  * @return {keis.str}
  */
  setEng : function() {
    return this.remove( keis.c.REG_PTN.NOT_ENG );
  },

  /**
  * F: 영문자만 제외시킨다.
  * @return {keis.str}
  */
  setNotEng : function() {
    return this.remove( keis.c.REG_PTN.ENG );
  },

  /**
  * F: 숫자에 3자리마다 콤마를 찍는다.
  * @return {keis.str}
  */
  setMoney : function() {

    var _val = "" + this.parseFloat();
    var _pos = _val.lastIndexOf(".");

    if( _pos >= 0 ) {
      this.z_val = _val.substring( 0, _pos - 1).replace( keis.c.REG_PTN.MONEY, "$1," ) + _val.substring( _pos );
    } else {
      this.z_val = _val.replace( keis.c.REG_PTN.MONEY, "$1," );
    }

    return this;

  },

  /**
  * F: 값이 없다면 지정 문자로 치환한다.
  * @param {String} replaceStr 값이 없을 경우 치환할 문자열
  * @return {keis.str}
  */
  nvl : function( replaceStr ) {
    if( this.z_val == "" ) this.val( replaceStr );
    return this;
  },

  /**
  * F: 문자열이 특정 패턴을 가지고 있는지 검사한다.
  * @param {String} pattern  패턴
  * @return {Boolean}
  */
  hasValue : function( pattern ) {
    if( pattern == null ) return false;
    return ( this.z_val.indexOf( pattern ) >= 0 ) ? true : false;
  },

  /**
  * F: 문자열이 비어있는지 검사한다.
  * @return {Boolean}
  */
  isEmpty : function( pattern ) {
    return this.z_val == "";
  },

  /**
  * F: 문자열의 XSS 처리를 해제한다.
  * @return {keis.str}
  */
  unclearXss : function() {

     this.z_val = this.z_val
      .replace( /&lt;/g,  "<" )
      .replace( /&gt;/g,  ">" )
      .replace( /&#60;/g, "<" )
      .replace( /&#62;/g, ">" )
      .replace( /&#34;/g, '"' )
      .replace( /&quot;/g, '"' )
      .replace( /&#39;/g, "'" )
      .replace( /&#92;/g, "W" )
      .replace( /&#40;/g, "(" )
      .replace( /&#41;/g, ")" );

     return this;

  },

  /**
  * F: 문자열에 XSS 처리를 수행한다.
  * @return {keis.str}
  */
  clearXss : function() {

     this.z_val = this.z_val
      .replace( /</g, "&#60;" )
      .replace( />/g, "&#62;" )
      .replace( /"/g, "&#34;" )
      .replace( /'/g, "&#39;" )
      .replace( /\\/g,"&#92;" )
      .replace( /\(/g,"&#40;" )
      .replace( /\)/g,"&#41;" );

     return this;

  },

  /**
  * F: 마지막 한글문자의 초성/중성/종성을 나누어 가져온다.
  * <pre>
  * var c = keis.str( "정화수" ).getLastKrChr(); -> ['ㅅ','ㅜ','']
  * var c = keis.str( "손상욱" ).getLastKrChr(); -> ['ㅇ','ㅜ','ㄱ']
  * var c = keis.str( "Name" ).getLastKrChr(); -> [null,null,null]
  * </pre>
  * @return {Array} 초성/중성/종성이 나누어진 배열 (한글이 아닐 경우 null이 반환됨)
  */
  getLastKr : function() {

    var result = [null,null,null];
    var word   = this.z_val;
    var schar  = word.charCodeAt( word.length - 1 );

    if( schar < 0xAC00 || schar > 0xD79F ) return result;

    schar = schar - 0xAC00;

    var jong = schar % 28;
    var jung = ( (schar - jong) / 28 ) % 21;
    var cho  = parseInt( ((schar-jong) / 28) / 21 );

    result[0] = keis.c.REG_PTN.HAN_1ST[cho];
    result[1] = keis.c.REG_PTN.HAN_2ND[jung];
    result[2] = keis.c.REG_PTN.HAN_3RD[jong];

    return result;

  },

  /**
   * F: 문자열 길이를 구한다.
   * @return {Number}
   */
  length : function() {
    return this.z_val.length;
  },

  /**
   * F: 시작위치부터 지정 길이만큼 문자열을 자른다.
   * @param {Number} start  시작위치
   * @param {Number} length 길이
   * @return {keis.str}
   */
  substr : function( start,length ) {
    this.z_val = this.z_val.substr( start, length );
    return this;
  },

  /**
   * F: 지정한 위치대로 문자열을 자른다.
   * @param {Number} startIndex  시작위치
   * @param {Number} endIndex    종료위치
   * @return {keis.str}
   */
  substring : function( startIndex, endIndex ) {
    this.z_val = this.z_val.substring( startIndex, endIndex );
    return this;
  },

  /**
   * 문자열이 시작하는 위치를 반환한다.
   * <pre>
   * keis.str( "Play Station" ).indexOf( "y" ); ->  3 을 반환
   * </pre>
   * @param {String} searchValue 검색할 문자열
   * @param {Number} fromIndex   검색시작위치
   * @return {Number} 문자열 검색위치
   */
  indexOf : function( searchValue, fromIndex ) {
    return this.z_val.indexOf( searchValue, fromIndex );
  },

  /**
   * 문자열이 시작하는 위치를 뒤부터 검색하여 반환한다.
   * <pre>
   * keis.str( "xbox" ).lastIndexOf( "x" ); -> 3 을 반환
   * </pre>
   * @param {String} searchValue  검색할 문자열
   * @param {Number} fromIndex    검색시작위치
   * @return {Number} 문자열 검색위치
   */
  lastIndexOf : function( searchValue, fromIndex ) {
    return this.z_val.lastIndexOf( searchValue, fromIndex );
  },


  /**
   * F: 대문자로 변환한다.
   * <pre>
   * keis.str( "xbox" ).toUpperCase().val(); -> "XBOX" 반환
   * </pre>
   * @return {keis.str}
   */
  toUpperCase : function() {
    this.z_val = this.z_val.toUpperCase()
    return this;
  },

  /**
   * F: 소문자로 변환한다.
   * <pre>
   * keis.str( "XboX" ).toLowerCase().val(); -> "xbox" 반환
   * </pre>
   * @return {keis.str}
   */
  toLowerCase : function() {
    this.z_val = this.z_val.toLowerCase()
    return this;
  },

  /**
   * F: FORMAT 형식의 날짜문자열을 [YYYY,MM,DD,HH,MI,SS] 순서의 배열로 읽어온다.
   * <pre>
   * alert( keis.str("03-23-2011 12:32").getDateArray("MM-DD-YYYY MI SS") ); -> [2011,03,23,,12,32]
   * </pre>
   * @param {String} format   포맷 (YYYY,MM,DD,HH,MI,SS 조합)
   * @return {Array}
   */
  getDateArray : function( format ) {

    var z_format  = keis.str(format||keis.conf.com.dateFormat).setEng().toUpperCase().val();
    var z_dateStr = this.setNum().val();

    var z_div = [ 'YYYY', 'MM', 'DD', 'HH', 'MI', 'SS' ];
    var z_pos = [], z_res = [];

    // get position according to format
    $(z_div).each(function(i){
      z_pos.push( z_format.indexOf(z_div[i]) );
    });

    // extract data
    $(z_div).each(function(i){
      if( z_pos[i] < 0 ) {
        z_res[i] = null;
        return true;
      }
      z_res[i] = z_dateStr.substr( z_pos[i], z_div[i].length );
    });

    return z_res;

  },

  /**
   * F: 문자열이 달라지는 위치를 검색한다.
   *
   * <pre>
   * alert( keis.str("가12나").getDiffIndex("가나") ); -> 1을 반환
   * </pre>
   *
   * @param {String} string 비교할 문자열
   * @return {Number} 문자열이 달라지는 시작점 (문자열이 동일하다면 -1 반환)
   */
  getDiffIndex : function( string ) {

    var diffTxt = keis.str( string ).val();

    if( this.z_val == diffTxt ) return -1;

    var iCnt = Math.max( this.z_val.length, diffTxt.length ), c0, c1;

    for( var i = 0; i < iCnt; i++ ) {

      c0 = this.z_val.charAt( i );
      c1 = diffTxt.charAt( i );

      if( c0 == "" || c1 == "" || c0 != c1 ) return i;

    }

  },

  /**
   * 문자열을 배열로 만든다.
   *
   * @param {String} seperator  배열을 나눌 구분기호
   * @param {Number} limit      최대 배열 개수
   * @return {Array} 구분기호로 분리된 배열
   */
  split : function( seperator, limit ) {
    return this.z_val.split( seperator || "", limit );
  },

  /**
   * 마스크를 적용한다.
   *
   * @param {String} format 패턴 ( X:문자, 9:숫자, *:문자 또는 숫자 )
   * @return {keis.str}
   */
  setMask : function( format ) {

    var ptn = keis.str(format).val().toUpperCase();

    var result = "";

    var flag, j = 0, chStr, chPtn;

    for( var i = 0, iCnt = ptn.length; i < iCnt; i++ ) {

      flag = true;

      chStr = this.z_val.charAt(j);
      chPtn = ptn.charAt(i);

      if( chStr == "" ) break;

      switch( chPtn ) {

        case "X":
          if( ! keis.chk.isReg(chStr, keis.c.REG_PTN.MASK_CHR) ) flag = false;
          break;

        case "9" :
          if( ! keis.chk.isReg(chStr, keis.c.REG_PTN.MASK_NUM) ) {
            flag = false;
          }
          break;

        case "*" :
          if( ! keis.chk.isReg(chStr, keis.c.REG_PTN.MASK_ALL) ) flag = false;
          break;

        default :

          if( chStr == chPtn ) j++;
          result += chPtn;
          continue;

      }

      if( flag == true ) {
        result += chStr;
      } else {
        i--;
      }

      j++;

    }

    this.z_val = result;

    return this;

  },

  /**
   * 마스크를 해제한다.
   *
   * @param {String} format 패턴 ( X:문자, 9:숫자, *:문자 또는 숫자 )
   * @return {keis.str}
   */
  setUnmask : function( format ) {

    var ptn = keis.str(format).remove(/[x|X|9|\*]/g).split();

    ptn = $.unique( ptn );

    for( var i = 0, iCnt = ptn.length; i < iCnt; i++ ) {
      this.removeAll( ptn[i] );
    }

    return this;

  }

} // ec