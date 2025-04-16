import request from '@/utils/request'

// 查询留守儿童信息列表
export function listChild(query) {
  return request({
    url: '/system/child/list',
    method: 'get',
    params: query
  })
}

// 查询留守儿童信息详细
export function getChild(childId) {
  return request({
    url: '/system/child/' + childId,
    method: 'get'
  })
}

// 新增留守儿童信息
export function addChild(data) {
  return request({
    url: '/system/child',
    method: 'post',
    data: data
  })
}

// 修改留守儿童信息
export function updateChild(data) {
  return request({
    url: '/system/child',
    method: 'put',
    data: data
  })
}

// 删除留守儿童信息
export function delChild(childId) {
  return request({
    url: '/system/child/' + childId,
    method: 'delete'
  })
}
