package com.ruoyi.web.controller.system;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysMenu;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginBody;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.service.SysLoginService;
import com.ruoyi.framework.web.service.SysPermissionService;
import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.system.service.ISysMenuService;

/**
 * 登录验证
 * 
 * @author ruoyi
 */
@RestController
public class SysLoginController {
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private TokenService tokenService;

    /**
     * 登录方法
     * 
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody) {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo() {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        SysUser user = loginUser.getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        if (!loginUser.getPermissions().equals(permissions)) {
            loginUser.setPermissions(permissions);
            tokenService.refreshToken(loginUser);
        }
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters() {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);

        // 过滤菜单，只保留指定的菜单
        List<SysMenu> filteredMenus = filterMenus(menus);

        return AjaxResult.success(menuService.buildMenus(filteredMenus));
    }

    /**
     * 过滤菜单，只保留用户管理、监护人信息、留守儿童信息、家访记录、关爱活动和角色管理
     * 
     * @param menus 原始菜单列表
     * @return 过滤后的菜单列表
     */
    private List<SysMenu> filterMenus(List<SysMenu> menus) {
        // 需要保留的菜单ID列表
        Set<Long> keepMenuIds = new HashSet<>();
        // 系统管理目录ID
        keepMenuIds.add(1L); // 系统管理
        // 需要保留的二级菜单ID
        keepMenuIds.add(100L); // 用户管理
        keepMenuIds.add(101L); // 角色管理
        keepMenuIds.add(2000L); // 监护人信息
        keepMenuIds.add(2012L); // 留守儿童信息
        keepMenuIds.add(2018L); // 家访记录
        keepMenuIds.add(2024L); // 关爱活动
        keepMenuIds.add(2030L); // 活动参与记录

        // 过滤一级菜单
        List<SysMenu> filteredMenus = menus.stream()
                .filter(menu -> keepMenuIds.contains(menu.getMenuId()))
                .collect(Collectors.toList());

        // 处理系统管理下的子菜单，只保留指定的菜单
        for (SysMenu menu : filteredMenus) {
            if (menu.getMenuId() == 1L && menu.getChildren() != null) {
                List<SysMenu> children = menu.getChildren().stream()
                        .filter(child -> keepMenuIds.contains(child.getMenuId()))
                        .collect(Collectors.toList());
                menu.setChildren(children);
            }
        }

        return filteredMenus;
    }
}
