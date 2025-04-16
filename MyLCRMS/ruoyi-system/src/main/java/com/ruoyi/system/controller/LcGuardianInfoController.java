package com.ruoyi.system.controller;

import java.util.List;
import java.util.Map; // Added for Map
import java.util.HashMap; // Added for HashMap
import java.util.stream.Collectors; // Added for Stream API Collectors
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
import com.ruoyi.system.domain.LcGuardianInfo;
import com.ruoyi.system.service.ILcGuardianInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 监护人信息Controller
 *
 * @author PoChi
 * @date 2025-04-06
 */
@RestController
@RequestMapping("/system/guardian")
public class LcGuardianInfoController extends BaseController
{
    @Autowired
    private ILcGuardianInfoService lcGuardianInfoService;

    /**
     * 查询监护人信息列表 (分页和条件查询)
     */
    @PreAuthorize("@ss.hasPermi('system:guardian:list')")
    @GetMapping("/list")
    public TableDataInfo list(LcGuardianInfo lcGuardianInfo)
    {
        startPage();
        List<LcGuardianInfo> list = lcGuardianInfoService.selectLcGuardianInfoList(lcGuardianInfo);
        return getDataTable(list);
    }

    /**
     * 获取所有监护人列表（用于下拉选择）
     * 返回简化后的 value/label 结构列表
     */
    // 可根据实际需要调整权限，例如只有能管理儿童信息的人才能获取此列表
    @PreAuthorize("@ss.hasPermi('system:guardian:list')")
    @GetMapping("/listAll")
    public AjaxResult listAllGuardians() {
        // 创建一个空的查询对象，表示查询所有
        LcGuardianInfo queryParam = new LcGuardianInfo();
        // 调用 Service 层的方法获取完整的监护人列表
        List<LcGuardianInfo> list = lcGuardianInfoService.selectLcGuardianInfoList(queryParam);

        // 将列表转换为前端下拉框需要的 { value: id, label: name } 格式
        List<Map<String, Object>> options = list.stream().map(guardian -> {
            Map<String, Object> map = new HashMap<>();
            map.put("value", guardian.getGuardianId()); // value 存储监护人 ID
            map.put("label", guardian.getName());      // label 存储监护人姓名
            return map;
        }).collect(Collectors.toList());

        return AjaxResult.success(options); // 返回处理后的列表
    }


    /**
     * 导出监护人信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:guardian:export')")
    @Log(title = "监护人信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LcGuardianInfo lcGuardianInfo)
    {
        List<LcGuardianInfo> list = lcGuardianInfoService.selectLcGuardianInfoList(lcGuardianInfo);
        ExcelUtil<LcGuardianInfo> util = new ExcelUtil<LcGuardianInfo>(LcGuardianInfo.class);
        util.exportExcel(response, list, "监护人信息数据");
    }

    /**
     * 获取监护人信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:guardian:query')")
    @GetMapping(value = "/{guardianId}")
    public AjaxResult getInfo(@PathVariable("guardianId") Long guardianId)
    {
        return success(lcGuardianInfoService.selectLcGuardianInfoByGuardianId(guardianId));
    }

    /**
     * 新增监护人信息
     */
    @PreAuthorize("@ss.hasPermi('system:guardian:add')")
    @Log(title = "监护人信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LcGuardianInfo lcGuardianInfo)
    {
        return toAjax(lcGuardianInfoService.insertLcGuardianInfo(lcGuardianInfo));
    }

    /**
     * 修改监护人信息
     */
    @PreAuthorize("@ss.hasPermi('system:guardian:edit')")
    @Log(title = "监护人信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LcGuardianInfo lcGuardianInfo)
    {
        return toAjax(lcGuardianInfoService.updateLcGuardianInfo(lcGuardianInfo));
    }

    /**
     * 删除监护人信息
     */
    @PreAuthorize("@ss.hasPermi('system:guardian:remove')")
    @Log(title = "监护人信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{guardianIds}")
    public AjaxResult remove(@PathVariable Long[] guardianIds)
    {
        return toAjax(lcGuardianInfoService.deleteLcGuardianInfoByGuardianIds(guardianIds));
    }
}