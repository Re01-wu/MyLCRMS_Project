package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 活动参与记录对象 lc_activity_participation
 *
 * @author PoChi
 * @date 2025-04-07
 */
public class LcActivityParticipation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 参与记录ID */
    private Long participationId;

    /** 关联活动ID */
    // @Excel(name = "关联活动ID")
    private Long activityId;

    // ==================== 新增字段 开始 ====================
    /** 关联活动名称 */
    @Excel(name = "关联活动名称")
    private String activityName;
    // ==================== 新增字段 结束 ====================

    /** 关联儿童ID */
    // @Excel(name = "关联儿童ID")
    private Long childId;

    // ==================== 新增字段 开始 ====================
    /** 关联儿童姓名 */
    @Excel(name = "关联儿童姓名")
    private String childName;
    // ==================== 新增字段 结束 ====================

    /** 参与/签到时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "参与时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date participationTime;

    /** 活动表现/反馈 */
    @Excel(name = "活动表现")
    private String performance;

    // --- 原有 Getter 和 Setter ---
    public void setParticipationId(Long participationId) { this.participationId = participationId; }
    public Long getParticipationId() { return participationId; }
    public void setActivityId(Long activityId) { this.activityId = activityId; }
    public Long getActivityId() { return activityId; }
    public void setChildId(Long childId) { this.childId = childId; }
    public Long getChildId() { return childId; }
    public void setParticipationTime(Date participationTime) { this.participationTime = participationTime; }
    public Date getParticipationTime() { return participationTime; }
    public void setPerformance(String performance) { this.performance = performance; }
    public String getPerformance() { return performance; }

    // ==================== 新增 Getter 和 Setter 开始 ====================
    public String getActivityName() { return activityName; }
    public void setActivityName(String activityName) { this.activityName = activityName; }
    public String getChildName() { return childName; }
    public void setChildName(String childName) { this.childName = childName; }
    // ==================== 新增 Getter 和 Setter 结束 ====================

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("participationId", getParticipationId())
                .append("activityId", getActivityId())
                .append("activityName", getActivityName()) // 添加
                .append("childId", getChildId())
                .append("childName", getChildName())     // 添加
                .append("participationTime", getParticipationTime())
                .append("performance", getPerformance())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}