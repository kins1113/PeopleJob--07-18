// [KEIS03] keis.CHK=======================================================
/**
 * O: 정합성 체크 유틸리티
 * <pre>
 * 객체가 유효한지 검사
 * var nullFlag = keis.chk.isEmpty(objectName);
 * </pre>
 *
 * @classDescription 정합성 체크 유틸리티 모음으로 필요한 함수를 객체생성 없이 사용가능하다.
 * @author 통합1팀 응용아키텍트 2011.07.14
 *
 * */
keis.chk = {};

/**
* F: 입력값이 null인지 여부를 확인한다.<br>
* @param  {Object}  obj  검사할객체
* @return {Boolean} <b>null, undefined</b> 인 경우 true를 반환
*/
keis.chk.isNull= function( obj ) {
	return ( obj == null || obj == undefined ) ? true : false;
}

/**
 * F: 입력항목의 값이 비어있는지 여부를 확인한다.
 * @param {Object, String} obj 검사할객체
 * @return {Boolean} <b>null, undefined, ""</b> 인 경우 true를 반환
 */
keis.chk.isEmpty = function( obj ) {
	return ( obj == null || obj == "" || obj == undefined ) ? true : false;
}


/**
 * F: 정규식을 테스트한다.
 * <pre>
 * alert( keis.chk.isReg( "aaaab a", /.*b/ ) );
 * </pre>
 * @param {String} string   패턴검사를 수행할 문자열
 * @param {Object} pattern  정규식패턴 (또는 문자열)
 * @return {Boolean} 테스트 성공여부
 */
keis.chk.isReg = function( string, pattern ) {
	if( keis.chk.isEmpty(string) || keis.chk.isNull(pattern) ) return false;

	var regExp = pattern;
	return regExp.test( keis.str(string).val() );
}

/**
 * F: HTML 태그가 포함되어있는지 여부를 확인한다.
 * @param {String} string 패턴검사를 수행할 문자열
 * @return {Boolean} 태그 포함여부
 */
keis.chk.hasHtml = function( string ) {
	return keis.chk.isReg( string, keis.c.REG_PTN.HAS_HTML );
}

/**
 * F: String 타입 여부를 확인한다.
 * @param {Object} string 검사할 개체
 * @return {Boolean} 타입이 문자일 경우 true 반환
 */
keis.chk.isTypStr = function( string ) {
	return typeof string == "string";
}

/**
 * F: Object 타입 여부를 확인한다.
 * @param {Object} obj 검사할 개체
 * @return {Boolean}
 */
keis.chk.isTypObj = function( obj ) {
	return typeof obj == "object";
}

/**
 * F: Date 타입 여부를 확인한다.
 * @param {Object} date 검사할 개체
 * @return {Boolean}
 */
keis.chk.isTypDate = function( date ) {
	return date instanceof Date;
}

/**
 * F: Number 타입 여부를 확인한다.
 * @param {Object} number 검사할 개체
 * @return {Boolean}
 */
keis.chk.isTypNum = function( number ) {
	return typeof number == "number";
}

/**
 * F: Function 타입 여부를 확인한다.
 * @param {Object} fn 검사할 개체
 * @return {Boolean} 타입이 함수일 경우 true 반환
 */
keis.chk.isTypFn = function( fn ) {
	return typeof fn == "function";
}

/**
 * F: Array 타입 여부를 확인한다.
 * @param {Object} array  검사할 개체
 * @return {Boolean} 타입이 배열일 경우 true 반환
 */
keis.chk.isTypArr = function( array ) {
	return array instanceof Array;
}

/**
 * F: 숫자로만 구성되어있는지 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isNum = function( string ) {
	return keis.chk.isReg( string, keis.c.REG_PTN.IS_NUM );
}

/**
 * F: 숫자가 없는지 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isNotNum = function( string ) {
	return keis.chk.isReg( string, keis.c.REG_PTN.IS_NOT_NUM );
}

/**
 * F: 영문자로만 구성되어있는지 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isEng = function( string ) {
	return keis.chk.isReg( string, keis.c.REG_PTN.IS_ENG );
}

/**
 * F: 영문자와 숫자로만 구성되어있는지 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isNumEng = function( string ) {
	return keis.chk.isReg( string, keis.c.REG_PTN.IS_NUM_ENG );
}

/**
 * F: 한글로만 구성되어있는지 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isKor = function( string ) {
	return keis.chk.isReg( string, keis.c.REG_PTN.IS_KOR );
}

/**
 * F: 한글과 숫자로만 구성되어있는지 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isNumKor = function( string ) {
	return keis.chk.isReg( string, keis.c.REG_PTN.IS_NUM_KOR );
}

/**
 * F: 주민등록번호 여부를 확인한다.
 * @param {String} string 검사할 문자열
 * @return {Boolean} 검사결과
 */
keis.chk.isPsn = function( string ) {

	// 형식 체크
	if( ! keis.chk.isReg(string, keis.c.REG_PTN.IS_RRN) ) return false;
	var _rrn = keis.str(string).setNum().val();

	// 날짜정합성 체크
	var _birth = keis.chk.isReg( _rrn.substr(6,1), /[1|2]/ ) ? "19" : "20";
	_birth += _rrn.substr(0,6);

	if( keis.date(_birth).val() == null ) return false;

	// 체크섬
	var _sum = 0;
	var _chk = [ 2,3,4,5,6,7,8,9,2,3,4,5 ];

	for(var inx = 0; inx < 12; inx++ )
		_sum += ( Number(_rrn.charAt(inx)) * _chk[inx] );

	return !((11 - (_sum % 11)) % 10 != Number(_rrn.charAt(12)));

}

/**
 * F: 이메일 여부를 확인한다.
 * @param {Object|String} obj 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isEmail = function( obj ) {
	return keis.chk.isReg( obj, keis.c.REG_PTN.IS_EMAIL );
}

/**
 * F: 검사항목의 값이 최대 바이트수 이하인지 확인한다.
 * @param {String} string 검사할 개체
 * @param {Number} chkByte 최대 바이트수
 * @return {Boolean} 검사결과
 */
keis.chk.isMaxByte = function( string, chkByte ) {
	return keis.str(string).bytes() <= chkByte;
}

/**
 * F: 검사항목의 값이 최소 바이트수 이상인지 확인한다.
 * @param {String} string 검사할 개체
 * @param {Number} chkByte 최소 바이트수
 * @return {Boolean} 검사결과
 */
keis.chk.isMinByte = function( string, chkByte ) {
	return keis.str(string).bytes() >= chkByte;
}

/**
 * F: 검사항목의 값이 최대 길이 이하인지 확인한다.
 * @param {String} string 검사할 개체
 * @param {Number} chkLen 최대 길이
 * @return {Boolean} 최대길이 이하일 경우 true를 반환
 */
keis.chk.isMaxLen = function( string, chkLen ) {
	return keis.str(string).length() <= chkLen;
}

/**
 * F: 검사항목의 값이 최소 길이 이상인지 확인한다.
 * @param {String} string 검사할 개체
 * @param {Number} chkLen 최소 길이
 * @return {Boolean} 최소길이 이하일 경우 true를 반환
 */
keis.chk.isMinLen = function( string, chkLen ) {
	return keis.str(string).length() >= chkLen;
}

/**
 * F: 올바른 날짜인지 여부를 확인한다.
 * @param {String} obj 검사할 개체
 * @param {String} format 날짜포맷 (YYYY:년도, MM:월, DD:일, HH:시, HI:분, SS:초)
 * @return {Boolean} 검사결과
 */
keis.chk.isDate = function( string, format ) {
	return keis.date( string, format ).val() != null;
}

/**
 * F: 일반 전화번호 형식 여부를 확인한다.
 * @param {String} string 검사할 문자열
 * @return {Boolean} 검사결과
 */
keis.chk.isHomePhone = function( string ) {
	return keis.chk.isReg( string, keis.c.REG_PTN.IS_HOME_PHONE );
}

/**
 * F: 핸드폰 전화번호 형식 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isCellPhone = function( string ) {

	var p = keis.str(string).substr(0,3).val();

	return keis.chk.isReg( obj, ( p == "010" ) ? keis.c.REG_PTN.IS_CELL_PHONE2 : keis.c.REG_PTN.IS_CELL_PHONE1 );
}

/**
 * F: 정의한 MASK형식에 맞는지 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @param {String} format 패턴 ( X:문자, 9:숫자, *:문자 또는 숫자 )
 * @return {Boolean} 검사결과
 */
keis.chk.isMasked = function( string, format ) {

	var ptn = keis.str(format).val();

	ptn = ptn.replace( /[x|X]/g, "[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]" );
	ptn = ptn.replace( /[9]/g, "[0-9]" );
	ptn = ptn.replace( /\*/g, "." );

	ptn = eval( "/" + ptn + "/g" );

	return keis.chk.isReg( string, ptn );
}

/**
 * F: 국내거소신고번호(외국인등록번호,재외국민등록번호) 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isFsn = function( string ) {

	// 형식 체크
	if( ! keis.chk.isReg(obj, keis.c.REG_PTN.IS_FGN) ) return false;
	var _rrn = keis.str(string).setNum().val();

	if(((_rrn.substr(7,1) * 10) + _rrn.substr(8,1)) % 2 != 0)
		return false;

	// 날짜정합성 체크
	var _birth = keis.chk.isReg( _rrn.substr(6,1), /[5|6]/ ) ? "19" : "20";
	_birth += _rrn.substr(0,6);
	_birth = keis.obj.getDate( _birth );
	if( _birth == null ) return false;

	// 등록기관체크(7.외국국적동포, 8.재외국민, 9.외국인)
	if( !keis.chk.isReg( _rrn.substr(11,1), /[7|8|9]/ ) )
		return false;

	// 체크섬
	var _sum = 0;
	var _chk = [ 2,3,4,5,6,7,8,9,2,3,4,5 ];

	for(var inx = 0; inx < 12; inx++ )
		_sum += ( Number(_rrn.charAt(inx)) * _chk[inx] );

	return !(((11 - (_sum % 11)) + 2) % 10 != Number(_rrn.charAt(12)));

}

/**
 * F: 사업자등록번호 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isCsn = function( string ) {

	var _bun = keis.str(string).setNum().val();
	if( !keis.chk.isReg(_bun, keis.c.REG_PTN.IS_NUM) || !keis.chk.isReg(_bun, /^\d{10}$/))
		return false;

	var ckValue = new Array(10);
	ckValue[0] = ( parseFloat(_bun.substring(0 ,1)) * 1 ) % 10;
	ckValue[1] = ( parseFloat(_bun.substring(1 ,2)) * 3 ) % 10;
	ckValue[2] = ( parseFloat(_bun.substring(2 ,3)) * 7 ) % 10;
	ckValue[3] = ( parseFloat(_bun.substring(3 ,4)) * 1 ) % 10;
	ckValue[4] = ( parseFloat(_bun.substring(4 ,5)) * 3 ) % 10;
	ckValue[5] = ( parseFloat(_bun.substring(5 ,6)) * 7 ) % 10;
	ckValue[6] = ( parseFloat(_bun.substring(6 ,7)) * 1 ) % 10;
	ckValue[7] = ( parseFloat(_bun.substring(7 ,8)) * 3 ) % 10;
	ckTemp = String((parseFloat(_bun.substring(8 ,9)) * 5)) + "0";
	ckValue[8] = parseFloat( ckTemp.substring(0,1) ) + parseFloat( ckTemp.substring(1,2) );
	ckValue[9] = parseFloat(_bun.substring(9,10));
	ckLastid = (10 - (( ckValue[0]+ckValue[1]+ckValue[2]+ckValue[3]+ckValue[4]+ckValue[5]+ckValue[6]+ckValue[7]+ckValue[8] ) % 10 )) % 10;

	return !(ckValue[9] != ckLastid);
}

/**
 * F: 법인등록번호 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isLsn = function( string ) {

	// 형식 체크
	var _bin = keis.str(string).setNum().val();
	if( !keis.chk.isReg(_bin, keis.c.REG_PTN.IS_NUM) || !keis.chk.isReg(_bin, /^\d{13}$/))
		return false;

	var _chk = [ 1,2,1,2,1,2,1,2,1,2,1,2 ];
	var _sum = 0;
	for(var i = 0; i < _chk.length; i++){
		_sum += _chk[i] * _bin.substring(i ,i+1);
	}

	return ((10 - _sum % 10) % 10 == _bin.substring(12 ,13));

}

/**
 * F: 영문자와 숫자 두가지 혼합으로 구성되어있는지 여부를 확인한다.
 * @param {String} string 검사할 개체
 * @return {Boolean} 검사결과
 */
keis.chk.isNumAndEng = function( string ) {

	if(keis.chk.isReg( string, keis.c.REG_PTN.IS_NUM_ENG ))
		return (!keis.chk.isReg( string, keis.c.REG_PTN.IS_NUM ) && !keis.chk.isReg( string, keis.c.REG_PTN.IS_ENG))
	else
		return false;
}



/**
 * F: 실명인증시 14세 미만 체크 스크립트
 * @param {String} 주민번호 앞자리 8자리
 * @param {String} 주민번호 뒷자리 첫번째수
 * @return {String} N 14세미만, M 14세이상 18세미만, Y 18세이상, I 입력형식 오류
 */
keis.chk.isMoreThan14age = function(socno1, checkYear){

    var u_year;
    var u_month;
    var u_day;
    var v_age;
    var v_today = new Date();

    if( checkYear > 0 &&  checkYear < 3)
       u_year = "19" + socno1.substring(0, 2)
    else if(checkYear > 2 &&  checkYear < 5)
       u_year = "20" + socno1.substring(0, 2)
    else return 'wrong';     // 2002.10.8 주민등록뒷자리 첫번째 번호 유효성 체크 (1,2,3,4) are only valid  -- by muse

    u_month = socno1.substring(2, 4);
    u_day = socno1.substring(4);

    var rVal = isValidDate(u_year, u_month, u_day );
    if( rVal == 'N' ) return 'I';
    else if( rVal == 'Y' ){
        v_age = v_today.getFullYear()*1 - u_year*1;
        if( u_month*1 > (v_today.getMonth*1+1) ){
            v_age -= 1;
        }
        else if( u_month*1 == (v_today.getMonth()*1+1) && u_day*1 > v_today.getDate()*1 ){
            v_age -= 1;
        }
    }

    if( v_age < 14 ) return 'N';
    else if( v_age >= 14 && v_age < 18 ) return 'M';
    else return 'Y';

    function isValidDate ( v_year, v_month, v_day){
        var today = new Date();
        var d_year = v_year*1;
        var d_month = v_month*1;
        var d_day = v_day*1;
        /* 과거 날짜여야 함. */
        if( v_year > today.getFullYear() )
            return 'N';
        else if( v_year == today.getFullYear() && v_month*1 > (today.getMonth()*1+1))
            return 'N';
        else if( v_year == today.getFullYear() && v_month*1 == (today.getMonth()*1+1) && v_day > today.getDate())
            return 'N';

        /* 달별 일 check */
        if( d_month == 1 || d_month == 3 || d_month == 5 || d_month == 7 || d_month == 8 || d_month == 10 || d_month == 12){
            if( d_day > 31 || d_day < 1) return 'N';
        }
        else if(d_month == 4 || d_month == 6 || d_month == 9 || d_month == 11 ){
            if( d_day > 30 || d_day < 1 ) return 'N';
        }
        else if( d_month == 2 )
        {
          if( ((d_year%4) == 0 && (d_year%100)!= 0) || ((d_year%100) == 0 && (d_year%400) == 0) ){
              if( d_day > 29 || d_day < 1 ) return 'N';
          }
          else {
              if( d_day > 28 || d_day < 1 ) return 'N';
          }
        }

        return 'Y';
    }
}

/**
 * F: 입력값이 대문자인지를 확인한다.
 * @param {String} 문자열
 * @return {boolean} true 맞음 false틀림
 */
keis.chk.uppercase = function(string){
	return (keis.chk.isReg(string, keis.c.REG_PTN.IS_UPPERCASE));
}
/**
 * F: 입력값이 소문자인지를 확인한다.
 * @param {String} 문자열
 * @return {boolean} true 맞음 false틀림
 */
keis.chk.lowercase = function(string){
	return (keis.chk.isReg(string, keis.c.REG_PTN.IS_LOWERCASE));
}
/**
 * F: 체크박스 라디오박스가 체크되어 있는지를 확인한다.
 * @param {String} 대상이름
 * @return {boolean} true 체크한값있음 false 체크한값없음
 */
keis.chk.comboBoxChk = function(objectName){
	var flag = false;
	var chkList = document.getElementsByName(objectName);

	for(var i = 0; i < chkList.length; i++){

		if(chkList[i].checked){
			flag = true;
			break;
		}
	}
	return flag;
}
/**
* F: 국내 일반 전화번호를 입력 받아 오류가 있는 위치를 반환한다.
* @param {String} no1 지역번호
* @param {String} no2 국번
* @param {String} no3 번호
* @return {int} 검사결과 (0:이상없음, 1:지역번호오류, 2:국번오류, 3:번호오류)
*/
keis.chk.invalidHomePhone = function() {
       var args     = arguments;
       //var ptns     = [/^0[2-8][0-5]?$/, /^[1-9][\d]{2,3}$/, /^[0-9]{4}$/];
       var ptns     = [/^0[2-8][0-5]?$/, /^[0-9][\d]{2,3}$/, /^[0-9]{4}$/];

       if(!args[0] || !keis.chk.invalidKeisHomePhoneNo1(args[0])) return 1;

       for (var i=1, ptn; ptn=ptns[i]; i++) if (!args[i] || !args[i].match(ptn)) return i+1;
       return 0;
};
/**
* F: 국내 핸드폰번호를 입력 받아 오류가 있는 위치를 반환한다.
* @param {String} no1 사업자번호
* @param {String} no2 국번
* @param {String} no3 번호
* @return {int} 검사결과 (0:이상없음, 1:사업자번호오류, 2:국번오류, 3:번호오류)
*/
keis.chk.invalidCellPhone = function() {
    var args     = arguments;
//  2013.12.02부터 앞자리가 010으로 자동전환되면서 010으로 시작하는 번호중 가운데 3자리번호가 존재하게 됨.
//  var fO10     = args[0] == '010';
//  var ptns     = fO10 ? [/^010$/, /^[2-9]{1}[\d]{3}$/, /^[\d]{4}$/] : [/^01[1346-9]$/, /^[1-9]{1}[\d]{2,3}$/, /^[\d]{4}$/];
    var ptns     = [/^01[01346-9]$/, /^[1-9]{1}[\d]{2,3}$/, /^[\d]{4}$/];

    for (var i=0, ptn; ptn=ptns[i]; i++) if (!args[i] || !args[i].match(ptn)) return i+1;

    return 0;
};
/**
* F:  국내 지역번호 전화번호를 입력 받아 오류가 있는 위치를 반환한다.(워크넷용)
* @param {String} no1 지역번호
* @return {int} 검사결과 (true:이상없음, false:지역번호오류)
*/
keis.chk.invalidKeisHomePhoneNo1 = function(no1) {
	var flag = false;
    var no1List = keis.c.CHK.IS_KEIS_HOME_PHONE;

    //지역번호 검사
    for(var i=0; i < no1List.length; i++){
    	if(!no1)return flag;
    	if(no1List[i] == no1){
    		flag = true;
    		break;
    	}
    }
    return flag;
};

