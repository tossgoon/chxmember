package com.chx.controller;
import com.chx.model.ChxUser;
import com.chx.service.IChxUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 用户控制器
 */
@Controller
@RequestMapping("/user")
public class ChxUserController {
    @Resource
    IChxUserService sysUserService;

    @RequestMapping("/list")
    public String list(Model model) {
        //获得所有的会员带到页面中
        model.addAttribute("users", sysUserService.getAllSysUsers());
        return "user/list";  //WEB-INF/views/user/list.jsp
    }

    //单删除
    @RequestMapping("/del/{id}")
    @ResponseBody
    public void del(Model model, @PathVariable int id, RedirectAttributes flash) {
        //执行删除，如果影响行行数大于0,则成功
        if (sysUserService.delete(id) > 0) {
            flash.addFlashAttribute("msg","删除成功！");
        } else {
            flash.addFlashAttribute("msg","删除失败！");
        }
        //重定向
        //return "redirect:/chxm/search";
    }

    //添加保存
    @RequestMapping("/addSave")
    public String add(Model model, ChxUser user, RedirectAttributes flash) {
        //执行保存，如果影响行行数大于0,则成功
        if (sysUserService.add(user) > 0) {
            flash.addFlashAttribute("msg", "添加成功！");
            //重定向
            return "redirect:/user/list";
        } else {
            flash.addFlashAttribute("msg", "添加失败！");
            flash.addFlashAttribute("user", user);
            return "redirect:/user/add";
        }
    }

    //添加
    @RequestMapping("/add")
    public String add(Model model) {
        return "user/add";
    }

    //编辑
    @RequestMapping("/edit")
    public String edit(Model model, int id) {
        //将要编辑的图书对象带入视图
        model.addAttribute("user", sysUserService.getUserById(id));
        return "user/edit";
    }

    //编辑保存
    @RequestMapping("/editSave")
    public String edit(Model model, ChxUser user, RedirectAttributes flash) {
        //执行更新，如果影响行行数大于0,则成功
        if (sysUserService.edit(user) > 0) {
            flash.addFlashAttribute("msg", "更新成功！");
            //重定向
            return "redirect:/user/list";
        } else {
            flash.addFlashAttribute("msg", "更新失败！");
            flash.addFlashAttribute("user", user);
            return "redirect:/user/edit";
        }
    }

    @RequestMapping("/login.do")
    public String loginin(Model model) {
        return "user/login";
    }

    @RequestMapping("/loginin")
    public String login(Model model, ChxUser user, RedirectAttributes flash, HttpSession session) {
        //查询人数
        if (sysUserService.getUserCount(user.getLoginName()) > 0) {
            if (sysUserService.getUserPassCount(user) > 0) {
                user=sysUserService.getUserStateByName(user.getLoginName());
                session.setAttribute("userstate", user.getState());
                session.setAttribute("username", user.getLoginName());
                session.setAttribute("userid", user.getId());
                session.setAttribute("shopcode", user.getShopcode());
                flash.addFlashAttribute("msg", "成功！");
                flash.addFlashAttribute("user", user);
                if (user.getState() == 9) {
                    return "redirect:/user/list";
                } else {
                    return "redirect:/chxm/search?shopcode="+user.getShopcode();
                }
            } else {
                flash.addFlashAttribute("msg", "密码错误！");
                flash.addFlashAttribute("user", user);
                return "redirect:/user/login.do";
            }
        } else {
            flash.addFlashAttribute("msg", "用户名不存在！");
            flash.addFlashAttribute("user", user);
            return "redirect:/user/login.do";
        }
    }
    @RequestMapping("/loginout")
    public String loginout(Model model, ChxUser user, RedirectAttributes flash, HttpSession session) {
        /*session.removeAttribute("username");
        session.removeAttribute("userstate");
        session.removeAttribute("userid");
        */
        session.invalidate();
        return "redirect:/user/login.do";
    }
}
