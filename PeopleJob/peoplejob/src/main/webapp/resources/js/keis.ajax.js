// [KEIS02] keis.AJAX =======================================================

/**
 * C: kies Ajax 컨트롤 클래스
 * <pre>
 * var keisAjax = new keis.ajax("/ajaxCall.do", "POST", "json");
 * </pre>
 * 
 * @param {String} url - ajax호출 URL
 * @param {String} type - 전송방식( "GET", "POST") 
 * @param {String} dataType - 결과형태 ("xml", "json", "text")
 * @return {keis.ajax}
 * @classDescription Ajax를 컨트롤 하는 클래스로 Ajax요청, 파라미터 전송, 결과셋 포맷을 컨트롤 한다.
 * 
 * @constructor 통합1팀 응용아키텍트 2011.07.14
 * 
 * */
keis.ajax = function (url, type, dataType, token, header) {
	
	this.url = url;
	this.type = type;
	this.dataType = dataType;
	this.param = "";
	this.token = token;
	this.header = header;
}

/**
 * F: ajax호출 URL에 원하는 파라미터 값을 setting한다.
 * @param {String} name - parameter 이름
 * @param {String} value  - parameter 값
 * @return {void}
 */
keis.ajax.prototype.addParam = function (name, value) {

	if(this.param.length == 0){
		// 20111217 modified by jjhan
		//this.param += name + "=" + value;
		this.param += name + "=" + encodeURIComponent(value);
	} else {
		// 20111217 modified by jjhan
		//this.param += "&" + name + "=" + value;
		this.param += "&" + name + "=" + encodeURIComponent(value);
	}
}


/**
 * F: Ajax를 수행한다.
 * @param {functino} callBack - Ajax결과셋을 처리할 function명
 * @return {void}
 */
keis.ajax.prototype.send = function (callBack){
	// 추가내용 :	keis.ajax 객체를 callback 함수에 넘기기 위해 지역변수로 할당함
	// 추가일자 :	2011/10/03
	// 추가자	  :	박성진 [하늘연소프트]
	var oThis	= this;

	$.ajax({
		type: this.type,
		url: this.url, 
		data: this.param,
		dataType: this.dataType,
		beforeSend: function(request){
			var token = $("meta[name='_csrf']").attr("content");
			var header = $("meta[name='_csrf_header']").attr("content");
			//alert(token);
			if(token != null && token != 'undefinded'){
				request.setRequestHeader(header, token);
			}else if(oThis.header != null && oThis.token != null ){
				request.setRequestHeader(oThis.header, oThis.token);
			}
		},
		success: function(msg) {

			if(msg==null) return;
			
			//CallBack Function이 없을경우 Error처리를 한다.
			try {
				// 수정내용 :	1. callback 자료형이 function 인 경우 함수를 호출하고 아니면 eval 로 파싱한다.
				//			closure 함수를 활용하기 위함.
				//			2. 함수형인 경우 확장성을 고려하여 keis.ajax 객체를 넘김.
				// 수정일자 :	2011/10/03
				// 수정자	  :	박성진 [하늘연소프트]
				//
				// 원본 : return eval(callBack+'(msg)');
				return typeof callBack == 'function' ? callBack(msg, oThis) : eval(callBack+'(msg)');
			} catch (err) {
				//alert(err);
				//alert("CallBack Method가  없습니다.");
			}
		},
		error: function(msg){
			console.log('keis.ajax.prototype.send : ' + msg);
		//	alert('keis.ajax.send error : '+ msg);
		}
	});
}

