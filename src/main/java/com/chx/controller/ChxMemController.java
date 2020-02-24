package com.chx.controller;
import com.chx.model.ChxMem;
import com.chx.model.ChxMemFamily;
import com.chx.service.IChxMemFamilyService;
import com.chx.service.IChxMemService;
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
@RequestMapping("/chxm")
public class ChxMemController {

    @Resource
    IChxMemService chxMemService;

    @Resource
    IChxMemFamilyService chxMemFamilyService;

    //单删除
    @RequestMapping("/del/{id}")
    @ResponseBody
    public void del(Model model, @PathVariable int id, RedirectAttributes flash) {
        //执行删除，如果影响行行数大于0,则成功
        if (chxMemService.delete(id) > 0) {
            flash.addFlashAttribute("msg","删除成功！");
        } else {
            flash.addFlashAttribute("msg","删除失败！");
        }
        //重定向
        //return "redirect:/chxm/search";
    }

    //多删除
    @RequestMapping("/dels")
    public String dels(Model model, @RequestParam(value = "id",required = false) int[] ids, RedirectAttributes flash) {
        //执行删除，如果影响行行数大于0,则成功
        int rows=chxMemService.delete(ids);
        if ( rows> 0) {
            flash.addFlashAttribute("msg","删除成功"+rows+"行！");
        } else {
            flash.addFlashAttribute("msg","删除失败！");
        }
        //重定向
        return "redirect:/chxm/search";
    }

    //添加
    @RequestMapping("/add")
    public String add(Model model) {
        return "chxm/add";
    }

    @RequestMapping(value = "/addSave",consumes ="application/json;charset=utf-8", produces = "application/json;charset=utf-8")
    public @ResponseBody int add(@RequestBody ChxMem chxm) throws UnsupportedEncodingException {
        if (chxMemService.add(chxm) > 0) {
            Integer memid=chxm.getMemId();
            //System.out.println(chxm.getFamilyList());
            for (ChxMemFamily family : chxm.getFamilyList())
            {
                family.setPid(memid);
                chxMemFamilyService.add(family);
            }
            return 1;
        } else {
            return 0;
        }
    }

    //编辑
    @RequestMapping("/edit")
    public String edit(Model model,int id) {
        //将要编辑的对象带入视图
        ChxMem chxMem=chxMemService.getChxMemById(id);
        //ArrayList<ChxMemFamily> familyArrayList= chxMemFamilyService.getChxMemFamilysByPid(id);
        //chxMem.setFamilyList(familyArrayList);
        model.addAttribute("chxm",chxMem);
        return "chxm/edit";
    }

    @RequestMapping(value = "/editSave",consumes ="application/json;charset=utf-8", produces = "application/json;charset=utf-8")
    public @ResponseBody int edit(@RequestBody ChxMem chxm) throws UnsupportedEncodingException {
        if (chxMemService.edit(chxm) > 0) {
            chxMemFamilyService.deleteByPid(chxm.getMemId());
            for (ChxMemFamily family : chxm.getFamilyList())
            {
                family.setPid(chxm.getMemId());
                chxMemFamilyService.add(family);
            }
            return 1;
        } else {
            return 0;
        }
    }

    @RequestMapping("/search")
    public String  pageSearch(@RequestParam(value="currentPage",defaultValue="1",required=false) int currentPage,@RequestParam(value="searchStr",defaultValue="",required=false) String searchStr,@RequestParam(value="shopcode",defaultValue="",required=false) String shopcode,Model model){
        model.addAttribute("pagemsg", chxMemService.searchByPage(currentPage,searchStr,shopcode));//回显分页数据
        return "chxm/list";
    }

    @RequestMapping("/getfamilys/{pid}")
    @ResponseBody
    public ArrayList<ChxMemFamily>  getFamilyList(@PathVariable  int pid){
       return chxMemFamilyService.getChxMemFamilysByPid(pid);
    }
}
