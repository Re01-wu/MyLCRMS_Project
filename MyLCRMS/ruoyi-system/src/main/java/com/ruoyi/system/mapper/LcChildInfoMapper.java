package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.LcChildInfo;

/**
 * 留守儿童信息Mapper接口
 * 
 * @author PoChi
 * @date 2025-04-06
 */
public interface LcChildInfoMapper 
{
    /**
     * 查询留守儿童信息
     * 
     * @param childId 留守儿童信息主键
     * @return 留守儿童信息
     */
    public LcChildInfo selectLcChildInfoByChildId(Long childId);

    /**
     * 查询留守儿童信息列表
     * 
     * @param lcChildInfo 留守儿童信息
     * @return 留守儿童信息集合
     */
    public List<LcChildInfo> selectLcChildInfoList(LcChildInfo lcChildInfo);

    /**
     * 新增留守儿童信息
     * 
     * @param lcChildInfo 留守儿童信息
     * @return 结果
     */
    public int insertLcChildInfo(LcChildInfo lcChildInfo);

    /**
     * 修改留守儿童信息
     * 
     * @param lcChildInfo 留守儿童信息
     * @return 结果
     */
    public int updateLcChildInfo(LcChildInfo lcChildInfo);

    /**
     * 删除留守儿童信息
     * 
     * @param childId 留守儿童信息主键
     * @return 结果
     */
    public int deleteLcChildInfoByChildId(Long childId);

    /**
     * 批量删除留守儿童信息
     * 
     * @param childIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLcChildInfoByChildIds(Long[] childIds);
}
