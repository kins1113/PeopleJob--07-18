// [KEIS07] keis.DATE=======================================================

/**
* F: 날짜처리함수<br>
* <pre>
* keis.date().val() -> 서버기준 시간을 초기값으로 가지고 있는 신규 Date객체
* keis.date(new Date(2011,3-1,5)).val() -> Date객체 (2011-03-05)
* keis.date("03-05-2011","MM-DD-YYYY").val() -> Date객체 (2011-03-05)
* </pre>
* @param {String/Date/keis.date} date 날짜
* @param {String} format 입력포맷 (기본값 : {@link keis.c.DATE.FORMAT} )
* @return {keis.date}
 * @author 통합1팀 응용아키텍트 2011.07.14
*/
keis.date = function( date, format ) {

  var z_self = arguments.callee;

  if(!(this instanceof z_self)) return new z_self( date, format );

  this.z_format = format || keis.c.DATE.FORMAT;

  if( keis.chk.isNull(date) ) {
    this.val( this.getNow(), this.z_format );
  } else {
    this.val( date, this.z_format );
  }

}

keis.date.prototype = {

  /**
  * F: Date 객체를 가져온다.<br>
  * 처리에 필요한 Date 객체를 세팅할 수도 있다.
  * 잘못된 정보로 Date 객체가 세팅될 경우 null이 저장된다.
  * <pre>
  * keis.date().val() -> Date객체(신규)
  * keis.date().val(new Date(2011,3-1,5)).val() -> Date객체 (2011-03-05)
  * keis.date().val("03-05-2011","MM-DD-YYYY").val() -> Date객체 (2011-03-05)
  * </pre>
  * @param {String,Date} date 날짜
  * @param {String} format 입력포맷 (기본값:YYYY-MM-DD, YYYY,MM,DD,HH,MI,SS조합)
  * @return {Date,keis.date}
  */
  val : function( date, format ) {

    if( arguments.length == 0 ) return this.z_val;

    if( keis.chk.isTypDate(date) ) {
      this.z_val = date;
      return this;
    }

    // get dateArray through format
    var z_dtArr = keis.str(date).getDateArray( format || this.z_format );

    $(z_dtArr).each(function(i){
      if( z_dtArr[i] == null ) return true;
      z_dtArr[i] = Number(z_dtArr[i]);
    });

    // calibrate date
    z_dtArr[1] = (z_dtArr[1]==null) ? null : z_dtArr[1] - 1; // 월데이터 보정
    z_dtArr[2] = (z_dtArr[2]==null) ? 1 : z_dtArr[2]; // 일데이터 보정

    // create Date object
    var z_date = new Date( z_dtArr[0], z_dtArr[1], z_dtArr[2], z_dtArr[3], z_dtArr[4], z_dtArr[5], 1 );

    // check validation
    var z_chk  = [];
    z_chk.push( "" + z_date.getFullYear() );
    z_chk.push( "" + z_date.getMonth() );
    z_chk.push( "" + z_date.getDate() );
    z_chk.push( "" + z_date.getHours() );
    z_chk.push( "" + z_date.getMinutes() );
    z_chk.push( "" + z_date.getSeconds() );

    var z_flag = true;

    $(z_chk).each(function(i){
      if( z_dtArr[i] != null && z_dtArr[i] != z_chk[i] ) {
        z_flag = false;
        return false;
      }
    });

    // save result
    this.z_val = (z_flag) ? z_date : null;

    return this;

  },

  /**
   * F: 포맷을 가져오거나 변경한다.
   *
   * <pre>
   *
   * var d = keis.date( "2011-01-01" );
   *
   * d.format(); -> "YYYY-MM-DD"
   *
   * d.format( "YYYYMMDD" );
   * d.format(); -> "YYYYMMDD"
   *
   * </pre>
   *
   * @param {Object} format
   * @return {String} 포맷
   */
  format : function ( format ) {

    if( arguments.length == 0 ) return this.z_format;
    this.z_format = keis.str( format ).val();

  },

  /**
   * F: 날짜를 포맷에 맞게 변환한다.
   * @param {String} format 포맷 (기본값:시간데이터 세팅시 입력한 포맷(미입력시 YYYY-MM-DD), YYYY,MM,DD,HH,MI,SS조합)
   * @return {String} 포맷이 적용된 날짜
   */
  toString : function( format ) {

    if( this.z_val == null ) return "";

    var z_result = keis.str(format||this.z_format).toUpperCase().val();
    var z_date   = this.z_val;

    return keis.str(z_result).replace( "YYYY", z_date.getFullYear() )
      .replace( "MM", keis.str(z_date.getMonth()+1).lpad(2,"0").val() )
      .replace( "DD", keis.str(z_date.getDate()   ).lpad(2,"0").val() )
      .replace( "HH", keis.str(z_date.getHours()  ).lpad(2,"0").val() )
      .replace( "MI", keis.str(z_date.getMinutes()).lpad(2,"0").val() )
      .replace( "SS", keis.str(z_date.getSeconds()).lpad(2,"0").val() ).val();

    return result;

  },

  /**
   * F: 현재시간 추출 관련 환경 초기화
   * @param {String} date YYYYMMDDHHMISS 형식의 문자열
   */
  initNow : function( date ) {

    if( keis.chk.isEmpty(date) ) {
      keis.c.DATE.SERVER_DATE = new Date();
    } else {
      keis.c.DATE.SERVER_DATE = this.val(date,"YYYYMMDDHHMISS").val();
    }

    keis.c.DATE.LOCAL_DATE = new Date();

  },

  /**
   * F: 현재 시간을 구한다.<br>
   * new Date() 함수는 로컬 PC 의 시간을 구하기 때문에 현재 시간을 구하는 용도로 사용해서는 안된다.
   * @return {Date}
   */
  getNow : function() {

    if( keis.c.DATE.SERVER_DATE == null ) this.initNow();

    var gap = new Date() - keis.c.DATE.LOCAL_DATE;
    var now = keis.c.DATE.SERVER_DATE.valueOf() + gap;

    return new Date( now );

  },

  /**
   * F: 년도(4자리)를 구한다.
   *
   * @return {Number} 년도
   */
  getYear  : function()  {
    return this.z_val.getFullYear();
  },

  /**
   * F: 월을 구한다.
   *
   * @return {Number} 월 (1-12)
   */
  getMonth : function()  {
    return this.z_val.getMonth() + 1;
  },

  /**
   * F: 일을 구한다.
   *
   * @return {Number} 일
   */
  getDate : function()  {
    return this.z_val.getDate();
  },

  /**
   * F: 시간을 구한다.
   *
   * @return {Number} 시간
   */
  getHour : function() {
    return this.z_val.getHours();
  },

  /**
   * F: 분을 구한다.
   *
   * @return {Number} 분
   */
  getMin : function() {
    return this.z_val.getMinutes();
  },

  /**
   * F: 초를 구한다.
   *
   * @return {Number} 초
   */
  getSec : function() {
    return this.z_val.getSeconds();
  },

  /**
   * F: 요일을 구한다.
   *
   * @return {Number} 요일에 해당하는 숫자 (0:일요일 - 6:토요일)
   */
  getDay   : function()  {
    return this.z_val.getDay();
  },


  /**
   * F: 두 날짜간 차이를 구한다.
   *
   * <pre>
   * var a = keis.date("2011-01-01");
   * var b = keis.date("2011-01-03");
   * keis.msg.debug( "날짜차이 : " + b.getBetweenDate( a ) ); -> -2일 차이
   * </pre>
   *
   * @param {String/Date/keis.date} date
   * @param {String} format
   * @return {Number} 일자
   */
  getBetweenDate : function(date, format) {

    var cDate;

    if( keis.chk.isTypDate(date) ) {
      cDate = date;
    } else if( keis.chk.isTypStr(date) ) {
      cDate = keis.date( date, format );
    } else if( date instanceof keis.date ) {
      cDate = date.val();
    }

    return ( cDate - this.val() ) / 1000 / 60 / 60 / 24;

  },


  /**
   * F: 월말로 세팅한다.
   *
   * <pre>
   * keis.Date("2011-04-17").setLastDate().toString(); -> "2011-04-30" 반환
   * </pre>
   *
   * @return {keis.date}
   */
  setLastDate : function() {
    if( this.z_val != null ) this.z_val = new Date( this.getYear(), this.getMonth(), 0, this.getHour(), this.getMin(), this.getSec(), 1 );
    return this;
  },

  /**
   * F: 년을 더한다.
   *
   * <pre>
   * keis.date().addYear( 1  ); -> 현재시간에서 1년을 더한다.
   * keis.date().addYear( -1 ); -> 현재시간에서 1년을 뺀다.
   * </pre>
   *
   * @param {Number} num 더할 년
   * @return {keis.date}
   */
  addYear : function( num )  {

    if( this.z_val != null ) this.z_val.setFullYear( this.z_val.getFullYear() + num );
    return this;

  },

  /**
   * F: 월을 더한다.
   *
   * <pre>
   * keis.date().addMonth( 1  ); -> 현재시간에서 1달을 더한다.
   * keis.date().addMonth( -1 ); -> 현재시간에서 1달을 뺀다.
   * </pre>
   *
   * @param {Number} num 더할 월
   * @return {keis.date}
   */
  addMonth : function( num )  {

    if( this.z_val != null ) this.z_val.setMonth( this.z_val.getMonth() + num );
    return this;

  },

  /**
   * F: 일을 더한다.
   *
   * <pre>
   * keis.date().addDate( 1  ); -> 현재시간에서 1일을 더한다.
   * keis.date().addDate( -1 ); -> 현재시간에서 1일을 뺀다.
   * </pre>
   *
   * @param {Number} num 더할 일
   * @return {keis.date}
   */
  addDate : function( num )  {

    if( this.z_val != null ) this.z_val.setDate( this.z_val.getDate() + num );
    return this;

  },

  /**
   * F: 시간을 더한다.
   *
   * <pre>
   * keis.date().addHour( 1  ); -> 현재시간에서 1시간을 더한다.
   * keis.date().addHour( -1 ); -> 현재시간에서 1시간을 뺀다.
   * </pre>
   *
   * @param {Number} num 더할 시간
   * @return {keis.date}
   */
  addHour : function( num )  {

    if( this.z_val != null ) this.z_val.setHours( this.z_val.getHours() + num );
    return this;
  }

}