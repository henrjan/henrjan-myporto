<template>
    <div class="hero" :id="navHome" ref="home">
        <div class="container">
            <div class="section">
                <h1>Hi, I'm Henry</h1>
                <p class="sub-title">Back End and Front End Developer</p>
                <p class="description">
                    I am Back-End and Front-End Developer currently based in Jakarta, Indonesia. I have passionate in building automated, robust, and reliable system. I like to code clean and simple and also prioritize performance and speed.
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
    height: 800px;
    z-index: 0;
    
    .container {
        height: 100%;
        max-width: $container-width;

        background-image: url("~/assets/hero-img.png");
        background-size: 65rem;
        background-position: top -1rem right -14rem;
        .section {
            z-index: 100;
            text-align: left;
            width: 50%;
            min-width: 400px;
            margin-top: 12.5rem;
            margin-left: 5rem;
            h1 {
                font-size: 40px;
                margin-bottom: 10px;
            }
            .sub-title {
                font-size: 28px;
                font-weight: 500;
                margin-bottom: 20px;
            }
            .description {
                font-size: 20px;
                margin-bottom: 28px;
            }
            .btn {
                color: #FFFFFF;
                font-size: 20px;
                font-weight: 500;
                padding: 16px 28px;
                width: 200px;
                background-color: #CF4040;
                border: none;
            }
        }
        /* .hero-img{
            z-index: 0;
            display: block;
            position: absolute;
            width: 65rem;

            right: -50px;
            margin-top: -30px;
        } */
    }
}

@include media("screen", "<=desktop-lg") {
    .hero {
        .container {
            background-position: top -2rem right -20rem;
        }
    }
}

@include media("screen", "<=desktop-md") {
    .hero {
        .container {
            background-position: top -2rem right -28rem;
            .section {
                margin-left: 2.5rem;
            }
        }
    }
}

@include media("screen", "<=desktop") {
    .hero {
        .container {
            background-position: top 6rem right -28rem;
        }
    }
}

@include media("screen", "<=tablet") {
    .hero {
        height: 60rem;
        .container {
            margin: 0;
            padding: 0;
            background-size: 60rem;
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
            .section {
                padding: 0 1.5rem;
            }
        }
    }
}

</style>