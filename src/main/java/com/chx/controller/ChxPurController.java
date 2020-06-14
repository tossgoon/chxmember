package com.chx.controller;

import com.chx.model.ChxPur;
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
@RequestMapping("/pur")
public class ChxPurController {

    @Resource
    IChxPurService chxPurService;

    //单删除
    @RequestMapping("/del/{id}")
    public @ResponseBody
    int del(@PathVariable int id) {
        //执行删除，如果影响行行数大于0,则成功
        chxPurService.deletePursByPid(id);
        return chxPurService.delete(id);
    }

    //多删除
    @RequestMapping("/dels")
    public String dels(Model model, @RequestParam(value = "id", required = false) int[] ids, RedirectAttributes flash) {
        //执行删除，如果影响行行数大于0,则成功
        int rows = chxPurService.delete(ids);
        if (rows > 0) {
            flash.addFlashAttribute("msg", "删除成功" + rows + "行！");
        } else {
            flash.addFlashAttribute("msg", "删除失败！");
        }
        //重定向
        return "redirect:/pur/search";
    }

    //添加
    @RequestMapping("/add")
    public String add(Model model) {
        return "pur/add";
    }

    @RequestMapping(value = "/addSave", consumes = "application/json")
    public @ResponseBody
    int add(@RequestBody ChxPur chxPur) throws UnsupportedEncodingException {
        if (chxPurService.add(chxPur) > 0) {
            Integer id = chxPur.getId();
            return id;
        } else {
            return 0;
        }
    }

    //编辑
    @RequestMapping("/edit")
    public String edit(Model model, int id) {
        //将要编辑的对象带入视图
        ChxPur chxPur = this.chxPurService.getChxPurById(id);
        model.addAttribute("pur", chxPur);
        return "pur/edit";
    }

    @RequestMapping(value = "/editSave", consumes = "application/json;charset=utf-8", produces = "application/json;charset=utf-8")
    public @ResponseBody
    int edit(@RequestBody ChxPur pur) throws UnsupportedEncodingException {
        if (chxPurService.edit(pur) > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @RequestMapping(value = "/editSimpleSave", consumes = "application/json;charset=utf-8", produces = "application/json;charset=utf-8")
    public @ResponseBody
    int editSimple(@RequestBody ChxPur pur) throws UnsupportedEncodingException {
        if (chxPurService.editSimple(pur) > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    @RequestMapping("/search")
    public String pageSearch(@RequestParam(value = "currentPage", defaultValue = "1", required = false) int currentPage, @RequestParam(value = "searchStr", defaultValue = "", required = false) String searchStr, @RequestParam(value = "shopcode", defaultValue = "", required = false) String shopcode, Model model) {
        model.addAttribute("pagemsg", chxPurService.searchByPage(currentPage, searchStr, shopcode));//回显分页数据
        return "pur/list";
    }

    @RequestMapping("/getpurs/{pid}")
    @ResponseBody
    public ArrayList<ChxPur> getPursByPid(@PathVariable int pid) {
        return chxPurService.getSubList(pid);
    }


    @RequestMapping("/getsubs/{pid}")
    @ResponseBody
    public ArrayList<ChxPur> getSubList(@PathVariable int pid) {
        return chxPurService.getSubList(pid);
    }

    @RequestMapping("/spxx/getSpxxByName")
    @ResponseBody
    public ArrayList<ChxPur> getSpxxList(@RequestParam(value = "spname") String spname) {
        return chxPurService.getSpxxList(spname);
    }

    //根据单号获取采购清单
    @RequestMapping("/getpursbybid")
    public String getPursByBid(Model model, @RequestParam(value = "bid") int bid, @RequestParam(value = "billnum") String billnum) {
        //将要编辑的对象带入视图
        ArrayList<ChxPur> purs = this.chxPurService.getPursByBid(bid);
        model.addAttribute("purs", purs);
        model.addAttribute("billid", bid);
        model.addAttribute("billnum", billnum);
        return "pur/list";
    }
    //根据单号获取采购清单（分店）
    @RequestMapping("/subpursbybid")
    public String getSubPursByBid(Model model, @RequestParam(value = "bid") int bid,  @RequestParam(value = "dm") String dm) {
        //将要编辑的对象带入视图
        ArrayList<ChxPur> purs = this.chxPurService.getSubPursByBid(bid,dm);
        model.addAttribute("purs", purs);
        model.addAttribute("billid", bid);
        model.addAttribute("dm", dm);
        return "pur/sublist";
    }
}