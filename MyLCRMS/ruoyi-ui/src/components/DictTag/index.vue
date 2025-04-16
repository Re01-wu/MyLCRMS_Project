<template>
  <div>
    <!-- v-for 不再获取 index -->
    <template v-for="item in displayOptions">
      <!-- 内部 v-if: 判断当前 item 是否在 values 中 -->
      <template v-if="values.includes(String(item.value))">
        <!-- 分支1.1: 渲染 span -->
        <span
          v-if="(!item.raw.listClass || item.raw.listClass === 'default') && (!item.raw.cssClass)"
          :key="item.value + '-span'"
          :class="item.raw.cssClass" 
        >{{ item.label + ' ' }}</span>
        <!-- 分支1.2: 渲染 el-tag -->
        <el-tag
          v-else
          :disable-transitions="true"
          :key="item.value + '-tag'"
          :type="item.raw.listClass === 'primary' ? '' : item.raw.listClass"
          :class="item.raw.cssClass"
        >
          {{ item.label + ' ' }}
        </el-tag>
      </template>
    </template>

    <!-- 如果 unmatchText 不为空，则显示未匹配或原始值 -->
    <template v-if="unmatchText">
      {{ unmatchText }}
    </template>
  </div>
</template>

<script>
export default {
  name: "DictTag",
  props: {
    options: {
      type: Array,
      default: null, // 保持 default: null
    },
    value: [Number, String, Array], // value 可以是数字、字符串或数组
    showValue: {
      type: Boolean,
      default: true, // 默认显示未匹配或原始值
    },
    separator: {
      type: String,
      default: "," // 默认分隔符
    }
  },
  computed: {
    // 将传入的 value 统一处理成字符串数组，方便比较
    values() {
      if (this.value === null || typeof this.value === 'undefined' || this.value === '') return []
      const sep = this.separator || ',';
      return Array.isArray(this.value)
             ? this.value.map(item => String(item)) // 数组元素转字符串
             : String(this.value).split(sep).map(s => s.trim()).filter(s => s !== ''); // 字符串分割、去空格、去空项
    },

    // 提供一个始终有效的 options 数组给模板使用，避免 null 错误
    displayOptions() {
      // 确保返回的是数组，如果 options 无效则返回空数组
      return this.options && Array.isArray(this.options) ? this.options : [];
    },

    // 计算未匹配的值组成的字符串，用于显示
    unmatchText() {
      // 如果 value 无效，则没有未匹配项
      if (this.values.length === 0) {
          return '';
      }

      // 如果 options 无效 (displayOptions 为空数组)
      if (this.displayOptions.length === 0) {
          // 如果需要显示原始值，则返回原始值拼接的字符串
          return this.showValue ? this.values.join(', ') : '';
      }

      // value 和 options 都有效，找出未匹配项
      const optionValues = this.displayOptions.map(opt => String(opt.value)); // 选项值转字符串
      const unmatched = this.values.filter(itemValue => !optionValues.includes(itemValue)); // 找出未匹配的值

      // 如果有未匹配项且 showValue 为 true，则返回未匹配项拼接的字符串
      return unmatched.length > 0 && this.showValue ? unmatched.join(', ') : '';
    }
  }
};
</script>

<style scoped>
.el-tag + .el-tag {
  margin-left: 10px;
}
</style>