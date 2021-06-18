<template>
  <div class="project" :id="navProject" ref="work">
    <div class="data">
      <h1>MY WORK</h1>
      <underline :dataWidth="dataWidth"/>
      <div class="proj-item">
        <img alt="Locard+" src="~/assets/locard.png">
        <div class="summary">
          <p class="name">Locard+ (2019)</p>
          <p class="description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, perferendis. Eveniet nostrum nobis quibusdam eligendi labore quasi magni nam enim expedita, harum ipsum voluptatibus ducimus explicabo quo fugit ut in eaque repudiandae quas maiores perspiciatis similique. Laboriosam voluptate, omnis odio ipsum velit autem quod fugit laborum obcaecati temporibus animi totam?</p>
          <div class="cta">
            <button class="visit">Visit website</button>
            <p class="or" >or</p>
            <button class="playstore"></button>
          </div>
        </div>
      </div>
      <div class="proj-item">
        <img class="top" alt="CLS RIM" src="~/assets/cls_rim.png">
        <div class="summary">
          <p class="name">CLS RIM (2019)</p>
          <p class="description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, perferendis. Eveniet nostrum nobis quibusdam eligendi labore quasi magni nam enim expedita, harum ipsum voluptatibus ducimus explicabo quo fugit ut in eaque repudiandae quas maiores perspiciatis similique. Laboriosam voluptate, omnis odio ipsum velit autem quod fugit laborum obcaecati temporibus animi totam?</p>
        </div>
        <img class="bottom" alt="CLS RIM" src="~/assets/cls_rim.png">
      </div>
      <div class="proj-item">
        <img alt="Locard+" src="~/assets/locard.png">
        <div class="summary">
          <p class="name">Tokolab ID (2020)</p>
          <p class="description">Lorem ipsum dolor sit amet consectetur adipisicing elit. Sed, perferendis. Eveniet nostrum nobis quibusdam eligendi labore quasi magni nam enim expedita, harum ipsum voluptatibus ducimus explicabo quo fugit ut in eaque repudiandae quas maiores perspiciatis similique. Laboriosam voluptate, omnis odio ipsum velit autem quod fugit laborum obcaecati temporibus animi totam?</p>
          <div class="cta">
            <button class="visit">Visit website</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import dataTarget from '~/assets/data-target'
import { ref, useStore, watch, onMounted } from '@nuxtjs/composition-api'
import underline from './underline.vue'
export default {
  setup(){
      const dataWidth = ref(110)
      const store = useStore()
      const navProject = ref(dataTarget.work)
      const work = ref(null)

      watch(
            ()=>{return store.state.navTarget},
            (newValue) => {
                if (newValue == navProject.value) {
                    // console.log(work.value.getElementsByClassName('data')[0].offsetTop)
                    let height = window.innerHeight
                    let newOffset = work.value.getElementsByClassName('data')[0].offsetTop - (height/2)
                    window.scrollTo(
                        {
                            top: newOffset,
                            left: 0,
                            behavior: 'smooth'
                        }
                    )
                }
            },
        )

      return {
          work,
          navProject,
          dataWidth,
      }
  },
  components: { underline },
}
</script>

<style lang="scss">
@import "include-media";
@import '~/assets/scss/variables';

.project {
  padding-top: 200px;
  padding-bottom: 150px;
  background-color: #F27878;
  .data{
    position: relative;
    h1{
      font-size: 24px;
      width: fit-content;
      font-weight: 500;
      margin: auto;
    }
    .proj-item {
      max-width: 1200px;
      margin: 0 auto;
      margin-top: 150px;
      justify-content: center;
      align-items: center;
      display: flex;
      img{
        margin: 0 1.5rem;
        width: 550px;
        &.top{
          display: none;
        }
      }
      .summary{
        margin: 0 1.5rem;
        flex-grow: 1;
        // margin: 0;
        .name {
          font-size: 28px;
          font-weight: 500;
          margin-bottom: 20px;
        }
        .description {
          font-size: 20px;
          margin-bottom: 20px;
        }
        .cta {
          display: flex;
          align-items: center;
          .visit {
            font-size: 20px;
            font-weight: 500;
            color: #FFFFFF;
            padding: 16px 28px;
            width: 200px;
            background-color: #CF4040;
          }
          .or {
            text-transform: uppercase;
            margin: 0 20px;
          }
          .playstore {
            background-image: url("~/assets/playstore.png");
            background-size: cover;
            width: 200px;
            height: 3.75rem;
          }
        }
      }
    }
  }

}

@include media("screen", "<=desktop-lg") {
  .project {
    .data{
      .proj-item{
        max-width: 1000px;
        img{
          width: 500px;
          margin: 0 1.25rem;
        }
        .summary {
          margin: 0 1.25rem;
          .name{
            // font-size: 1.5rem;
          }
          .description {
            // font-size: 1.25rem;
          }
        }
      }
    }
  }
}

@include media("screen", "<=desktop-md") {
  .project {
    .data{
      .proj-item{
        max-width: 52rem;
        img{
          width: 27.5rem;
          margin: 0 0.75rem;
        }
        .summary {
          margin: 0 0.75rem;
          .name{
            font-size: 1.5rem;
            margin-bottom: 1rem;
          }
          .description {
            font-size: 1rem;
            margin-bottom: 1rem;
          }
          .cta {
            .visit {
              font-size: 1rem;
              padding: 0.75rem 1.25rem;
              width: 10rem;
            }
            .or {
              margin: 0 1rem;
            }
            .playstore {
              width: 10rem;
              height: 2.875rem;
            }
          }
        }
      }
    }
  }
}

@include media("screen", "<=desktop") {
  .project {
    .data{
      .proj-item{
        max-width: 45rem;
        img{
          width: 24rem;
          margin: 0 0.5rem;
        }
        .summary {
          margin: 0 0.5rem;
        }
      }
    }
  }
}

@include media("screen", "<=tablet") {
  .project {
    .data{
      .proj-item{
        margin-top: 5rem;
        max-width: 46rem;
        padding: 0 1.5rem;
        flex-direction: column;
        img{
          width: 32rem;
          margin: 0;
          margin-bottom: 2rem;
          &.top{
            display: block;
          }
          &.bottom{
            display: none;
          }
        }
        .summary {
          margin: 0;
          .name{
            font-size: 1.75rem;
            margin-bottom: 1.25rem;
          }
          .description {
            font-size: 1.25rem;
            margin-bottom: 1.25rem;
          }
          .cta {
            .visit {
              font-size: 1.25rem;
              padding: 1rem 1.5rem;
              width: 12.5rem;
            }
            .playstore {
              width: 12.5rem;
              height: 3.75rem;
            }
          }
        }
      }
    }
  }
}

@include media("screen", "<=phone") {
  .project {
    .data{
      .proj-item{
        margin-top: 3rem;
        max-width: 24rem;
        padding: 0 1rem;
        img{
          width: 20rem;
        }
        .summary {
          .name{
            font-size: 1.5rem;
            margin-bottom: 1rem;
          }
          .description {
            font-size: 1rem;
            margin-bottom: 1rem;
          }
          .cta {
            .visit {
              font-size: 1rem;
              padding: 0.75rem 1.25rem;
              width: 8rem;
            }
            .playstore {
              width: 8rem;
              height: 2.25rem;
            }
          }
        }
      }
    }
  }
}

</style>