package com.ruoyi.system.controller;

import java.util.List;
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
import com.ruoyi.system.domain.LcActivityParticipation;
import com.ruoyi.system.service.ILcActivityParticipationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 活动参与记录Controller
 * 
 * @author PoChi
 * @date 2025-04-06
 */
@RestController
@RequestMapping("/system/participation")
public class LcActivityParticipationController extends BaseController
{
    @Autowired
    private ILcActivityParticipationService lcActivityParticipationService;

    /**
     * 查询活动参与记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:participation:list')")
    @GetMapping("/list")
    public TableDataInfo list(LcActivityParticipation lcActivityParticipation)
    {
        startPage();
        List<LcActivityParticipation> list = lcActivityParticipationService.selectLcActivityParticipationList(lcActivityParticipation);
        return getDataTable(list);
    }

    /**
     * 导出活动参与记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:participation:export')")
    @Log(title = "活动参与记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LcActivityParticipation lcActivityParticipation)
    {
        List<LcActivityParticipation> list = lcActivityParticipationService.selectLcActivityParticipationList(lcActivityParticipation);
        ExcelUtil<LcActivityParticipation> util = new ExcelUtil<LcActivityParticipation>(LcActivityParticipation.class);
        util.exportExcel(response, list, "活动参与记录数据");
    }

    /**
     * 获取活动参与记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:participation:query')")
    @GetMapping(value = "/{participationId}")
    public AjaxResult getInfo(@PathVariable("participationId") Long participationId)
    {
        return success(lcActivityParticipationService.selectLcActivityParticipationByParticipationId(participationId));
    }

    /**
     * 新增活动参与记录
     */
    @PreAuthorize("@ss.hasPermi('system:participation:add')")
    @Log(title = "活动参与记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LcActivityParticipation lcActivityParticipation)
    {
        return toAjax(lcActivityParticipationService.insertLcActivityParticipation(lcActivityParticipation));
    }

    /**
     * 修改活动参与记录
     */
    @PreAuthorize("@ss.hasPermi('system:participation:edit')")
    @Log(title = "活动参与记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LcActivityParticipation lcActivityParticipation)
    {
        return toAjax(lcActivityParticipationService.updateLcActivityParticipation(lcActivityParticipation));
    }

    /**
     * 删除活动参与记录
     */
    @PreAuthorize("@ss.hasPermi('system:participation:remove')")
    @Log(title = "活动参与记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{participationIds}")
    public AjaxResult remove(@PathVariable Long[] participationIds)
    {
        return toAjax(lcActivityParticipationService.deleteLcActivityParticipationByParticipationIds(participationIds));
    }
}
