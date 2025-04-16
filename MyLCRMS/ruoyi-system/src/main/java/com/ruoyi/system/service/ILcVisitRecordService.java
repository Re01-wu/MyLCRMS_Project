package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LcVisitRecord;

/**
 * 家访记录Service接口
 * 
 * @author PoChi
 * @date 2025-04-06
 */
public interface ILcVisitRecordService 
{
    /**
     * 查询家访记录
     * 
     * @param visitId 家访记录主键
     * @return 家访记录
     */
    public LcVisitRecord selectLcVisitRecordByVisitId(Long visitId);

    /**
     * 查询家访记录列表
     * 
     * @param lcVisitRecord 家访记录
     * @return 家访记录集合
     */
    public List<LcVisitRecord> selectLcVisitRecordList(LcVisitRecord lcVisitRecord);

    /**
     * 新增家访记录
     * 
     * @param lcVisitRecord 家访记录
     * @return 结果
     */
    public int insertLcVisitRecord(LcVisitRecord lcVisitRecord);

    /**
     * 修改家访记录
     * 
     * @param lcVisitRecord 家访记录
     * @return 结果
     */
    public int updateLcVisitRecord(LcVisitRecord lcVisitRecord);

    /**
     * 批量删除家访记录
     * 
     * @param visitIds 需要删除的家访记录主键集合
     * @return 结果
     */
    public int deleteLcVisitRecordByVisitIds(Long[] visitIds);

    /**
     * 删除家访记录信息
     * 
     * @param visitId 家访记录主键
     * @return 结果
     */
    public int deleteLcVisitRecordByVisitId(Long visitId);
}
