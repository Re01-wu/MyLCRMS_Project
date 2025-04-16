package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LcActivityParticipation;

/**
 * 活动参与记录Service接口
 * 
 * @author PoChi
 * @date 2025-04-06
 */
public interface ILcActivityParticipationService 
{
    /**
     * 查询活动参与记录
     * 
     * @param participationId 活动参与记录主键
     * @return 活动参与记录
     */
    public LcActivityParticipation selectLcActivityParticipationByParticipationId(Long participationId);

    /**
     * 查询活动参与记录列表
     * 
     * @param lcActivityParticipation 活动参与记录
     * @return 活动参与记录集合
     */
    public List<LcActivityParticipation> selectLcActivityParticipationList(LcActivityParticipation lcActivityParticipation);

    /**
     * 新增活动参与记录
     * 
     * @param lcActivityParticipation 活动参与记录
     * @return 结果
     */
    public int insertLcActivityParticipation(LcActivityParticipation lcActivityParticipation);

    /**
     * 修改活动参与记录
     * 
     * @param lcActivityParticipation 活动参与记录
     * @return 结果
     */
    public int updateLcActivityParticipation(LcActivityParticipation lcActivityParticipation);

    /**
     * 批量删除活动参与记录
     * 
     * @param participationIds 需要删除的活动参与记录主键集合
     * @return 结果
     */
    public int deleteLcActivityParticipationByParticipationIds(Long[] participationIds);

    /**
     * 删除活动参与记录信息
     * 
     * @param participationId 活动参与记录主键
     * @return 结果
     */
    public int deleteLcActivityParticipationByParticipationId(Long participationId);
}
