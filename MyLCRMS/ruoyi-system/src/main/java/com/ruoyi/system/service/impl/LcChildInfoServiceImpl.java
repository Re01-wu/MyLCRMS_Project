package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LcChildInfoMapper;
import com.ruoyi.system.domain.LcChildInfo;
import com.ruoyi.system.service.ILcChildInfoService;

/**
 * 留守儿童信息Service业务层处理
 * 
 * @author PoChi
 * @date 2025-04-06
 */
@Service
public class LcChildInfoServiceImpl implements ILcChildInfoService 
{
    @Autowired
    private LcChildInfoMapper lcChildInfoMapper;

    /**
     * 查询留守儿童信息
     * 
     * @param childId 留守儿童信息主键
     * @return 留守儿童信息
     */
    @Override
    public LcChildInfo selectLcChildInfoByChildId(Long childId)
    {
        return lcChildInfoMapper.selectLcChildInfoByChildId(childId);
    }

    /**
     * 查询留守儿童信息列表
     * 
     * @param lcChildInfo 留守儿童信息
     * @return 留守儿童信息
     */
    @Override
    public List<LcChildInfo> selectLcChildInfoList(LcChildInfo lcChildInfo)
    {
        return lcChildInfoMapper.selectLcChildInfoList(lcChildInfo);
    }

    /**
     * 新增留守儿童信息
     * 
     * @param lcChildInfo 留守儿童信息
     * @return 结果
     */
    @Override
    public int insertLcChildInfo(LcChildInfo lcChildInfo)
    {
        lcChildInfo.setCreateTime(DateUtils.getNowDate());
        return lcChildInfoMapper.insertLcChildInfo(lcChildInfo);
    }

    /**
     * 修改留守儿童信息
     * 
     * @param lcChildInfo 留守儿童信息
     * @return 结果
     */
    @Override
    public int updateLcChildInfo(LcChildInfo lcChildInfo)
    {
        lcChildInfo.setUpdateTime(DateUtils.getNowDate());
        return lcChildInfoMapper.updateLcChildInfo(lcChildInfo);
    }

    /**
     * 批量删除留守儿童信息
     * 
     * @param childIds 需要删除的留守儿童信息主键
     * @return 结果
     */
    @Override
    public int deleteLcChildInfoByChildIds(Long[] childIds)
    {
        return lcChildInfoMapper.deleteLcChildInfoByChildIds(childIds);
    }

    /**
     * 删除留守儿童信息信息
     * 
     * @param childId 留守儿童信息主键
     * @return 结果
     */
    @Override
    public int deleteLcChildInfoByChildId(Long childId)
    {
        return lcChildInfoMapper.deleteLcChildInfoByChildId(childId);
    }
}
