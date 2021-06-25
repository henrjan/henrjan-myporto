<template>
  <div class="about" :id="navAbout" ref="about">
      <div class="container">
        <p class="title">WHAT I DO</p>
        <underline :dataWidth="dataWidth"/>
        <p class="sub-title">I Build and Develop Digital Application</p>
        <p class="desc">My job is to develop digital application that match business requirements, and provide solutions that satisfy the requirements. I work. My priority is building fast and high performance products and fast delivery to the market.  </p>

        <p class="sect-2 desc">Language I Speak</p>
        <ItemSlider :items="lngItems" />

        <p class="sect-2 desc">Tools I Use</p>
        <ItemSlider :items="tlItems" />

        <div class="work-experience">
            <p class="title">Work Experience</p>
            <div class="body">
                <div class="vl"></div>
                <div class="timeline">
                    <div class="dot"></div>
                    <div class="work-period">
                        <p class="period">2018 - 2021</p>
                        <div class="work-desc">
                            <h1 class="comp">PT. CLS SYSTEM</h1>
                            <p class="role">Back-End Developer</p>
                            <p class="desc">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Rem pariatur deserunt dolorem tempora temporibus mollitia beatae fuga asperiores nobis esse ratione architecto facere facilis quia quas officia corrupti tenetur, laudantium sit iste voluptate voluptas. Qui magni eveniet dicta sint mollitia voluptatum, minima consectetur culpa nostrum assumenda odio id distinctio numquam.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <img class="phone-img" alt="hero image" src="~/assets/phone-img.png">
      </div>
  </div>
</template>

<script>
import underline from './underline.vue'
import { ref, useStore, watch, onMounted } from '@nuxtjs/composition-api'
import language from '~/static/data_lang'
import tools from '~/static/data_tools'
import ItemSlider from './item-slider.vue'
import dataTarget from '~/assets/data-target'
export default {
    setup(){
        const store = useStore()
        const navAbout = ref(dataTarget.about)
        const about = ref(null)

        const dataWidth = ref(130)
        const lngItems = ref(language)
        const tlItems = ref(tools)

        watch(
            ()=>{return store.state.navTarget},
            (newValue) => {
                if (newValue == navAbout.value) {
                    let height = window.innerHeight
                    let newOffset = about.value.offsetTop + about.value.getElementsByClassName('title')[0].offsetTop - (height/2)
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
            navAbout,
            about,
            dataWidth,
            lngItems,
            tlItems
        }
    },
    components: { underline, ItemSlider },

}
</script>

<style lang="scss">
@import "include-media";
@import '~/assets/scss/variables';

$font-ox: Oxanium Font Medium;
$font-weight: 500;

@font-face {
    font-family: $font-ox;
    font-style: normal;
    font-weight: $font-weight;
    src: url('~/assets/oxanium/Oxanium-Medium.ttf') format('truetype');
}

.about {
    position: relative;
    // z-index: 100;
    margin: auto;

    padding: 7.5rem 0;
    background-color: #188ECC;

    .container {
        height: 100%;
        max-width: $container-width;
        padding: 0 2.5rem;
        overflow: hidden;
        p {
            text-align: center;
            max-width: 62.5rem;
            margin: auto;
        }

        .title {
            font-weight: 500;
            color: #000000;
            font-size: 1.5rem;
            
            margin-bottom: 0.125rem;
            text-align: center;
        }
        .sub-title {
            font-size: 2rem;
            font-weight: 700;

            margin-top: 2rem;
        }
        .desc {
            font-size: 1rem;
            margin-top: 2rem;
            margin-bottom: 2rem;
        }
        .sect-2{
            margin-top: 3rem;
            font-size:1.5rem;
            font-weight:500;
        }

        .work-experience {
            position: relative;
            z-index: 100;
            .title {
                font-size: 1.5rem;
                font-weight: 700;
                text-align: center;
                margin-bottom: 2rem;
            }
            .body {
                margin: auto;
                max-width: 56rem;
                width: fit-content;
                padding-left: 3rem;
                padding-right: 0;
                // box-sizing: border-box;
                display: flex;
                height: 25rem;
                .vl {
                    height: 100%;
                    border-left: 0.25rem solid transparent;
                    
                    border-image: linear-gradient(rgba(254, 135, 97, 0.5), #EB0000, rgba(254, 135, 97, 0.5)) 1;
                    border-radius: 0.25rem;
                }

                .timeline {
                    display: flex;
                    margin-top: 3rem;
                    .dot {
                        margin-top: 1rem;
                        width: 0.75rem;
                        height: 0.75rem;
                        border-radius: 50%;
                        background-color: #FF0000;
                        margin-left: -0.5rem;
                    }
                    .work-period {
                        display: flex;
                        .period {
                            margin-left: 1rem;
                            margin-top: 0.75rem;
                            font-size: 1.25rem;
                            font-family: $font-ox;
                            font-weight: $font-weight;
                            color: white;
                        }
                        .work-desc{
                            margin-left: 3rem;
                            max-width: 37.5rem;
                            color: #FFFFFF;
                            .comp{
                                margin-left: 0;
                                font-weight: 500;
                                margin-bottom: 0.5rem;
                            }
                            .role {
                                text-align: left;
                                margin-left: 0;
                                font-weight: 500;
                                font-size: 1.25rem;
                                color: #D6D6D6;
                            }
                            .desc {
                                text-align: left;
                                margin-left: 0;
                                font-size: 1.25rem;
                                margin-top: 1rem;
                            }
                        }
                    }
                }
            }
        }

        .phone-img{
            z-index: 0;
            position: absolute;
            width: 50rem;
            margin-top: -15.5rem;
            margin-left: 10rem;
        }
    }
}

@include media("screen", "<=desktop-md") {
    .about {
        .container {
            .work-experience {
                .body {
                    .timeline {
                        .work-period {
                            .work-desc {
                                max-width: 31.25rem;
                            }
                        }
                    }
                }
            }
            .phone-img {
                margin-left: 6.25rem;
            }
        }
    }
}

@include media("screen", "<=desktop") {
    .about {
        .container {
            .work-experience {
                .body {
                    height: 31.25rem;
                    .timeline {
                        .work-period {
                            flex-direction: columns;
                            .work-desc {
                                max-width: 25rem;
                            }
                        }
                    }
                }
            }
            .phone-img {
                margin-top: -10rem;
                width: 37.5rem;
            }
        }
    }
}

@include media("screen", "<=tablet") {
    .about {
        .container {
            .work-experience {
                .body {
                    height: 31.25rem;
                    .timeline {
                        .work-period {
                            flex-direction: column;
                            .period {
                                margin-left: 1.75rem;
                                margin-bottom: 0.5rem;
                            }
                            .work-desc{
                                margin-left: 1.75rem;
                            }
                        }
                    }
                }
            }
            .phone-img {
                margin-top: -7.5rem;
                margin-left: 3rem;
                width: 31.25rem;
            }
        }
    }
}

@include media("screen", "<=phone") {
    .about {
        .container {
            padding: 0 1.5rem;
            .work-experience {
                .body {
                    .timeline {
                        .work-period {
                            .period {
                                font-size: 1rem;
                            }
                            .work-desc{
                                .comp{
                                    font-size: 1.75rem;
                                }
                                .role {
                                    font-size: 1rem;
                                }
                                .desc {
                                    font-size: 1rem;
                                }
                            }
                        }
                    }
                }
            }
            .phone-img {
                margin-left: 0.75rem;
                width: 25rem;
            }
        }
    }
}
</style>