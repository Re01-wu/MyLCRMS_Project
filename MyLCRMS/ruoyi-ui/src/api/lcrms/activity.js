import request from '@/utils/request'

// 查询关爱活动列表
export function listActivity(query) {
  return request({
    url: '/system/activity/list',
    method: 'get',
    params: query
  })
}

// 查询关爱活动详细
export function getActivity(activityId) {
  return request({
    url: '/system/activity/' + activityId,
    method: 'get'
  })
}

// 新增关爱活动
export function addActivity(data) {
  return request({
    url: '/system/activity',
    method: 'post',
    data: data
  })
}

// 修改关爱活动
export function updateActivity(data) {
  return request({
    url: '/system/activity',
    method: 'put',
    data: data
  })
}

// 删除关爱活动
export function delActivity(activityId) {
  return request({
    url: '/system/activity/' + activityId,
    method: 'delete'
  })
}

// ==================== 新增开始 ====================
// 查询所有活动列表 (用于下拉选择)
export function listAllActivities() {
  return request({
    url: '/system/activity/listAll',
    method: 'get'
  })
}
// ==================== 新增结束 ====================