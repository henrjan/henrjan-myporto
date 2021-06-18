<template>
  <div class="blog" :id="navBlog" ref="blog">
    <h1 class="title">BLOG</h1>
    <underline :dataWidth="dataWidth"/>
    <div class="article">
        <a class="article-title" href="#">Multiple Lock with Key Implementation in Go</a>
        <p class="date">On Mar 11, 2021</p>
        <p class="article-content">
            A couple of months ago, I was developing services to calculate balance transaction sent from one’s user account to another’s user account and vice versa. Each transaction request is handled concurrently, thus reading and writing to databases also happens concurrently. Concurrent operations could cause data race if handled incorrectly and causing indeterminate value in user’s balance calculation. To avoid this, we need to make balance calculation on each user’s account run synchronously while maintaining concurent behaviour.
        </p>
        <a class="article-cta" href="#">Read more...</a>
    </div>
    <hr class="article-sep">
  </div>
  
</template>

<script>
import underline from './underline.vue'
import dataTarget from '~/assets/data-target'
import { ref, useStore, watch, onMounted } from '@nuxtjs/composition-api'
export default {
    setup(){
        const dataWidth = ref(70)
        const store = useStore()
        const navBlog = ref(dataTarget.blog)
        const blog = ref(null)

        watch(
            ()=>{return store.state.navTarget},
            (newValue) => {
                if (newValue == navBlog.value) {
                    let height = window.innerHeight
                    let newOffset = blog.value.getElementsByClassName('title')[0].offsetTop - (height/2)
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
            blog,
            navBlog,
            dataWidth,
        }
    },
    components: { underline },
}
</script>

<style lang="scss">
@import "include-media";
@import '~/assets/scss/variables';

.blog {
    padding-top: 100px;
    padding-bottom: 50px;
    background-color: #188ECC;
    h1 {
        text-align: center;
        font-weight: 500;
        font-size: 28px;
    }
    .article {
        margin: 100px auto;
        margin-bottom: 50px;
        max-width: 1000px;
        a {
            text-decoration: none;
        }
        &-title{
            display: block;
            font-size: 44px;
            color: white;
            margin-bottom: 6px;
        }
        .date {
            font-size: 24px;
            color: rgba(255, 255, 255, 0.6);
            margin-bottom: 24px;
        }
        &-content {
            font-size: 24px;
            color: white;
            margin-bottom: 16px;
        }
        &-cta {
            font-size: 24px;
            color: #00FFFF;
        }
    }
    .article-sep{
        max-width: 1000px;
        margin: 0 auto;
        border: 2px solid transparent;
        border-image: linear-gradient(0.25turn, #7BB8FF, #004CBF, #7BB8FF) 1;
        border-radius: 1px;
    }
}

@include media("screen", "<=desktop-lg") {
  .blog {
    .article, .article-sep{
        padding: 0 1.5rem;
    }
  }
}
@include media("screen", "<=desktop-md") {
  .blog {
    .article{
        max-width: 52rem;
    }
    .article-sep{
        margin: 0 10%;
        max-width: 52rem;
    }
  }
}
@include media("screen", "<=desktop") {
  .blog {
    .article{
        max-width: 45rem;
        &-title {
            font-size: 2.25rem;
        }
        .date{
            font-size: 1.25rem;
        }
        &-content {
            font-size: 1.25rem;
        }
        &-cta {
            font-size: 1.25rem;
        }
    }
    .article-sep{
        margin: 0 12.5%;
        max-width: 45rem;
    }
  }
}
@include media("screen", "<=tablet") {
  .blog {
    .article {
        max-width: 33.75rem;
    }
    .article-sep {
        max-width: 32rem;
    }
  }
}
@include media("screen", "<=phone") {
  .blog {
    .article {
        max-width: 24rem;
        &-title {
            font-size: 1.75rem;
        }
        .date{
            font-size: 1rem;
        }
        &-content {
            font-size: 1rem;
        }
        &-cta {
            font-size: 1rem;
        }
    }
    .article-sep {
        margin: 0 10%;
        max-width: 24rem;
    }
  }
}
</style>