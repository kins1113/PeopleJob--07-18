package com.ez.peoplejob.excel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;

import com.ez.peoplejob.member.model.MemberVO;

@Service
public class ExcelService {
    /**
     * 일반회원 을 액셀처리해주는 메서드
     * @param list
     * @return
     */
    public SXSSFWorkbook makeSimpleMemberExcelWorkbook(List<MemberVO> list) {
        SXSSFWorkbook workbook = new SXSSFWorkbook();
        
        // 시트 생성
        SXSSFSheet sheet = workbook.createSheet("일반회원 정보");
        
        //시트 열 너비 설정
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(0, 3000);
        sheet.setColumnWidth(0, 4000);
        sheet.setColumnWidth(0, 4000);
        sheet.setColumnWidth(0, 15000);
        sheet.setColumnWidth(0, 8000);
        sheet.setColumnWidth(0, 1500);
        sheet.setColumnWidth(0, 12000);
        sheet.setColumnWidth(0, 9000);
        sheet.setColumnWidth(0, 1500);
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
        // 해당 행의 첫번째 열 셀 생성  Cell org.apache.poi.ss.usermodel.Row.createCell(int column)

        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("");
        
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("회원 코드");
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("아이디");
        // 해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("이름");
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("주소");
        // 해당 행의 다섯째 열 셀 생성
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("생년월일");
        // 해당 행의 여섯째 열 셀 생성
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("성별");
        // 해당 행의 일곱째 열 셀 생성
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("이메일");
        // 해당 행의 여덟째 열 셀 생성
        headerCell = headerRow.createCell(8);
        headerCell.setCellValue("전화번호");
        // 해당 행의 아홉째 열 셀 생성
        headerCell = headerRow.createCell(9);
        headerCell.setCellValue("이력서번호");
        
        // 과일표 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
            MemberVO memberVo = list.get(i);
            
            // 행 생성
            bodyRow = sheet.createRow(i+1);
            // 데이터 번호 표시
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(i + 1);
            // 데이터 이름 표시
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(memberVo.getMemberCode());
            // 데이터 가격 표시
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(memberVo.getMemberid());
            // 데이터 수량 표시
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(memberVo.getMembername());
            // 데이터 수량 표시
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(memberVo.getAddress()+" "+memberVo.getAddressdetail());
            // 데이터 수량 표시
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(memberVo.getBirth());
            // 데이터 이름 표시
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(memberVo.getMembergender());
            // 데이터 수량 표시
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(memberVo.getEmail());
            // 데이터 수량 표시
            bodyCell = bodyRow.createCell(8);
            bodyCell.setCellValue(memberVo.getTel());
            // 데이터 수량 표시
            bodyCell = bodyRow.createCell(9);
            bodyCell.setCellValue(memberVo.getAuthorityCode());
        }
        
        return workbook;
    }
    
    //기업 회원용 처리 메서드 만들기 ~~!!!! 아직 안만듬
    public SXSSFWorkbook makeSimpleCompanyExcelWorkbook(List<Map<String, Object>> list) {
    	 SXSSFWorkbook workbook = new SXSSFWorkbook();
         
         // 시트 생성
         SXSSFSheet sheet = workbook.createSheet("일반회원 정보");
         
         //시트 열 너비 설정
         sheet.setColumnWidth(0, 1500);
         sheet.setColumnWidth(0, 3000);
         sheet.setColumnWidth(0, 4000);
         sheet.setColumnWidth(0, 4000);
         sheet.setColumnWidth(0, 15000);
         sheet.setColumnWidth(0, 8000);
         sheet.setColumnWidth(0, 1500);
         sheet.setColumnWidth(0, 12000);
         sheet.setColumnWidth(0, 9000);
         sheet.setColumnWidth(0, 1500);
         // 헤더 행 생
         Row headerRow = sheet.createRow(0);
         
         // 해당 행의 첫번째 열 셀 생성  Cell org.apache.poi.ss.usermodel.Row.createCell(int column)
         Cell headerCell = headerRow.createCell(0);
         headerCell.setCellValue("");
         
         headerCell = headerRow.createCell(1);
         headerCell.setCellValue("사업자 번호");
         // 해당 행의 두번째 열 셀 생성
         headerCell = headerRow.createCell(2);
         headerCell.setCellValue("회사 명");
         // 해당 행의 세번째 열 셀 생성
         headerCell = headerRow.createCell(3);
         headerCell.setCellValue("회사 주소");
         // 해당 행의 세번째 열 셀 생성
         headerCell = headerRow.createCell(4);
         headerCell.setCellValue("설립연도");
         // 해당 행의 내번째 열 셀 생성
         headerCell = headerRow.createCell(5);
         headerCell.setCellValue("매출액");
         // 해당 행의 다섯번째 열 셀 생성
         headerCell = headerRow.createCell(6);
         headerCell.setCellValue("자본금");
         // 해당 행의 여섯번째 열 셀 생성
         headerCell = headerRow.createCell(7);
         headerCell.setCellValue("기업 형태");
         // 해당 행의 일곱번째 열 셀 생성
         headerCell = headerRow.createCell(8);
         headerCell.setCellValue("여사원수");
         // 해당 행의 여덟번째 열 셀 생성
         headerCell = headerRow.createCell(9);
         headerCell.setCellValue("남사원수");
         // 해당 행의 아홉번째 열 셀 생성
         
         
         //member 태이블의 정보
         headerCell = headerRow.createCell(10);
         headerCell.setCellValue("회원 코드");
         // 해당 행의 열번째 열 셀 생성
         headerCell = headerRow.createCell(11);
         headerCell.setCellValue("아이디");
         // 해당 행의 열한번째 열 셀 생성
         headerCell = headerRow.createCell(12);
         headerCell.setCellValue("이름");
         // 해당 행의 열두번째 열 셀 생성
         headerCell = headerRow.createCell(13);
         headerCell.setCellValue("주소");
         // 해당 행의 열세째 열 셀 생성
         headerCell = headerRow.createCell(14);
         headerCell.setCellValue("생년월일");
         // 해당 행의 여내째 열 셀 생성
         headerCell = headerRow.createCell(15);
         headerCell.setCellValue("성별");
         // 해당 행의 열다섯째 열 셀 생성
         headerCell = headerRow.createCell(16);
         headerCell.setCellValue("이메일");
         // 해당 행의 열여섯째 열 셀 생성
         headerCell = headerRow.createCell(17);
         headerCell.setCellValue("전화번호");
         // 해당 행의 열일곱째 열 셀 생성
         headerCell = headerRow.createCell(18);
         headerCell.setCellValue("이력서번호");
         
         // 표 내용 행 및 셀 생성
         Row bodyRow = null;
         Cell bodyCell = null;
         for(int i=0; i<list.size(); i++) {
             HashMap<String, Object> map = (HashMap<String, Object>) list.get(i);
             
             // 행 생성
             bodyRow = sheet.createRow(i+1);
             // 데이터 번호 표시
             bodyCell = bodyRow.createCell(0);
             bodyCell.setCellValue(i + 1);
             
             // 데이터 사업자 번호
             bodyCell = bodyRow.createCell(1);
             if(map.get("COMPANYNO")!=null) bodyCell.setCellValue(map.get("COMPANYNO")+"");	
             // 데이터 회사명
             bodyCell = bodyRow.createCell(2);
             if(map.get("COMPANYNAME")!=null) bodyCell.setCellValue(map.get("COMPANYNAME")+"");
             // 데이터 회사 주소
             bodyCell = bodyRow.createCell(3);
             if(map.get("COMPANY_ADDRESS")!=null) bodyCell.setCellValue(map.get("COMPANY_ADDRESS")+" "+map.get("COMPANY_ADDRESSDETAIL"));
             // 데이터 설립 연도
             bodyCell = bodyRow.createCell(4);
             if(map.get("ESTABLISHYEAR")!=null) bodyCell.setCellValue(map.get("ESTABLISHYEAR")+"");
             // 데이터 매출액
             bodyCell = bodyRow.createCell(5);
             if(map.get("SALES")!=null) bodyCell.setCellValue(map.get("SALES")+"");
             // 데이터 자본금
             bodyCell = bodyRow.createCell(6);
             if(map.get("CAPITAL")!=null) bodyCell.setCellValue(map.get("CAPITAL")+"");
             // 데이터 기업형태
             bodyCell = bodyRow.createCell(7);
             if(map.get("COMPANYTYPE")!=null) bodyCell.setCellValue(map.get("COMPANYTYPE")+"");
             // 데이터 여자사원수
             bodyCell = bodyRow.createCell(8);
             if(map.get("WOMANNUM")!=null) bodyCell.setCellValue(map.get("WOMANNUM")+"");
             // 데이터 남자사원수
             bodyCell = bodyRow.createCell(9);
             if(map.get("MANNUM")!=null) bodyCell.setCellValue(map.get("MANNUM")+"");
             
             
             
             // 데이터 이름 표시
             bodyCell = bodyRow.createCell(10);
             if(map.get("MEMBER_CODE")!=null) bodyCell.setCellValue(map.get("MEMBER_CODE")+"");
             // 데이터 가격 표시
             bodyCell = bodyRow.createCell(11);
             if(map.get("MEMBERID")!=null) bodyCell.setCellValue(map.get("MEMBERID")+"");
             // 데이터 수량 표시
             bodyCell = bodyRow.createCell(12);
             if(map.get("MEMBERNAME")!=null) bodyCell.setCellValue(map.get("MEMBERNAME")+"");
             // 데이터 수량 표시
             bodyCell = bodyRow.createCell(13);
             if(map.get("ADDRESS")!=null) bodyCell.setCellValue(map.get("ADDRESS")+" "+map.get("ADDRESSDETAIL"));
             // 데이터 수량 표시
             bodyCell = bodyRow.createCell(14);
             if(map.get("BIRTH")!=null) bodyCell.setCellValue(map.get("BIRTH")+"");
             // 데이터 이름 표시
             bodyCell = bodyRow.createCell(15);
             if(map.get("MEMBERGENDER")!=null) bodyCell.setCellValue(map.get("MEMBERGENDER")+"");
             // 데이터 수량 표시
             bodyCell = bodyRow.createCell(16);
             if(map.get("EMAIL")!=null) bodyCell.setCellValue(map.get("EMAIL")+"");
             // 데이터 수량 표시
             bodyCell = bodyRow.createCell(17);
             if(map.get("TEL")!=null) bodyCell.setCellValue(map.get("TEL")+"");
             // 데이터 수량 표시
             bodyCell = bodyRow.createCell(18);
             if(map.get("AUTHORITY_CODE")!=null) bodyCell.setCellValue(map.get("AUTHORITY_CODE")+"");
         }
         
         return workbook;
    }
}
