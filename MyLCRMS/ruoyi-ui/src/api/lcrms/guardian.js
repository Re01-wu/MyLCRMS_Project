import request from '@/utils/request'

// 查询监护人信息列表 (分页和条件查询)
export function listGuardian(query) {
  return request({
    url: '/system/guardian/list',
    method: 'get',
    params: query // 使用 params 传递查询参数
  })
}

// 查询监护人信息详细
export function getGuardian(guardianId) {
  return request({
    url: '/system/guardian/' + guardianId,
    method: 'get'
  })
}

// 新增监护人信息
export function addGuardian(data) {
  return request({
    url: '/system/guardian',
    method: 'post',
    data: data // 使用 data 传递请求体
  })
}

// 修改监护人信息
export function updateGuardian(data) {
  return request({
    url: '/system/guardian',
    method: 'put',
    data: data // 使用 data 传递请求体
  })
}

// 删除监护人信息 (可以单个删除或批量删除)
export function delGuardian(guardianId) {
  // 如果 guardianId 是数组，会自动处理成 /system/guardian/1,2,3 格式
  return request({
    url: '/system/guardian/' + guardianId,
    method: 'delete'
  })
}

// ==================== 新增开始 ====================
// 查询所有监护人列表（用于下拉选择）
export function listAllGuardians() {
  return request({
    // 请求后端 LcGuardianInfoController 中定义的 @GetMapping("/listAll") 接口
    url: '/system/guardian/listAll', 
    method: 'get' 
    // 通常不需要参数，因为是查询所有
  })
}
// ==================== 新增结束 ====================