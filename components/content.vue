<template>
  <div class="content" ref="content">
      <!-- <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Beatae, ut.</p> -->
    <hero class="c-home"/>
    <About class="c-about"/>
    <Project class="c-work" />
    <Blog class="c-blog"/>
    <Contact class="c-contact"/>
  </div>
</template>

<script>
import About from './about.vue'
import Blog from './blog.vue'
import Contact from './contact.vue'
import hero from './hero.vue'
import Project from './project.vue'
import { ref, useStore, watch, onMounted, h } from '@nuxtjs/composition-api'
import dataTarget from '~/assets/data-target'
export default {
  setup(){
    const store = useStore()
    const content = ref(null)

    let refNav = dataTarget.home

    onMounted(()=>{
        let homeTop = content.value.getElementsByClassName('c-home')[0].offsetTop
        let aboutTop = content.value.getElementsByClassName('c-about')[0].offsetTop
        let workTop = content.value.getElementsByClassName('c-work')[0].offsetTop
        let blogTop = content.value.getElementsByClassName('c-blog')[0].offsetTop
        let contactTop = content.value.getElementsByClassName('c-contact')[0].offsetTop

        let homeHeight = homeTop + content.value.getElementsByClassName('c-home')[0].offsetHeight
        let aboutHeight = aboutTop + content.value.getElementsByClassName('c-about')[0].offsetHeight
        let workHeight = workTop + content.value.getElementsByClassName('c-work')[0].offsetHeight
        let blogHeight = blogTop + content.value.getElementsByClassName('c-blog')[0].offsetHeight
        let contactHeight = contactTop + content.value.getElementsByClassName('c-contact')[0].offsetHeight
        
        window.addEventListener(
          'scroll',
          (event)=>{
                  let windowOffset = window.scrollY
                  let height = windowOffset + (window.innerHeight / 2)
                  let windowBottom = windowOffset + window.innerHeight

                  if (refNav != dataTarget.home && (height < homeHeight || windowOffset <= 0)) {
                      store.commit("setNavScroll", dataTarget.home)
                  } else if (refNav != dataTarget.about && height >= aboutTop && height < aboutHeight) {
                      store.commit("setNavScroll", dataTarget.about)
                  } else if (refNav != dataTarget.work && height >= workTop && height < workHeight) {
                      store.commit("setNavScroll", dataTarget.work)
                  } else if (refNav != dataTarget.blog && height >= blogTop && height < blogHeight) {
                      store.commit("setNavScroll", dataTarget.blog)
                  } else if (refNav != dataTarget.contact && (height >= contactTop || windowBottom >= contactHeight)) {
                      store.commit("setNavScroll", dataTarget.contact)
                  }
          }
        )
      })

      watch(
            ()=>{return store.state.navScroll},
            (newValue) => {
                refNav = newValue
            },
        )

    return {
      content
    }
  },
  components: { hero, About, Project, Blog, Contact },

}
</script>

<style lang="scss">
@import "include-media";
@import '~/assets/scss/variables';

.content{
    @include media("screen", ">=tablet") {
        margin-left: 0;
    }
    @include media("screen", ">=desktop") {
        margin-left: 200px;
    }
    /* padding-left: 150px; */
}
</style>