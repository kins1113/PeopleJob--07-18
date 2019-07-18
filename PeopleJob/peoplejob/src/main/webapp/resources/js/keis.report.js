// [KEIS16] keis.WINDOW=======================================================

/**
 * O: Report Designer를 출력시에 상요한는오브젝트
 * @classDescription Report Designer호출 스크립트
 * @author 통합1팀 응용아키텍트 2011.08.25
 * @param vReportName 출력물 파일 이름
 * @param vPreviewYN 직접출력여부(Y일 경우 직접 출력, N일 경우 저장 대화상자 띄움)
 * @param vRDParams 출력물에 넘겨줄 Params
 */
keis.report = function(reportFile, previewYN) {
	this.paramValueData = new keis.data();
	this.valueData = new keis.data();
	this.configData = new keis.data();
	this.configData.add("reportFile", reportFile);
	this.configData.add("previewYN", previewYN);
}

keis.report.prototype = {
	/**
	 * F: ReportDesign의 가로사이즈를 조정한다.
	 * @param {Integer} width 출력물 Window의 가로사이즈
	 * @return
	 */
	setWindowWidth : function (width){
		this.configData.add("width", width);
	},
	/**
	 * F: ReportDesign의 세로사이즈를 조정한다.
	 * @param {Integer} height 출력물 Window의 세로사이즈
	 * @return
	 */
	setWindowHeight : function (height){
		this.configData.add("height", height);
	},
	/**
	 * F: ReportDesign의 엑셀 저장시 저장될 파일명 (20111111 add by jjhan)
	 * @param {String} fileName 파라미터값 : 엑셀 저장시 저장할 파일명
	 * @return
	 */
	setSaveFileName : function(saveFileName){
		this.configData.add("saveFileName", saveFileName);
	},
	/**
	 * F: ReportDesign의 메소드 방식 지정 (20111123 add by jjhan)
	 * @param {String} submitType 파라미터값 : 메소드 방식(POST 방식만 신경쓰면 된다)
	 * @return
	 */
	setSubmitType : function(submitType){
		this.configData.add("submitType", submitType);
	},
	/**
	 * F: ReportDesign의 멀티 여부 지정 (20111205 add by jjhan)
	 * @param {String} multi 파라미터값
	 * @return
	 */
	setMultiYN : function(multiYN){
		this.configData.add("multiYN", multiYN);
	},
	/**
	 * F: ReportDesign의 bcqreYN 여부 지정 (20111227 add by jjhan)
	 * @param {String} bcqreYN 파라미터값
	 * @return
	 */
	setBcqreYN : function(bcqreYN){
		this.configData.add("bcqreYN", bcqreYN);
	},
	/**
	 * F: ReportDesign의 오픈파람 지정 (20111205 add by jjhan)
	 * @param {String} openRdParams 파라미터값
	 * @return
	 */
	setOpenRdParams : function(openRdParams){
		this.configData.add("openRdParams", openRdParams);
	},
	/**
	 * F: ReportDesign의 rv파람 지정 (20111205 add by jjhan)
	 * @param {String} rvParams 파라미터값
	 * @return
	 */
	setRvParams : function(rvParams){
		this.configData.add("rvParams", rvParams);
	},
	/**
	 * F: ReportDesign의 rp파람 지정 (20111205 add by jjhan)
	 * @param {String} rpParams 파라미터값
	 * @return
	 */
	setRpParams : function(rpParams){
		this.configData.add("rpParams", rpParams);
	},
	/**
	 * F: ReportDesign의 rPageOrder 지정 (20111205 add by jjhan)
	 * @param {String} rPageOrder 파라미터값
	 * @return
	 */
	setRpageOrder : function(rPageOrder){
		this.configData.add("rPageOrder", rPageOrder);
	},
	/**
	 * F: ReportDesign의 ruseradialaxisYN 지정 (20111205 add by jjhan)
	 * @param {String} ruseradialaxisYN 파라미터값
	 * @return
	 */
	setRuseradialaxisYN : function(ruseradialaxisYN){
		this.configData.add("ruseradialaxisYN", ruseradialaxisYN);
	},
	/**
	 * F: ReportDesign의 rcdchartxval 지정 (20111205 add by jjhan)
	 * @param {String} rcdchartxval 파라미터값
	 * @return
	 */
	setRcdchartxval : function(rcdchartxval){
		this.configData.add("rcdchartxval", rcdchartxval);
	},
	/**
	 * F: ReportDesign의 rcdcharteachcolor 지정 (20111205 add by jjhan)
	 * @param {String} rcdcharteachcolor 파라미터값
	 * @return
	 */
	setRcdcharteachcolor : function(rcdcharteachcolor){
		this.configData.add("rcdcharteachcolor", rcdcharteachcolor);
	},
	/**
	 * F: ReportDesign의 dbChiperYN 지정 (20111206 add by jjhan)
	 * @param {String} dbChiperYN 파라미터값
	 * @return
	 */
	setDbChiperYN : function(dbChiperYN){
		this.configData.add("dbChiperYN", dbChiperYN);
	},
	/**
	 * F: ReportDesign의 dbCipherIndex 지정 (20111206 add by jjhan)
	 * @param {String} dbCipherIndex 파라미터값
	 * @return
	 */
	setDbCipherIndex : function(dbCipherIndex){
		this.configData.add("dbCipherIndex", dbCipherIndex);
	},
	/**
	 * F: ReportDesign의 seekAuthNo 지정 (20120102 add by jjhan)
	 * @param {String} seekAuthNo 파라미터값
	 * @return
	 */
	setSeekAuthNo : function(seekAuthNo){
		this.configData.add("seekAuthNo", seekAuthNo);
	},
	/**
	 * F: ReportDesign의 orgCd 지정 (20120102 add by jjhan)
	 * @param {String} orgCd 파라미터값
	 * @return
	 */
	setOrgCd : function(orgCd){
		this.configData.add("orgCd", orgCd);
	},
	/**
	 * F: ReportDesign의 파라미터를 설정한다 paramName[paramValue] paramName[paramValue]구조(rv)
	 * @param {String} rdParam 파라미터명
	 * @param {String} rdValue 파라미터값
	 * @return
	 */
	setParamValue : function(rdParam, rdValue){
		this.paramValueData.add(rdParam, rdValue);
	},
	/**
	 * F: ReportDesign의 파라미터를 설정한다 [paramValue] [paramValue]구조(rp)
	 * @param {String} rdValue 파라미터값
	 * @return
	 */
	setValue : function(rdValue){
		this.valueData.add(this.valueData.size(), rdValue);
	},

	/**
	 * F: Report Designer를 출력한다.
	 * @return
	 */
	RDPrint : function (){

		// 2016.11.09 강윤철, 브라우저 종류 체크후 IE 가 아닌경우 alert 메세지 출력, keis.import.min.js 파일에 적용 했음.
		var isNeIE = false;
		var agent = window.navigator.userAgent;
		if(agent.indexOf('MSIE') > 0 || agent.indexOf('Trident') > 0) {
			isNeIE = false;
		} else  {
			isNeIE = true;
		}
		if(isNeIE) {
			alert("인터넷 익스플로러(IE) 7.X 이하, 타 브라우저(크롬,파이어폭스 등) 인 경우 일부 서비스가 제한 될 수 있으니, 인터넷익스플로러(IE) 7.X 이상을 사용하시기 바랍니다.");
		}

		//RD출력 설정이 유효성 검사
		if(!this.validation()){
			return;
		}
		//기본정보 설정을 가져온다.
	    var theUrl = keis.c.REPORT.RD_DEFULT_AGENT_URL;
	    var feature;
	    var window_width  = keis.c.REPORT.RD_WIDTH;
	    var window_height = keis.c.REPORT.RD_HEIGHT;
	    //설정된 정보를 가져온다.
	    var vReportName = this.configData.get("reportFile");
	    var vPreviewYN = this.configData.get("previewYN");

	    //20111111 added by jjhan 여기는 this를 넣어 주어야 끌어 온다.
	    var vSaveFileName="";
	    if(this.configData.hasKey("saveFileName")) vSaveFileName = this.configData.get("saveFileName");

	    //가로 세로사이즈 설정
	    if(this.configData.hasKey("width"))window_width = configData.get("width");
	    if(this.configData.hasKey("height"))window_height = configData.get("height");
	    //출력모드가 저장일경우 위도우사이즈창은 고정
	    if(vPreviewYN != "Y"){
	    	window_width  = 100;
	        window_height = 100;
	    }

	    // 가상으로 폼을 만들어 주는 로직 넣는다.
	    //if (document.report_form == undefined) alert('인쇄폼이 존재 하지 않습니다.');
	    //else alert('인쇄폼이 존재 합니다.');

	    //20111123 added by jjhan 여기는 this를 넣어 주어야 끌어 온다.
	    var submitType="";
	    if (this.configData.hasKey("submitType")) submitType = this.configData.get("submitType");
	    //alert('submitType -->'+submitType);

	    //20111205 add by jjhan
	    var vMultiYN ="";
	    if(this.configData.hasKey("multiYN")) vMultiYN = this.configData.get("multiYN");

	    //20111229 add by jjhan
	    var vBcqreYN ="";
	    if(this.configData.hasKey("bcqreYN")) vBcqreYN = this.configData.get("bcqreYN");

	    var vOPENRDParams ="";
	    if(this.configData.hasKey("openRdParams")) vOPENRDParams = this.configData.get("openRdParams");

	    var vRvParams ="";  // /rv [][][]
	    if(this.configData.hasKey("rvParams")) vRvParams = this.configData.get("rvParams");

	    var vRpParams =""; // /rp [][][]
	    if(this.configData.hasKey("rpParams")) vRpParams = this.configData.get("rpParams");

	    var vRpageOrder =""; // /rp [][][]
	    if(this.configData.hasKey("rPageOrder")) vRpageOrder = this.configData.get("rPageOrder");

	    console.log('vRpageOrder : '+vRpageOrder);
	    
	    if (vRpageOrder !='')  	vRpageOrder =" /rpageorder ["+vRpageOrder+"]";

	    var vRuseradialaxis =""; // /rp [][][]
	    var vRuseradialaxisYN =""; // /rp [][][]
	    if(this.configData.hasKey("ruseradialaxisYN")) vRuseradialaxisYN = this.configData.get("ruseradialaxisYN");

	    if(vRuseradialaxisYN == 'Y') vRuseradialaxis =" /ruseradialaxis";

	    var vRcdchartxval =""; // /rp [][][]
	    if(this.configData.hasKey("rcdchartxval")) vRcdchartxval = this.configData.get("rcdchartxval");

	    if (vRcdchartxval !='')  	vRcdchartxval =" /rcdchartxval ["+vRcdchartxval+"]";

	    var vRcdcharteachcolor  =""; // /rp [][][]
	    if(this.configData.hasKey("rcdcharteachcolor")) vRcdcharteachcolor = this.configData.get("rcdcharteachcolor");

	    if (vRcdcharteachcolor !='')  	vRcdcharteachcolor =" /rcdcharteachcolor ["+vRcdcharteachcolor+"]";

	    var vDbChiperYN =""; // /rp [][][]
	    if(this.configData.hasKey("dbChiperYN")) vDbChiperYN = this.configData.get("dbChiperYN");
	    //alert("vDbChiperYN -->"+vDbChiperYN);

	    var vDbCipherIndex =""; // /rp [][][]
	    if(this.configData.hasKey("dbCipherIndex")) vDbCipherIndex = this.configData.get("dbCipherIndex");

	    var vSeekAuthNo =""; //
	    if(this.configData.hasKey("seekAuthNo")) vSeekAuthNo = this.configData.get("seekAuthNo");

	    var vOrgCd =""; //
	    if(this.configData.hasKey("orgCd")) vOrgCd = this.configData.get("orgCd");


		var tmpFocus;
		//20111123 add by jjhan submitType에 따라 분기하는 로직
	    if (submitType =='POST'){
	    	if (document.report_form == undefined) alert('인쇄폼이 존재 하지 않습니다.'); // 인쇄폼이 존재하지 않으면 포스트로 보낼수 없음
	    	//설정된 파라미터를 ReportDesigner용 파라미터로 변경한다.
	    	var vRDParams = this.initRDParam();

	    	// 20111206 modified by jjhan
	    	if (vDbChiperYN == 'Y') theUrl = sContext+"/common/report/RDPrint_DbCipher.jsp";
	    	else {
		    	// 20111205 modified by jjhan
		    	if (document.report_form.EncData != undefined && document.report_form.EncData.value != ''){
		    		theUrl = sContext+"/common/report/RDPrintEnc.jsp";
		    	}else{
		    		theUrl = sContext+"/common/report/RDPrint.jsp";
		        }
	    	}

	    	//alert('theUrl post -->'+theUrl);

	        winName = "RD_win";
	        feature = "width=" + window_width + ",height=" + window_height + ",resizable=yes,status=no,menubar=no,toolbar=no,z-lock=yes,alwaysRaised=yes";

	    	var form = document.report_form;
	    	//폼에 선언한 값을 넣어 준다.
	    	if (form.sReportName != undefined && vReportName != '') form.sReportName.value = vReportName;
	    	if (form.sRDParams != undefined   && vRDParams   != '') form.sRDParams.value   = vRDParams;
	    	if (form.sPreviewYN != undefined  && vPreviewYN  != '') form.sPreviewYN.value  = vPreviewYN;
	    	if (form.sSaveFileName != undefined  && vSaveFileName  != '') form.sSaveFileName.value  = vSaveFileName;

	    	// 새로이 추가 .
	    	if (form.multi != undefined        && vMultiYN   != '') form.multi.value   = vMultiYN;

	    	if (form.sBcqreYN != undefined        && vBcqreYN   != '') form.sBcqreYN.value   = vBcqreYN;

	    	if (form.sRv != undefined   && vRvParams   != '') form.sRv.value   = vRvParams;
	    	if (form.sRp != undefined   && vRpParams   != '') form.sRp.value   = vRpParams;
	    	if (form.sOPENRDParams != undefined        && vOPENRDParams   != '') form.sOPENRDParams.value = vOPENRDParams;
	    	if (form.sRpageOrder != undefined        && vRpageOrder   != '') form.sRpageOrder.value = vRpageOrder;

	    	if (form.sRuseradialaxis != undefined        && vRuseradialaxis   != '') form.sRuseradialaxis.value = vRuseradialaxis;
	    	if (form.sRcdchartxval != undefined        && vRcdchartxval   != '') form.sRcdchartxval.value = vRcdchartxval;
	    	if (form.sRcdcharteachcolor != undefined        && vRcdcharteachcolor   != '') form.sRcdcharteachcolor.value = vRcdcharteachcolor;

	    	if (form.sDbCipherIndex != undefined        && vDbCipherIndex   != '') form.sDbCipherIndex.value   = vDbCipherIndex;

	    	if (form.seekAuthNo != undefined        && vSeekAuthNo   != '') form.seekAuthNo.value   = vSeekAuthNo;
	    	if (form.sOrgCd != undefined        && vOrgCd   != '') form.sOrgCd.value   = vOrgCd;

	    	//var tmpFocus = window.open('', 'mrd', feature);
	    	tmpFocus = window.open('', 'mrd', feature);
	    	form.method = "post";
	    	form.target = "mrd";
	    	form.action = theUrl;
	    	form.submit();

	    }else{
	    	if (vDbChiperYN == 'Y') theUrl = sContext+"/common/report/RDPrint_DbCipher.jsp";
	    	//설정된 파라미터를 ReportDesigner용 파라미터로 변경한다.
	    	var vRDParams = this.initRDParam();
	    	theUrl = theUrl + "?sReportName=" + encodeURI(vReportName)
	    	                + "&sPreviewYN=" + vPreviewYN
	    	                + "&sRDParams=" + encodeURI(vRDParams)
	    	                + "&sSaveFileName=" + encodeURI(vSaveFileName)
	    	                + "&multi=" + vMultiYN
	    	                + "&sRv=" + encodeURI(vRvParams)
	    	                + "&sRp="+ vRpParams
	    	                + "&sOPENRDParams=" + encodeURI(vOPENRDParams)
	    	                + "&sRpageOrder=" + vRpageOrder
	    	                + "&sRuseradialaxis=" + vRuseradialaxis
	    	                + "&sRcdchartxval=" + vRcdchartxval
	    	                + "&sRcdcharteachcolor=" + vRcdcharteachcolor
	    	                + "&sDbCipherIndex=" + vDbCipherIndex
	    	                + "&sBcqreYN="+vBcqreYN
	    	                + "&seekAuthNo="+vSeekAuthNo
	    	                + "&sOrgCd="+vOrgCd;
	    	feature = "width=" + window_width + ",height=" + window_height + ",resizable=yes,status=no,menubar=no,toolbar=no,z-lock=yes,alwaysRaised=yes";
	    	tmpFocus = window.open(theUrl, "", feature);
	    }
	    tmpFocus.focus();

	},
	/**
	 * F: ReportDesign의 설정된 값의 유효성 검사를 수행한다.
	 * @return {Boolean} flag 유효성 결과
	 */
	validation : function(){
		var flag = true;

		if(!this.configData.hasKey("reportFile")){
			alert('보고서 파일을 지정하지 않았습니다.');
			flag = false;
		}

		// 20111216 modified by jjhan
		//if(this.valueData.size() == 0 && this.paramValueData.size() == 0){
		if(this.valueData.size() == 0 && this.paramValueData.size() == 0 && !this.configData.hasKey("rpParams")){
			alert('파라미터를 설정하지 않았습니다.');
			flag = false;
		}

		/* 리포트 파일 자체에 하드코딩되어 있는 부분이 있을수 있어 이렇게 한것 같음 */
		if(this.valueData.size() > 0 && this.paramValueData.size() > 0){
			alert('파라미터를 설정시 setValue와 setParamValue를 동시에 사용하실 수 없습니다.');
			flag = false;
		}

		return flag;
	},
	/**
	 * F: ReportDesign의 설정된 파라미터를 대상으로 report Designer용 파라미터 String으로 변환한다.
	 * @return {String} initParam ReportDesign용 파라미터
	 */
	initRDParam : function(){
		var initParam = "";

		if(this.paramValueData.size() > 0){
			initParam = this.getParamData("rv");
		}else if(this.valueData.size() > 0){
			initParam = this.getParamData("rp");
		}

		return initParam;
	},
	/**
	 * F: Parameter Collection구조에서 String 형태의 파라미터로 변환한다.
	 * @param {String} ReportDesign 파라미터종류 rv: key[value]구조 rp:[value] 구조
	 * @return {String} resultString String 파라미터
	 */
	getParamData : function(paramType){

		var targetObject;
		var resultString = "/" + paramType + " ";

		if(paramType == "rp") targetObject = this.valueData;
		else if(paramType == "rv") targetObject = this.paramValueData;

		//key 배열 구조를 가져온다.
		var keyList = targetObject.getHeader();
		//key에 해당하는 Value를 가져와서 변환한다.
		for(var i = 0; i < keyList.length; i++){
			var value = targetObject.get(keyList[i]);
			if(paramType == "rp") resultString += "[" + value + "]";
			else if(paramType == "rv") resultString += keyList[i] + "[" + value + "]";
		}

		return resultString;
	}
};
