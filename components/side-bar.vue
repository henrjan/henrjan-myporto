<template>
    <div class="sidenav" ref="sidenav">
        <div class="bars" @click="showNav()">
            <img class="icon" src="~/assets/icons/bars.svg" />
        </div>    
        <div class="navbar">
            <div class="nav-close">
                <img class="icon" @click="hideNav()" src="~/assets/icons/times.svg" />
            </div>
            <div class="logo">
                <img alt="logo" src="~/assets/logo.png">
            </div>

            <div class="item-nav" ref="itemnav">
                <a :id="home" class="active" :data-target="home" @click="navSelected($event.target)">Home</a>
                <a :id="about" :data-target="about" @click="navSelected($event.target)">About</a>
                <a :id="work" :data-target="work" @click="navSelected($event.target)">Work</a>
                <a :id="blog" :data-target="blog" @click="navSelected($event.target)">Blog</a>
                <a :id="contact" :data-target="contact" @click="navSelected($event.target)">Contact</a>
                <hr class="indicator">
            </div>
        </div>
    </div>
</template>

<script>
import { onMounted, ref, reactive, useStore, watch, toRefs } from '@nuxtjs/composition-api'
import dataTarget from '~/assets/data-target'
export default {
    setup() {
        const store = useStore()
        const itemnav = ref(null)
        const sidenav = ref(null)
        const target = reactive(dataTarget)

        watch(
            ()=>{return store.state.navScroll},
            (newValue, oldValue) => {
                itemnav.value.getElementsByClassName('active')[0].classList.remove("active")
                let nav = itemnav.value.querySelector("#" + newValue)
                nav.classList.add('active')
                calcIndicator(itemnav.value)
            },
        )

        onMounted(() => {
            calcIndicator(itemnav.value)
        })
        
        function navSelected(nav) {
            // nav.classList.add("active")
            // let nodes = Array.prototype.slice.call(nav.target.parentElement.children)
            // let index = nodes.indexOf(nav.target)
            
            // calcIndicator(itemnav.value)
            let navTarget = nav.getAttribute("data-target")
            store.commit('setNavTarget', navTarget)
            hideNav()
        }

        function calcIndicator(itemNav) {
            let nav = itemNav.getElementsByClassName('active')[0]
            let ind = itemNav.getElementsByClassName('indicator')[0]
            ind.style.top = nav.offsetTop + "px"
            ind.style.height = nav.offsetHeight + "px"

            // let nodes = Array.prototype.slice.call( itemNav.children )
            // let index = nodes.indexOf(nav)
            // ind.style.transitionDuration = (((index+1)/(nodes.length-1)) * 1) + "s"
        }

        function showNav() {
            sidenav.value.classList.add('show')
            sidenav.value.getElementsByClassName('navbar')[0].classList.add('show')
        }

        function hideNav() {
            sidenav.value.classList.remove('show')
            sidenav.value.getElementsByClassName('navbar')[0].classList.remove('show')
        }

        return {
            itemnav,
            sidenav,
            navSelected,
            showNav,
            hideNav,
            ...toRefs(target)
        }
    }
}
</script>

<style lang="scss">
@import "include-media";
@import '~/assets/scss/variables';
$font-size: 1.5rem;
$width: 12.5rem;
$img-width: 6.25rem;
$background-color: #3D3D3D;


.sidenav {
    position: fixed;
    z-index: 1000;
    top: 0;
    right: 0;
    left: 0;
    height: 100%;
    width: $width;

    .bars {
        display: none;
    }

    .navbar {

        z-index: 200;
        position: relative;
        width: $width;
        height: 100%;
        background-color: $background-color;
        transition: all .5s;
        &.show {
            margin-left: 0;
        }
        .nav-close{
            display: none;
        }
        .logo {
            height: 16rem;
            img {
                display: block;
                width: $img-width;
                margin: auto;
                padding-top: 6.25rem;
            }
        }

        .item-nav {
            position: relative;
            a {
                position: relative;
                z-index: 100;

                padding: 1.25rem 0;
                padding-left: 3.75rem;
                display: block;
                font-size: $font-size;
                color: #FFFFFF;
                text-decoration: none;

                border-top: solid 1px #8a8a8a;
                &:last-of-type{
                    border-bottom: solid 1px #8a8a8a;
                }
                &:hover {
                    background-color: #4BBBF5
                }
            }
            .indicator{
                width: 100%;
                display: block;
                position: absolute;
                top: 0;
                border: none;
                background-color: #188ECC;

                transition-property: all;
                transition-duration: .3s;
                transition-timing-function: ease-in;
            }
        }
    }
}

@include media("screen", "<=desktop") {
    .sidenav {
        max-width: 64rem;
        width: fit-content;
        // height: fit-content;
        &.show {
            width: 100%;
            height: 100%;
            background-color: rgba(97, 97, 97, 0.6);
        }

        .bars {
            display: block;
            z-index: 100;
            position: absolute;
            padding: 0.75rem 1rem;
            padding-bottom: 0.6rem;
            margin: 1.25rem;
            background-color: rgba(128, 128, 128, 0.7);
            border-radius: 0.6rem;
            width: fit-content;
            .icon {
                width: 2.5rem;
            }
            &:hover{
                cursor: pointer;
            }
        }

        .navbar {
            width: 18.75rem;
            margin-left: -18.75rem;

            .nav-close{
                display: block;

                padding: 1rem;
                margin-right: 0;
                margin-left: auto;
                width: fit-content;
                text-align: right;
                .icon {
                    width: 2rem;
                    &:hover{
                        cursor: pointer;
                    }
                }
            }

            .logo {
                height: 10rem;
                img {
                    padding-top: 1.25rem;
                }
            }
        }
    }
}

@include media("screen", "<=tablet") {
    .sidenav {
        max-width: 48rem;
        .bars {
            .icon{
                width: 2rem;
            }
        }
    }
}

@include media("screen", "<=phone") {
    .sidenav {
        max-width: 30rem;
        .navbar {
            // width: 100%;
            margin-left: -100%;
        }
    }
}

</style>