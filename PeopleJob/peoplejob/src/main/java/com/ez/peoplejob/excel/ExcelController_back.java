package com.ez.peoplejob.excel;

import java.util.List;
import java.util.Locale;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExcelController_back {
	/*
	@Autowired ExcelService service;
	
	@RequestMapping("/excelTest.do")
	public String exccelTestView() {

		return "excelTest";
	}
	
	@RequestMapping(value = "/downloadExcelFile.do", method = RequestMethod.POST)
    public String downloadExcelFile(Model model) {
        String[] names = {"자몽", "애플망고", "멜론", "오렌지"};
        long[] prices = {5000, 10000, 7000, 6000};
        int[] quantities = {50, 50, 40, 40};
        List<Fruit> list = service.makeFruitList(names, prices, quantities);
        
        SXSSFWorkbook workbook = service.excelFileDownloadProcess(list);
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "과일표");
        
        return "excelDownloadView";
    }
*/
}
