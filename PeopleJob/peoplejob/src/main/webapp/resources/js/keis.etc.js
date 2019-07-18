// [KEIS08] keis.ETC=======================================================

/**
 * O: 기타 유틸리티
 * @classDescription 파일명으로 구분한 javascript외의 기타 유틸리티 함수 모음
 * @author 통합1팀 응용아키텍트 2011.07.14
 */
keis.etc = {};

/**
 * F: 지정한 시간만큼 동작을 멈춘다.<br>
 * CPU 자원을 많이 소모하기 때문에 특별한 경우가 아니라면 사용을 금한다.
 * @param {Number} msecs 동작을 멈출 시간 (단위:1/1000초)
 */
keis.etc.wait = function( msecs ) {
	var curr = strt = new Date();
	while(curr - strt < msecs) { curr = new Date(); }
}

/**
 * F: 값이 없다면 지정한 객체로 반환받는다.
 * @param {Object} obj 검사할 객체
 * @param {Object} replace null일 경우 치환할 객체
 * @return {Object}
 */
keis.etc.nvl = function( obj, replace ) {

	if( obj == null || obj == undefined ) return replace;
	return obj;

}

/**
 * F: 현재 포커스된 개체의 ID를 구한다.
 * @return {String} focus 개체의 ID
 */
keis.etc.getFocusId = function() {
	var id = keis.etc.nvl(document.activeElement, {id:""} ).id;
	return id;
}

/**
 * F: 조회결과를 같은 name 속성을 가진 개체의 값으로 binding 한다.<br>
 * @param {String} expression jQuery 표현식
 * @param {Object} data 데이터 (keis.ajax.res 에 들어있는 조회결과 데이터)
 */
keis.etc.bindByName = function( expression, data ) {

	var self = this;

	$(expression).each( function() {

		var th   = $(this);
		var name = th.attr("name");

		if( !keis.chk.isEmpty(name) ) {

			if( th.is(":input") ) {
				th.val( keis.str.unclearXss(keis.str.nvl(data[name], "")) );
			} else {
				th.html( keis.str.nvl(data[name], "") );
			}

		} else {
			self.bindByName( $("*[name]", th), data );
		}

	});
}

/**
 * F: 조회결과를 같은 id 속성을 가진 개체의 값으로 binding 한다.<br>
 * @param {String} expression jQuery 표현식
 * @param {Object} data 데이터 (keis.ajax.res 에 들어있는 조회결과 데이터)
 */
keis.etc.bindById = function( expression, data ) {

	var self = this;
	
	$(expression).each( function() {

		var th   = $(this);
		var id = th.attr("id");

		if( !keis.chk.isEmpty(id) ) {

			if( th.is(":input") ) {
				th.val( keis.str.unclearXss(keis.str.nvl(data[id], "")) );
			} else {
				th.html( keis.str.nvl(data[id], "") );
			}

		} else {
			self.bindById( $("*[id]", th), data );
		}

	});
}

/**
 * document가 onready 상태일 경우 지정한 함수를 실행한다.
 * @param {Function} fn onready 상태일 경우 실행할 함수
 */
keis.etc.onreadyCall = function( fn ) {

	if( !$isReady ) {};

	// initializing
	if( $.isReady ) {
		fn();
	} else {
		$(document).ready(function(){ fn(); });
	}
}

/**
 * DOM 엘리먼트의 tag name을 변경한다.<br/>
 * <INPUT> 태그를 <DIV> 태그로 바꾸는 등의 작업에 사용한다.
 *
 * @param {String} id       개체의 ID
 * @param {String} tagName  변경할 tag name (input, div, select ... )
 */
keis.etc.changeTagName = function( id, tagName ) {

    if( $(id).length != 1 ) return;

    var z_tagName = $(id).attr("tagName");

    if( z_tagName == tagName.toUpperCase() ) return;

    var z_srcTag = $("<div/>").append( $(id).clone(true) ).html();

    var z_trgTag = z_srcTag.replace( eval( "/<" + z_tagName + "/i" ), "<" + tagName ).replace( eval( "/\/" + z_tagName + ">/i" ),"/" + tagName + ">");

    $(id).replaceWith( z_trgTag );

}

/**
 * 배열의 차원을 구한다.
 *
 * @param {Array} array
 * @return {Number} 배열의 차원
 */
keis.etc.getArrDim = function( array, cnt ) {

	if( keis.chk.isNull(cnt) ) cnt = 0;
	if( ! keis.chk.isTypArr(array) ) return cnt;

	cnt++;

	try{
		return keis.etc.getArrDim( array[0], cnt );
	} catch(e) {
		return cnt;
	}

}