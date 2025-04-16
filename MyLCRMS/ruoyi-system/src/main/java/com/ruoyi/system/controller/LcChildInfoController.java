package com.ruoyi.system.controller;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.LcChildInfo;
import com.ruoyi.system.service.ILcChildInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 留守儿童信息Controller
 * 
 * @author PoChi
 * @date 2025-04-06
 */
@RestController
@RequestMapping("/system/child")
public class LcChildInfoController extends BaseController {
    @Autowired
    private ILcChildInfoService lcChildInfoService;

    /**
     * 查询留守儿童信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:child:list')")
    @GetMapping("/list")
    public TableDataInfo list(LcChildInfo lcChildInfo) {
        startPage();
        List<LcChildInfo> list = lcChildInfoService.selectLcChildInfoList(lcChildInfo);
        return getDataTable(list);
    }

    /**
     * 导出留守儿童信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:child:export')")
    @Log(title = "留守儿童信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LcChildInfo lcChildInfo) {
        List<LcChildInfo> list = lcChildInfoService.selectLcChildInfoList(lcChildInfo);
        ExcelUtil<LcChildInfo> util = new ExcelUtil<LcChildInfo>(LcChildInfo.class);
        util.exportExcel(response, list, "留守儿童信息数据");
    }

    /**
     * 获取留守儿童信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:child:query')")
    @GetMapping(value = "/{childId}")
    public AjaxResult getInfo(@PathVariable("childId") Long childId) {
        return success(lcChildInfoService.selectLcChildInfoByChildId(childId));
    }

    /**
     * 新增留守儿童信息
     */
    @PreAuthorize("@ss.hasPermi('system:child:add')")
    @Log(title = "留守儿童信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LcChildInfo lcChildInfo) {
        return toAjax(lcChildInfoService.insertLcChildInfo(lcChildInfo));
    }

    /**
     * 修改留守儿童信息
     */
    @PreAuthorize("@ss.hasPermi('system:child:edit')")
    @Log(title = "留守儿童信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LcChildInfo lcChildInfo) {
        return toAjax(lcChildInfoService.updateLcChildInfo(lcChildInfo));
    }

    /**
     * 删除留守儿童信息
     */
    @PreAuthorize("@ss.hasPermi('system:child:remove')")
    @Log(title = "留守儿童信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{childIds}")
    public AjaxResult remove(@PathVariable Long[] childIds) {
        return toAjax(lcChildInfoService.deleteLcChildInfoByChildIds(childIds));
    }

    /**
     * 获取留守儿童简要信息列表 (用于下拉选择)
     * 这里只返回儿童ID和姓名
     */
    @GetMapping("/listAll")
    // 允许所有已登录用户访问此接口，不需要特定权限
    @PreAuthorize("@ss.hasRole('admin') or @ss.hasRole('common') or @ss.hasAnyRoles('projadmin,visit')")
    public AjaxResult listAllSimple() {
        // 查询未被删除的留守儿童
        LcChildInfo childQuery = new LcChildInfo();
        childQuery.setStatus("0"); // 只查询状态正常的儿童
        List<LcChildInfo> list = lcChildInfoService.selectLcChildInfoList(childQuery);

        // 转换为 { value: childId, label: name } 格式
        List<Map<String, Object>> options = list.stream().map(child -> {
            Map<String, Object> map = new HashMap<>();
            map.put("value", child.getChildId());
            map.put("label", child.getName()); // 使用儿童姓名作为显示标签
            return map;
        }).collect(Collectors.toList());

        return AjaxResult.success(options);
    }
}
