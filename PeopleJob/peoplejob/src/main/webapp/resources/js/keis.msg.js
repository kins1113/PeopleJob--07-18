// [KEIS11] keis.MSG=======================================================

/**
* O: 메세지 처리 유틸리티
* @classDescription 메세지 처리 유틸리티
 * @author 통합1팀 응용아키텍트 2011.07.14
*/
keis.msg = {
};

keis.msg.z_p = {
	msgPool   : [],
	debugPool : []
}

/**
* F: 메세지코드에 해당하는 문자열을 출력한다.
* <pre>
*   keis.msg.alert( "기상청 프로젝트" );
*   keis.msg.alert( "@는 죽어납니다.", "정화수" );
*   keis.msg.alert( "err.info.001", "hudson", "komaf" );
* </pre>
* @param  {String}    msgCd       메세지코드 또는 출력할 메세지
* @param  {Argument}  replaceStr  메세지에서 '@' 문자와 치환될 문자배열
* @author 정화수. 2011.03.23
*/
keis.msg.alert = function( msgCd ) {
	alert( keis.msg.get(arguments) );
}

/**
* F: 문자열을 confirm box로 보여준 후 사용자의 선택결과를 반환한다.
* <pre>
*   if( keis.msg.confirm( "ok??" ) ) processY(); else processN();
* </pre>
* @param  {String}    msgCd       메세지코드 또는 출력할 메세지
* @param  {Argument}  param       메세지에서 '@' 문자와 치환될 문자배열
* @return {Boolean}   true(Y)/false(N)
*/
keis.msg.confirm = function( msgCd ) {
	return confirm( keis.msg.get(arguments) );
}

/**
 * F: 로그를 출력한다.
 * @param {String} message 출력할 메세지
 */
keis.msg.debug = function( message ) {

	if( ! keis.conf.log.debug ) return;
	
	var msg = "<p>" + keis.date().toString("[HH:MI:SS]") + " " + keis.str(message).clearXss().val() + "</p>";

	if( !keis.msg.z_p.makeDebugger(msg) ) return;

	$(keis.c.ID.DEBUG_TXT).append( msg ).scrollTop( 65535 );

}

/**
* F: '@' 문자에 해당하는 메세지를 치환해서 반환한다.
* <pre>
* keis.msg.get( '@_@_TEST', 'merong', 'nuna' ); -> 반활할 문자는 'merong_nuna_TEST'
* keis.msg.get( 'com.alt.001' ); -> 'com.alt.001' 코드에 해당하는 문자를 반환 (코드는 서버와 동일)
* </pre>
* @param  {String}    inputMsg  출력할 메세지
* @param  {Argument}  param     메세지에서 '@' 문자와 치환될 문자열
* @return {String}  반환할 메세지
* @author 정화수(2007.07.08)
*/
keis.msg.get = function( inputMsg ) {

	if( keis.chk.isTypObj(arguments[0]) ) arguments = arguments[ 0 ];

	var argLen = arguments.length;

	if( argLen == 0 ) return '';

	var code = arguments[0] + "";

	var msg = keis.msg.z_p.msgPool[ code ];
	if( msg == null ) msg = code;

	if( argLen == 1 ) return msg;

	// bind @ to Input String (array)
	var idx = 0;

	for( var i = 1; i < argLen; i++ ) {

		idx = msg.indexOf( "@", idx );

		if( idx < 0 ) break;

		// "/@" 패턴일 경우 @문자를 그대로 출력
		if( msg.charAt(idx - 1) == "/" ) {

			msg = msg.substring( 0, idx - 1 ) + msg.substring( idx );
			i--;
			idx++;
			continue;
		}

		var param = keis.str( arguments[i] );

		var msgAfter = msg.substring( idx + 1 );

		// 한글문자일 경우 은/는/이/가 처리
		var charKr = param.getLastKr();
		if( charKr[0] != null ) {

			msgAfter = msgAfter.substring( 0, 4 )
			.replace( keis.c.REG_PTN.HAN_JOSA_MERGE_1, keis.c.REG_PTN.HAN_JOSA[0] )
			.replace( keis.c.REG_PTN.HAN_JOSA_MERGE_2, keis.c.REG_PTN.HAN_JOSA[2] )
			.replace( keis.c.REG_PTN.HAN_JOSA_MERGE_3, keis.c.REG_PTN.HAN_JOSA[4] )
			+ msgAfter.substring( 4 );

			var josa = msgAfter.charAt( 0 );
			var which;

			$.each( keis.c.REG_PTN.HAN_JOSA, function(n) {

				if( josa != this ) return true;

				which = n;
				return false;

			});

			switch( which ) {

			case 0 : case 1 :
				which = ( charKr[2] != "" ) ? 0 : 1; break;
			case 2 : case 3 :
				which = ( charKr[2] != "" ) ? 2 : 3; break;
			case 4 : case 5 :
				which = ( charKr[2] != "" ) ? 4 : 5; break;

			}

			if( which != undefined ) msgAfter = keis.c.REG_PTN.HAN_JOSA[which] + msgAfter.substring( 1 );
		}

		msg = msg.substr( 0, idx ) + param.val() + msgAfter;
		idx = idx + param.length();
	}
	return msg;
}

/**
 * F: 디버그용 창을 만든다.
 * @private
 */
keis.msg.z_p.makeDebugger = function( message ) {

	// 패널 생성가능 여부를 확인한다.
	if( !$.isReady ) {
		keis.msg.z_p.debugPool.push( message );
		setTimeout( arguments.callee, 50 );
		return false;
	}

	if( keis.conf.log.panelExist ) return true;

	// 화면 위치를 조정한다.
	var mL   = keis.conf.log.window.width - 190;
	var top  = $(window).height() - keis.conf.log.window.height - 10;
	var left = $(window).width()  - keis.conf.log.window.width  - 20;

	if( mL   < 0 ) ml   = 10;
	if( top  < 0 ) top  = 0;
	if( left < 0 ) left = 0;

	// 디버그 패널을 생성한다.
	$("<div>").css({
		"position"   : "fixed",
		"font-size"  : keis.conf.log.window.fontSize,
		"color"      : "#FFFFFF",
		"background" : "#000000",
		"border"     : "1px solid",
		"opacity"    : "0.7",
		"width"      : keis.conf.log.window.width,
		"height"     : keis.conf.log.window.height,
		"white-space": "nowrap",
		"top"        : top,
		"left"       : left
	}).attr("id", keis.c.ID.DEBUG_PANEL.replace("#",""))
	.append(
			$("<div>")
			.append( "<span style='font-weight:bold;text-decoration:underline;'>komaf-ui Logger</span>" )
			.append( "<a href='javascript:;' onclick='keis.msg.z_p.clearDebugger();' style='color:#FAEB78;margin-left:" + mL + "px;'>clear</a>")
			.append( "<a href='javascript:;' onclick='keis.msg.z_p.closeDeubgger();' style='color:#FAEB78;margin-left:10px'>close</a>")
	)
	.append(
			$("<div>").attr("id", keis.c.ID.DEBUG_PANEL.replace("#","") + "Desc" )
			.css({
				"overflow" : "scroll",
				"height"   : keis.conf.log.window.height - 15
			})
	).appendTo("body").show();

	// 미출력 메세지 출력
	$.each( keis.msg.z_p.debugPool, function() {
		$(keis.c.ID.DEBUG_TXT).append( this.toString() );
	});

//  $( keis.msg.z_p.debugPool ).each( function(i){
//    $(keis.c.ID.DEBUG_TXT).append( keis.msg.z_p.debugPool[i] );
//  });

	keis.msg.z_p.debugPool = null;
	keis.conf.log.panelExist = true;

	return true;
}

/**
 * F: 로그 창의 내용을 모두 지운다.
 */
keis.msg.z_p.clearDebugger = function() {
	$(keis.c.ID.DEBUG_TXT).html("");
}

/**
 * F: 로그 창을 숨긴다.
 */
keis.msg.z_p.closeDeubgger = function() {
	$(keis.c.ID.DEBUG_PANEL).hide();
}