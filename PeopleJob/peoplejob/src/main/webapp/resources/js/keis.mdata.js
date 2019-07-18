// [KEIS10] keis.MDATA=======================================================
/**
 * C: 멀티 데이터셋 클래스
 * @classDescription  keis javascript 내의 Object 멀티 데이터 구조의 객체를 컨트롤 한다.
 * @author 통합1팀 응용아키텍트 2011.07.14
*/
keis.mdata = function() {
  this.z_data = new Object();
}

/**
* F: 데이터를 더한다.
* @param {String} key 키
* @param {Object} value 값
*/
keis.mdata.prototype.add = function( key, value ) {

  if( keis.chk.isNull(key) ) return;
  if( keis.chk.isNull(value) ) {
    value = "";
  } else {
    value = !isNaN(value) ? value : ( keis.chk.isTypStr(value) ) ? value :$(value).val();
  }

  if( !this.z_data[key] ) {
    this.z_data[ key ] = [];
  }
  this.z_data[ key ].push( value );
}

/**
 * F: 데이터를 삭제한다.
 * @param {String} key 키
 */
keis.mdata.prototype.del = function( key ) {
  if( keis.chk.isNull(key) ) return;
  delete this.z_data[key];
}

/**
* F: 폼데이터를 더한다.<br>
* 개체의 name 속성이 키, value 속성이 값으로 세팅된다.
* @param {String} expression 셀렉터
*/
keis.mdata.prototype.addForm = function( expression ) {

  var self = this;

  $(expression).each( function() {

    var th = $(this);

    if( th.is("[type=button]") ) return true;

    if( th.is(":input") ) {
      if( th.attr("name") == "" ) return true;
      self.add( th.attr("name"), keis.z_vdCore.getUnmaskedVal(th) );
//      self.add( th.attr("name"), th );

    } else {
      self.addForm( $(":input", th) );
    }

  });

}

/**
 * F: 키와 인덱스 순서에 해당하는 값을 가져온다.
 * @param {String} key 키
 * @param {Number} index 인덱스
 * @return {String} 값
 */
keis.mdata.prototype.get = function( key, index ) {
  if( !this.z_data[key] ) return null;
  return this.z_data[ key ][ index ];
}

/**
 * F: 데이터를 초기화한다.
 */
keis.mdata.prototype.clear = function() {
  this.header = [];
  this.z_data = new Object();
}

/**
 * F: 데이터의 크기를 반환한다.
 * @return {Number} 데이터크기
 */
keis.mdata.prototype.size = function() {
  var z_max = 0;
  for( var c in this.z_data ) {
    z_max = Math.max( z_max, this.z_data[c].length );
  }
  return z_max;
}

/**
 * F: 헤더값을 반환한다.
 * @return {Array} 헤더값
 */
keis.mdata.prototype.getHeader = function() {
  var z_header = [];
  for( var c in this.z_data ) {
    z_header.push( c );
  }
  return z_header;
}

/**
 * F: JSON 형식의 raw 데이터를 반환한다.
 * @return {Object} JSON 데이터
 */
keis.mdata.prototype.getData = function() {
  return this.z_data;
}

/**
 * F: 데이터의 크기를 균일하게 맞춘다.
 * @private
 */
keis.mdata.prototype.z_setMaxSize = function() {
  var size = this.size();
  for( var c in this.z_data ) {
    if( this.z_data[c].length < size ) {
      for( var inx = 1; inx < size; inx++ ) {
        if( this.z_data[c][inx] == undefined ) this.z_data[c][inx] = "";
      }
    }
  }
}

/**
 * F: URI 인코딩된 데이터 값을 가져온다.
 * @return {mdata}
 */
keis.mdata.prototype.getUriEncodeData = function() {
  var result = this.z_data;
  for( var c in result ) {
    for( var inx = 0, inxCnt = result[c].length; inx < inxCnt; inx++ ) {
      result[c][inx] = encodeURIComponent( result[c][inx] );
    }
  }
  return result;
}