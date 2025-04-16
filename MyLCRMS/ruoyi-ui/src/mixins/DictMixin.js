// src/mixins/DictMixin.js
import { getDicts } from "@/api/system/dict/data"; // 确保你 api/system/dict/ 目录下有 data.js 并导出了 getDicts

export default {
  data() {
    // 使用 computed 属性或在 created 钩子中初始化，避免在 data 中直接引用 this.dicts
    // 这里采用在 created 中初始化的方式
    return {
      // 字典数据
      dict: {
        type: {}
      }
    }
  },
  computed: {
     // 如果需要在模板中直接访问字典数据，可以保留这个计算属性
     // 但更推荐在 methods 或模板中直接使用 this.dict.type[xxx]
    // _dictData() {
    //    return this.dict.type;
    // }
  },
  created() {
    // 初始化字典 type 对象
    if (this.dicts instanceof Array && this.dicts.length > 0) {
      this.dict.type = this.dicts.reduce((acc, cur) => {
         acc[cur] = []; // 初始化为空数组
         return acc;
      }, {});

      // 加载字典数据
      this.dicts.forEach(dictType => {
          // 这里可以加上判断，如果 Vuex store 中已有，则不重复加载 (需要配合 Vuex 使用)
          getDicts(dictType).then(res => {
             // 使用 $set 确保响应式更新
             this.$set(this.dict.type, dictType, res.data || []); // 如果 res.data 是 null，给个空数组
          }).catch(err => {
             console.error(`字典 ${dictType} 加载失败:`, err);
          });
      })
    }
  },
  methods: {
     /**
       * 同步获取字典数据（如果已加载）
       * @param {String} dictType 字典类型
       * @returns {Array} 字典数据列表
       */
     getDictData(dictType) {
         return this.dict.type[dictType] || [];
     },

     /**
       * 异步获取字典数据，如果未加载则加载
       * @param {String} dictType 字典类型
       * @returns {Promise<Array>} 包含字典数据列表的 Promise
       */
     loadDictData(dictType) {
         if (this.dict.type[dictType] && this.dict.type[dictType].length > 0) {
             return Promise.resolve(this.dict.type[dictType]);
         } else {
             return getDicts(dictType).then(res => {
                 this.$set(this.dict.type, dictType, res.data || []);
                 return res.data || [];
             }).catch(err => {
                 console.error(`字典 ${dictType} 加载失败:`, err);
                 return Promise.reject(err); // 返回拒绝的 Promise
             });
         }
     }
  }
}