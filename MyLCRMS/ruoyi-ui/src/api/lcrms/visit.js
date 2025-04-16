import request from '@/utils/request'

// 查询家访记录列表
export function listVisit(query) {
  return request({
    url: '/system/visit/list',
    method: 'get',
    params: query
  })
}

// 查询家访记录详细
export function getVisit(visitId) {
  return request({
    url: '/system/visit/' + visitId,
    method: 'get'
  })
}

// 新增家访记录
export function addVisit(data) {
  return request({
    url: '/system/visit',
    method: 'post',
    data: data
  })
}

// 修改家访记录
export function updateVisit(data) {
  return request({
    url: '/system/visit',
    method: 'put',
    data: data
  })
}

// 删除家访记录
export function delVisit(visitId) {
  return request({
    url: '/system/visit/' + visitId,
    method: 'delete'
  })
}
