package com.chx.interceptor;
import org.junit.runner.Request;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String url = httpServletRequest.getRequestURI();//获取登录的uri，这个是不进行拦截的
        if (url.indexOf("login.do") > 0) {
            return true;
        }
        HttpSession session = httpServletRequest.getSession();
        //如果是用户类的，只有管理员有权限
        if (url.indexOf("user") > 0) {
            Object userstate=session.getAttribute("userstate");
            if (userstate!=null&&userstate.toString().equals("9")) {
                return true;
            } else {
                httpServletRequest.getRequestDispatcher("/user/login.do").forward(httpServletRequest, httpServletResponse);
                return false;
            }
        }
        //非用户类的
        if (session.getAttribute("username") != null) {
            return true;
        }
        //不符合条件的，跳转登录
        httpServletRequest.getRequestDispatcher("/user/login.do").forward(httpServletRequest, httpServletResponse);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
