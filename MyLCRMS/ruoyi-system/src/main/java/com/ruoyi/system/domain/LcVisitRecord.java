package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
// ==================== 修改开始: 导入 @Transient ====================

/**
 * 家访记录对象 lc_visit_record
 *
 * @author PoChi
 * @date 2025-04-06
 */
public class LcVisitRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录ID (主键) */
    private Long visitId;

    /** 关联儿童ID */
    // @Excel(name = "关联儿童ID") // Excel 中显示姓名
    private Long childId;

    // ==================== 新增字段 开始 ====================
    /** 关联儿童姓名 */
    @Excel(name = "关联儿童姓名") // Excel 中显示姓名
    private String childName;
    // ==================== 新增字段 结束 ====================


    /** 家访/联系时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss") // 确保格式带有时间
    @Excel(name = "家访/联系时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date visitTime;

    /** 家访人用户ID */
    // @Excel(name = "家访人用户ID") // Excel 中显示姓名
    private Long visitorUserId;

    /** 家访人姓名 */
    @Excel(name = "家访人姓名")
    private String visitorName; // 这个应该已存在

    /** 联系方式 */
    @Excel(name = "联系方式")
    private String visitMethod;

    /** 沟通内容摘要 */
    // @Excel(name = "沟通内容摘要") // Excel中可选
    private String content;

    // --- 原有 Getter 和 Setter ---
    public void setVisitId(Long visitId) { this.visitId = visitId; }
    public Long getVisitId() { return visitId; }
    public void setChildId(Long childId) { this.childId = childId; }
    public Long getChildId() { return childId; }
    public void setVisitTime(Date visitTime) { this.visitTime = visitTime; }
    public Date getVisitTime() { return visitTime; }
    public void setVisitorUserId(Long visitorUserId) { this.visitorUserId = visitorUserId; }
    public Long getVisitorUserId() { return visitorUserId; }
    public void setVisitorName(String visitorName) { this.visitorName = visitorName; }
    public String getVisitorName() { return visitorName; }
    public void setVisitMethod(String visitMethod) { this.visitMethod = visitMethod; }
    public String getVisitMethod() { return visitMethod; }
    public void setContent(String content) { this.content = content; }
    public String getContent() { return content; }

    // ==================== 新增 Getter 和 Setter 开始 ====================
    public String getChildName() { return childName; }
    public void setChildName(String childName) { this.childName = childName; }
    // ==================== 新增 Getter 和 Setter 结束 ====================


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("visitId", getVisitId())
                .append("childId", getChildId())
                .append("childName", getChildName()) // 添加到 toString
                .append("visitTime", getVisitTime())
                .append("visitorUserId", getVisitorUserId())
                .append("visitorName", getVisitorName())
                .append("visitMethod", getVisitMethod())
                .append("content", getContent())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}