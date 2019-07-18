// [KEIS06] keis.DATA=======================================================
/**
 * C: 데이터셋 클래스
 * <pre>
 * </pre>
 * @classDescription keis javascript 내의 Object 데이터 구조의 객체를 컨트롤 한다.
 * @author 통합1팀 응용아키텍트 2011.07.14
 */
keis.data = function() {
	this.z_data = new Object();
}

/**
 * F: 데이터를 세팅한다.
 * @param {String} key
 * @param {Object} value
 */
keis.data.prototype.add = function( key, value ) {
	if( keis.chk.isNull(key) ) return;
	this.z_data[ key ] = value;
}

/**
 * F: 데이터를 삭제한다.
 * @param {String} key
 */
keis.data.prototype.del = function( key ) {
	if( keis.chk.isNull(key) ) return;
	delete this.z_data[key];
}

/**
 * F: 데이터가 해당 키를 가지고 있는지 여부를 확인한다.
 * @param {String} key
 */
keis.data.prototype.hasKey = function( key ) {
	if( keis.chk.isNull(key) ) return false;
	return ( keis.chk.isNull(this.z_data[key]) ) ? false : true;
}

/**
 * F: 폼데이터를 더한다.<br>
 * 개체의 name 속성이 키, value 속성이 값으로 세팅된다.
 * @param {String} expression jquery 셀렉터
 */
keis.data.prototype.addForm = function( expression ) {

	var self = this;

	$(expression).each( function() {

		var th = $(this);

		if( th.is("[type=button]") ) return true;
		if( th.attr("name") == "" ) return true;

		if( th.is(":input") ) {
			self.add( th.attr("name"), th.val() );
		} else {
			self.addForm( $(":input", th) );
		}

	});
}

/**
 * F: 키값에 해당하는 데이터를 추출한다.
 * @param {String} key 키
 */
keis.data.prototype.get = function( key ) {
	return this.z_data[ key ];
}

/**
 * F: 데이터를 초기화한다.
 */
keis.data.prototype.clear = function() {
	this.z_data = new Object();
}

/**
 * F: 데이터의 크기를 반환한다.
 * @return {Number} 데이터크기
 */
keis.data.prototype.size = function() {
	var z_max = 0;
	for( var c in this.z_data ) {
		z_max++;
	}
	return z_max;
}

/**
 * F: 입력한 정보의 헤더값을 반환한다.
 * @return {Array} 헤더정보
 */
keis.data.prototype.getHeader = function() {
	var header = [];
	for( var c in this.z_data ) {
		header.push( c );
	}
	return header;
}

/**
 * F: JSON 형식의 raw 데이터를 반환한다.
 * @return {Object} JSON 데이터
 */
keis.data.prototype.getData = function() {
	return this.z_data;
}

/**
 * F: 데이터를 병합한다.
 * @param {keis.data} mergeData 병합할 데이터
 */
keis.data.prototype.merge = function( mergeData ) {

	var src = this.z_data;
	var des = mergeData.getData();

	this.z_data = $.extend( src, des );

}

/**
 * F: 데이터가 동일한지 확인한다.
 * @param {keis.data} data 비교할 데이터
 * @return {Boolean} 동일여부
 */
keis.data.prototype.equals = function( data ) {

	if( ! (data instanceof keis.data) ) return false;

	var thisHdr = this.getHeader();
	var dataHdr = data.getHeader();

	if( thisHdr.length != dataHdr.length ) return false;

	for( var i = 0, iCnt = thisHdr.length; i < iCnt; i++ ) {

		var key = thisHdr[ i ];
		var src = this.get( key );
		var trg = data.get( key );

		if( trg  == undefined ) return false;
		if( src != trg ) return false;
	}

	return true;

}