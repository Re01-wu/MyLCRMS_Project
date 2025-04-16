package com.ruoyi.system.controller;

import java.util.List;
// ==================== 新增 import ====================
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;
// ==================== 结束 ====================
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
import com.ruoyi.system.domain.LcSupportActivity;
import com.ruoyi.system.service.ILcSupportActivityService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 关爱活动Controller
 *
 * @author PoChi
 * @date 2025-04-06
 */
@RestController
@RequestMapping("/system/activity")
public class LcSupportActivityController extends BaseController
{
    @Autowired
    private ILcSupportActivityService lcSupportActivityService;

    /**
     * 查询关爱活动列表
     */
    @PreAuthorize("@ss.hasPermi('system:activity:list')")
    @GetMapping("/list")
    public TableDataInfo list(LcSupportActivity lcSupportActivity)
    {
        startPage();
        List<LcSupportActivity> list = lcSupportActivityService.selectLcSupportActivityList(lcSupportActivity);
        return getDataTable(list);
    }

    // ==================== 新增方法 开始 ====================
    /**
     * 获取所有活动列表 (用于下拉选择)
     */
    @GetMapping("/listAll")
    // 权限可以根据需要放开或绑定参与记录的权限
    // @PreAuthorize("@ss.hasPermi('system:participation:list')")
    public AjaxResult listAllActivities() {
        LcSupportActivity queryParam = new LcSupportActivity();
        // 可以考虑只查询未结束的活动作为选项
        // queryParam.getParams().put("statuses", new String[]{"0", "1"});
        List<LcSupportActivity> list = lcSupportActivityService.selectLcSupportActivityList(queryParam);

        // 转换为 { value: activityId, label: activityName }
        List<Map<String, Object>> options = list.stream().map(activity -> {
            Map<String, Object> map = new HashMap<>();
            map.put("value", activity.getActivityId());
            // 可以加上活动时间或其他信息到 label 中方便区分重名活动
            // map.put("label", activity.getActivityName() + " (" + DateUtils.parseDateToStr(DateUtils.YYYY_MM_DD, activity.getActivityTime()) + ")");
            map.put("label", activity.getActivityName());
            return map;
        }).collect(Collectors.toList());
        return AjaxResult.success(options);
    }
    // ==================== 新增方法 结束 ====================


    /**
     * 导出关爱活动列表
     */
    @PreAuthorize("@ss.hasPermi('system:activity:export')")
    @Log(title = "关爱活动", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LcSupportActivity lcSupportActivity)
    {
        List<LcSupportActivity> list = lcSupportActivityService.selectLcSupportActivityList(lcSupportActivity);
        ExcelUtil<LcSupportActivity> util = new ExcelUtil<LcSupportActivity>(LcSupportActivity.class);
        util.exportExcel(response, list, "关爱活动数据");
    }

    /**
     * 获取关爱活动详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:activity:query')")
    @GetMapping(value = "/{activityId}")
    public AjaxResult getInfo(@PathVariable("activityId") Long activityId)
    {
        return success(lcSupportActivityService.selectLcSupportActivityByActivityId(activityId));
    }

    /**
     * 新增关爱活动
     */
    @PreAuthorize("@ss.hasPermi('system:activity:add')")
    @Log(title = "关爱活动", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LcSupportActivity lcSupportActivity)
    {
        return toAjax(lcSupportActivityService.insertLcSupportActivity(lcSupportActivity));
    }

    /**
     * 修改关爱活动
     */
    @PreAuthorize("@ss.hasPermi('system:activity:edit')")
    @Log(title = "关爱活动", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LcSupportActivity lcSupportActivity)
    {
        return toAjax(lcSupportActivityService.updateLcSupportActivity(lcSupportActivity));
    }

    /**
     * 删除关爱活动
     */
    @PreAuthorize("@ss.hasPermi('system:activity:remove')")
    @Log(title = "关爱活动", businessType = BusinessType.DELETE)
    @DeleteMapping("/{activityIds}")
    public AjaxResult remove(@PathVariable Long[] activityIds)
    {
        return toAjax(lcSupportActivityService.deleteLcSupportActivityByActivityIds(activityIds));
    }
}