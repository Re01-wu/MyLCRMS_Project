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
import com.ruoyi.system.domain.LcVisitRecord;
import com.ruoyi.system.service.ILcVisitRecordService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 家访记录Controller
 * 
 * @author PoChi
 * @date 2025-04-06
 */
@RestController
@RequestMapping("/system/visit")
public class LcVisitRecordController extends BaseController
{
    @Autowired
    private ILcVisitRecordService lcVisitRecordService;

    /**
     * 查询家访记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:visit:list')")
    @GetMapping("/list")
    public TableDataInfo list(LcVisitRecord lcVisitRecord)
    {
        startPage();
        List<LcVisitRecord> list = lcVisitRecordService.selectLcVisitRecordList(lcVisitRecord);
        return getDataTable(list);
    }

    /**
     * 导出家访记录列表
     */
    @PreAuthorize("@ss.hasPermi('system:visit:export')")
    @Log(title = "家访记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LcVisitRecord lcVisitRecord)
    {
        List<LcVisitRecord> list = lcVisitRecordService.selectLcVisitRecordList(lcVisitRecord);
        ExcelUtil<LcVisitRecord> util = new ExcelUtil<LcVisitRecord>(LcVisitRecord.class);
        util.exportExcel(response, list, "家访记录数据");
    }

    /**
     * 获取家访记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:visit:query')")
    @GetMapping(value = "/{visitId}")
    public AjaxResult getInfo(@PathVariable("visitId") Long visitId)
    {
        return success(lcVisitRecordService.selectLcVisitRecordByVisitId(visitId));
    }

    /**
     * 新增家访记录
     */
    @PreAuthorize("@ss.hasPermi('system:visit:add')")
    @Log(title = "家访记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LcVisitRecord lcVisitRecord)
    {
        return toAjax(lcVisitRecordService.insertLcVisitRecord(lcVisitRecord));
    }

    /**
     * 修改家访记录
     */
    @PreAuthorize("@ss.hasPermi('system:visit:edit')")
    @Log(title = "家访记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LcVisitRecord lcVisitRecord)
    {
        return toAjax(lcVisitRecordService.updateLcVisitRecord(lcVisitRecord));
    }

    /**
     * 删除家访记录
     */
    @PreAuthorize("@ss.hasPermi('system:visit:remove')")
    @Log(title = "家访记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{visitIds}")
    public AjaxResult remove(@PathVariable Long[] visitIds)
    {
        return toAjax(lcVisitRecordService.deleteLcVisitRecordByVisitIds(visitIds));
    }
}
