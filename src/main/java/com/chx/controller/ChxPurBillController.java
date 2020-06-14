package com.chx.controller;

import com.chx.model.ChxPur;
import com.chx.model.ChxPurBill;
import com.chx.service.IChxPurBillService;
import com.chx.service.IChxPurService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

/**
 * 图书控制器
 */
@Controller
@RequestMapping("/purbill")
public class ChxPurBillController {

    @Resource
    IChxPurBillService chxPurBillService;

    //单删除
    @RequestMapping("/del/{id}")
    @ResponseBody
    public void del(Model model, @PathVariable int id, RedirectAttributes flash) {
        //执行删除，如果影响行行数大于0,则成功
        if (chxPurBillService.delete(id) > 0) {
            flash.addFlashAttribute("msg","删除成功！");
        } else {
            flash.addFlashAttribute("msg","删除失败！");
        }
        //重定向
        //return "redirect:/chxm/search";
    }

    @RequestMapping(value = "/addSave",consumes ="application/json;charset=utf-8", produces = "application/json;charset=utf-8")
    public @ResponseBody int add(@RequestBody ChxPurBill chxPurBill) throws UnsupportedEncodingException {
        if (chxPurBillService.add(chxPurBill) > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    //编辑
    @RequestMapping("/edit")
    public String edit(Model model,int id) {
        //将要编辑的对象带入视图
        ChxPurBill chxPurBill=this.chxPurBillService.getChxPurBillById(id);
        model.addAttribute("pur",chxPurBill);
        return "purbill/edit";
    }

    @RequestMapping(value = "/editSave",consumes ="application/json;charset=utf-8", produces = "application/json;charset=utf-8")
    public @ResponseBody int edit(@RequestBody ChxPurBill purBill) throws UnsupportedEncodingException {
        if (chxPurBillService.edit(purBill) > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @RequestMapping("/list")
    public String list(Model model) {
        //获得所有的会员带到页面中
        model.addAttribute("bills", chxPurBillService.getAllChxBills());
        return "purbill/list";  //WEB-INF/views/user/list.jsp
    }

    //单删除
    @RequestMapping("/sublist/{dm}")
    public String sublist(Model model, @PathVariable String dm, RedirectAttributes flash) {
        model.addAttribute("bills", chxPurBillService.getSubChxBills(dm));
        model.addAttribute("dm",dm);
        return "purbill/sublist";  //WEB-INF/views/user/list.jsp
    }


    @RequestMapping(value = "/updateStatus")
    public @ResponseBody  int editSimple(@RequestParam(value = "id", defaultValue = "1", required = true) int id, @RequestParam(value = "status", defaultValue = "0", required = true) int status) throws UnsupportedEncodingException {
        if (chxPurBillService.updateStatus(id,status) > 0) {
            return 1;
        } else {
            return 0;
        }
    }
}
