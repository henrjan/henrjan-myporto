<template>
  <!-- <div class="outer" :style="{ width: (parseInt(dataWidth) + 100) + 'px' }">
      <div id="inner" class="inner" :style="{ width:dataWidth + 'px' }">
      </div>
  </div> -->
    <div class="inner" :style="{ width:dataWidth + 'px' }">
    </div>
</template>

<script>
import { ref } from '@nuxtjs/composition-api'
export default {
    /* setup(props){
        console.log("props : ", props.dataWidth)
        const dataWidth = ref( props.dataWidth )
        console.log("line width : ", dataWidth.value)
        return {
            dataWidth
        }
    }, */
    props: ['dataWidth']
}
</script>

<style lang="scss">
.inner {
    // padding: 0 40px;
    mix-blend-mode: normal;
    border-radius: 4px;
    background: linear-gradient(270deg, #3D39F0 -31.11%, #D62912 131.67%);
    height: 6px;
    display: block;
    margin: auto;
}
</style>