package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.LcGuardianInfo;

/**
 * 监护人信息Mapper接口
 * 
 * @author PoChi
 * @date 2025-04-06
 */
public interface LcGuardianInfoMapper 
{
    /**
     * 查询监护人信息
     * 
     * @param guardianId 监护人信息主键
     * @return 监护人信息
     */
    public LcGuardianInfo selectLcGuardianInfoByGuardianId(Long guardianId);

    /**
     * 查询监护人信息列表
     * 
     * @param lcGuardianInfo 监护人信息
     * @return 监护人信息集合
     */
    public List<LcGuardianInfo> selectLcGuardianInfoList(LcGuardianInfo lcGuardianInfo);

    /**
     * 新增监护人信息
     * 
     * @param lcGuardianInfo 监护人信息
     * @return 结果
     */
    public int insertLcGuardianInfo(LcGuardianInfo lcGuardianInfo);

    /**
     * 修改监护人信息
     * 
     * @param lcGuardianInfo 监护人信息
     * @return 结果
     */
    public int updateLcGuardianInfo(LcGuardianInfo lcGuardianInfo);

    /**
     * 删除监护人信息
     * 
     * @param guardianId 监护人信息主键
     * @return 结果
     */
    public int deleteLcGuardianInfoByGuardianId(Long guardianId);

    /**
     * 批量删除监护人信息
     * 
     * @param guardianIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLcGuardianInfoByGuardianIds(Long[] guardianIds);
}
