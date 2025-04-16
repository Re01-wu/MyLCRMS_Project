package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LcVisitRecordMapper;
import com.ruoyi.system.domain.LcVisitRecord;
import com.ruoyi.system.service.ILcVisitRecordService;

/**
 * 家访记录Service业务层处理
 * 
 * @author PoChi
 * @date 2025-04-06
 */
@Service
public class LcVisitRecordServiceImpl implements ILcVisitRecordService 
{
    @Autowired
    private LcVisitRecordMapper lcVisitRecordMapper;

    /**
     * 查询家访记录
     * 
     * @param visitId 家访记录主键
     * @return 家访记录
     */
    @Override
    public LcVisitRecord selectLcVisitRecordByVisitId(Long visitId)
    {
        return lcVisitRecordMapper.selectLcVisitRecordByVisitId(visitId);
    }

    /**
     * 查询家访记录列表
     * 
     * @param lcVisitRecord 家访记录
     * @return 家访记录
     */
    @Override
    public List<LcVisitRecord> selectLcVisitRecordList(LcVisitRecord lcVisitRecord)
    {
        return lcVisitRecordMapper.selectLcVisitRecordList(lcVisitRecord);
    }

    /**
     * 新增家访记录
     * 
     * @param lcVisitRecord 家访记录
     * @return 结果
     */
    @Override
    public int insertLcVisitRecord(LcVisitRecord lcVisitRecord)
    {
        lcVisitRecord.setCreateTime(DateUtils.getNowDate());
        return lcVisitRecordMapper.insertLcVisitRecord(lcVisitRecord);
    }

    /**
     * 修改家访记录
     * 
     * @param lcVisitRecord 家访记录
     * @return 结果
     */
    @Override
    public int updateLcVisitRecord(LcVisitRecord lcVisitRecord)
    {
        lcVisitRecord.setUpdateTime(DateUtils.getNowDate());
        return lcVisitRecordMapper.updateLcVisitRecord(lcVisitRecord);
    }

    /**
     * 批量删除家访记录
     * 
     * @param visitIds 需要删除的家访记录主键
     * @return 结果
     */
    @Override
    public int deleteLcVisitRecordByVisitIds(Long[] visitIds)
    {
        return lcVisitRecordMapper.deleteLcVisitRecordByVisitIds(visitIds);
    }

    /**
     * 删除家访记录信息
     * 
     * @param visitId 家访记录主键
     * @return 结果
     */
    @Override
    public int deleteLcVisitRecordByVisitId(Long visitId)
    {
        return lcVisitRecordMapper.deleteLcVisitRecordByVisitId(visitId);
    }
}
