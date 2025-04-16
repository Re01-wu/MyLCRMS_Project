package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LcGuardianInfoMapper;
import com.ruoyi.system.domain.LcGuardianInfo;
import com.ruoyi.system.service.ILcGuardianInfoService;

/**
 * 监护人信息Service业务层处理
 * 
 * @author PoChi
 * @date 2025-04-06
 */
@Service
public class LcGuardianInfoServiceImpl implements ILcGuardianInfoService 
{
    @Autowired
    private LcGuardianInfoMapper lcGuardianInfoMapper;

    /**
     * 查询监护人信息
     * 
     * @param guardianId 监护人信息主键
     * @return 监护人信息
     */
    @Override
    public LcGuardianInfo selectLcGuardianInfoByGuardianId(Long guardianId)
    {
        return lcGuardianInfoMapper.selectLcGuardianInfoByGuardianId(guardianId);
    }

    /**
     * 查询监护人信息列表
     * 
     * @param lcGuardianInfo 监护人信息
     * @return 监护人信息
     */
    @Override
    public List<LcGuardianInfo> selectLcGuardianInfoList(LcGuardianInfo lcGuardianInfo)
    {
        return lcGuardianInfoMapper.selectLcGuardianInfoList(lcGuardianInfo);
    }

    /**
     * 新增监护人信息
     * 
     * @param lcGuardianInfo 监护人信息
     * @return 结果
     */
    @Override
    public int insertLcGuardianInfo(LcGuardianInfo lcGuardianInfo)
    {
        lcGuardianInfo.setCreateTime(DateUtils.getNowDate());
        return lcGuardianInfoMapper.insertLcGuardianInfo(lcGuardianInfo);
    }

    /**
     * 修改监护人信息
     * 
     * @param lcGuardianInfo 监护人信息
     * @return 结果
     */
    @Override
    public int updateLcGuardianInfo(LcGuardianInfo lcGuardianInfo)
    {
        lcGuardianInfo.setUpdateTime(DateUtils.getNowDate());
        return lcGuardianInfoMapper.updateLcGuardianInfo(lcGuardianInfo);
    }

    /**
     * 批量删除监护人信息
     * 
     * @param guardianIds 需要删除的监护人信息主键
     * @return 结果
     */
    @Override
    public int deleteLcGuardianInfoByGuardianIds(Long[] guardianIds)
    {
        return lcGuardianInfoMapper.deleteLcGuardianInfoByGuardianIds(guardianIds);
    }

    /**
     * 删除监护人信息信息
     * 
     * @param guardianId 监护人信息主键
     * @return 结果
     */
    @Override
    public int deleteLcGuardianInfoByGuardianId(Long guardianId)
    {
        return lcGuardianInfoMapper.deleteLcGuardianInfoByGuardianId(guardianId);
    }
}
