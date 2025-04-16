import request from '@/utils/request'

// 查询活动参与记录列表
export function listParticipation(query) {
  return request({
    url: '/system/participation/list',
    method: 'get',
    params: query
  })
}

// 查询活动参与记录详细
export function getParticipation(participationId) {
  return request({
    url: '/system/participation/' + participationId,
    method: 'get'
  })
}

// 新增活动参与记录
export function addParticipation(data) {
  return request({
    url: '/system/participation',
    method: 'post',
    data: data
  })
}

// 修改活动参与记录
export function updateParticipation(data) {
  return request({
    url: '/system/participation',
    method: 'put',
    data: data
  })
}

// 删除活动参与记录
export function delParticipation(participationId) {
  return request({
    url: '/system/participation/' + participationId,
    method: 'delete'
  })
}
