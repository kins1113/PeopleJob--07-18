// [KEIS04] keis.COMBO=======================================================
/**
 * C: 콤보박스 클래스
 * <pre>
 * var combo1 = keis.combo("#cmbTemp1");
 * var combo2 = keis.combo("#cmbTemp2", "A");
 * </pre>
 * @param {String} id 개체 id
 * @param {String} defaultValue ( A:전체('%'), S:선택(''), null:기본값이 없다. )
 * @return {keis.combo}
 * @classDescription 정합성 체크 유틸리티 모음으로 필요한 함수를 객체생성 없이 사용가능하다. 
 * @author 통합1팀 응용아키텍트 2011.07.14
 * 
 * */
keis.combo = function( id, defaultValue ) {

	var z_self = arguments.callee;
	if(!(this instanceof z_self)) return new z_self( id, defaultValue );

	this.z_id    = id;
	this.z_dfVal = defaultValue;

	// initializing
	if( $.isReady ) {
		this.init();
	} else {
		$(document).ready( $.proxy(this, "init") );
	}
}


keis.combo.prototype = {

  /**
   * F: 콤보박스를 초기화한다.
   * @return {keis.combo}
   */
	init : function() {

		if( $(this.z_id).length != 1 ) return this;

		var tagName = $(this.z_id).prop("tagName");

		if( keis.chk.isNull(tagName) || tagName != "SELECT" ) {
			keis.etc.changeTagName( this.z_id, "select" );
		}

		this.setDefault( this.z_dfVal );

		return this;
	},

  /**
   * F: 콤보의 초기값 설정을 변경한다.
   * @param {String} flag ( A:전체('%'), S:선택(''), null:기본값이 없다. )
   * @return {keis.combo}
   */
	setDefault : function( flag ) {

		if( flag != "A" && flag != "S" && ! keis.chk.isEmpty(flag) ) return;

		this.z_dfVal = flag;

		var value = $(this.z_id+">option:eq(0)").val();
		var label = $(this.z_id+">option:eq(0)").text();

		var dfVal1 = ( value == "%" && label == keis.c.COMBO.LABEL_ALL );
		var dfVal2 = ( value == ""  && label == keis.c.COMBO.LABEL_SELECT );

		switch( flag ) {
			// 설정값 변경이 없다면
			case value : break;
			// 설정값을 지우려면
			case undefined : case null : case "" :
				
				if( !dfVal1 && !dfVal2 ) break;
				$(this.z_id+">option:eq(0)").remove();
			break;
			// 설정값을 변경하려면
			default    :
				if( !dfVal1 && !dfVal2 ) {
					$(this.z_id).prepend( "<option>");
				}
				$(this.z_id+">option:eq(0)").val( flag );
				$(this.z_id+">option:eq(0)").text( flag=="A" ? keis.c.COMBO.LABEL_ALL : keis.c.COMBO.LABEL_SELECT );
				this.val( flag );
		}

		return this;
	},

  /**
   * F: 콤보 데이터를 초기화한다.
   * @return {keis.combo}
   */
	clear : function() {
		if( $(this.z_id).length == 1 ) {
			$(this.z_id)[0].options.length = 0;
			this.setDefault( this.z_dfVal );
		}

		return this;
	},

  /**
   * F: 콤보객체의 값을 가져오거나 세팅한다.
   * @param {String} value  세팅할 값
   * @return {String} 객체의 값
   */
	val : function( value ) {
		if( value == undefined ) return $(this.z_id).val();
		$(this.z_id).val( value );
		return value;
	},

  /**
   * F: 콤보에 데이터를 bind 한다.
   * @param {JSON} data JSON 데이터
   * <pre>
   * 입력되는 데이터는 label, value 속성을 가지고 있어야 한다.
   * 데이터 형식은 다음과 같다.
   * var tempData = [
   *  {value:'1', label:'a-1' },
   *  {value:'2', label:'a-2' }
   * ]
   * </pre>
   * @param {Boolean} appendYn 데이터 추가여부 (기본값:false)
   * @return {keis.combo}
   */
	bind : function( data, appendYn ) {

		if( appendYn != true ) this.clear();

		try {
			for (var inx = 0, inxCnt = data.length; inx < inxCnt; inx++) {
				this.addOption( data[inx].value, keis.str.unclearXss(data[inx].label) );
			}
		} catch (e) {}

		return this;
	},

  /**
   * F: 콤보객체에 option 데이터를 추가한다.
   * @param {String} value  값
   * @param {String} label  라벨
   * @return {keis.combo}
   */
	addOption : function( value, label ) {
		var option = new Option( label, value );
		try {
			if( $.browser.msie ) {
				$(this.z_id)[0].add( option );
			} else {
				$(this.z_id)[0].add( option, null );
			}
		} catch( e ) {
			keis.msg.debug( e );
		}

		return this;
	},

  /**
   * F: 콤보객체의 option 데이터를 삭제한다. <br>
   * 일반적으로는 value값만 지정해서 삭제하면 된다.<br>
   * 만약 value 값이 동일한 다건의 option 중 특정 label을 갖는 요소만 삭제하고 싶은 경우에는
   * value와 label을 동시에 지정해준다.
   * @param {String} value 값
   * @param {String} label 라벨 (Optional)
   * @return {keis.combo}
   */
	delOption : function( value, label ) {

		var option = $(this.z_id).find("option[value=" + value + "]");

		if( !keis.chk.isNull(label) ) {
			option.each( function() {
				if( $(this).html() == label ) $(this).remove();
			});
		} else {
			option.remove();
		}
		return this;
	}

}