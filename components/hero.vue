<template>
    <div class="hero" :id="navHome" ref="home">
        <div class="container">
            <div class="section">
                <h1>Hi, I'm Henry</h1>
                <p class="description">
                    I am IT Back-End Developer currently based in Jakarta, Indonesia. I am specialized in building automated and robust server-side applications. My priority is performance and speed, i enjoy writing clean, elegant and efficient code.
                </p>
                <button class="btn">Get in touch</button>
            </div>
            <!-- <img class="hero-img" alt="hero image" src="~/assets/hero-img.png"> -->
        </div>
    </div>
</template>

<script>
import { ref, useStore, watch, onMounted } from '@nuxtjs/composition-api'
import dataTarget from '~/assets/data-target'
export default {
    setup() {
        const store = useStore()
        const navHome = ref(dataTarget.home)
        const home = ref(null)

        watch(
            ()=>{return store.state.navTarget},
            (newValue) => {
                if (newValue == navHome.value) {
                    window.scrollTo(
                        {
                            top: 0,
                            left: 0,
                            behavior: 'smooth'
                        }
                    )
                }
            },
        )

        /* onMounted(() => {
            window.addEventListener('resize', 
                () => {
                    console.log("inner width : ", window.innerWidth)
                    console.log("screen width : ", screen.width)
                    console.log("screen avail width : ", screen.availWidth)
                }
            )
        }) */

        return {
            navHome,
            home
        }
    }
}
</script>

<style lang="scss">
@import "include-media";
@import '~/assets/scss/variables';

.hero {
    // padding-left: 150px;
    width: 100%;
    background-color: #F27878;
    height: 37.5rem;
    z-index: 0;
    
    .container {
        height: 100%;
        max-width: $container-width;
        padding-top: 0.25rem;

        background-image: url("~/assets/hero-img.png");
        background-size: 55rem;
        background-position: top -1.5rem right -12.5rem;
        .section {
            z-index: 100;
            text-align: left;
            width: 50%;
            max-width: 31.25rem;
            min-width: 18.75rem;
            margin-top: 10rem;
            margin-left: 2.5rem;
            h1 {
                font-size: 44px;
                margin-bottom: 1rem;
            }
            // .sub-title {
            //     font-size: 28px;
            //     font-weight: 500;
            //     margin-bottom: 20px;
            // }
            .description {
                font-size: 1.25rem;
                margin-bottom: 1.75rem;
            }
            .btn {
                color: #FFFFFF;
                font-size: 1.25rem;
                font-weight: 500;
                padding: 1rem 1.75rem;
                width: 16rem;
                background-color: #CF4040;
                border: none;
            }
        }
    }
}

@include media("screen", "<=desktop-lg") {
    .hero {
        .container {
            background-position: top -1.5rem right -16rem;
        }
    }
}

@include media("screen", "<=desktop-md") {
    .hero {
        .container {
            background-position: top -1.5rem right -24rem;
            .section {
                margin-left: 2.5rem;
            }
        }
    }
}

@include media("screen", "<=desktop") {
    .hero {
        .container {
            background-position: top -1.5rem right -28rem;
        }
    }
}

@include media("screen", "<=tablet") {
    .hero {
        height: 55rem;
        .container {
            margin: 0;
            padding: 0;
            background-size: 55rem;
            background-position: top 20rem right -16rem;
            .section {
                width: 100%;
                margin: 0;
                padding: 0 2.5rem;
                padding-top: 10rem;
            }
        }
    }
}

@include media("screen", "<=phone") {
    .hero {
        .container {
            background-size: 45rem;
            background-position: top 17.5rem right -16rem;
            .section {
                padding: 0 1.5rem;
                padding-top: 7.5rem;
            }
        }
    }
}

</style>