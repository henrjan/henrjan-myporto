<template>
  <div class="slider">
    <v-sheet
        class="mx-auto slider-component"
        elevation="5"
        color="#188ECC"
    >
        <v-slide-group
            prev-icon="fas fa-chevron-circle-left"
            next-icon="fas fa-chevron-circle-right"
            large
            show-arrows
        >
            <v-slide-item
                v-for="{image, name} in items"
                :key="name"
            >
                <div class="item">
                    <img :alt="name" :src="image"> 
                    <p>{{name}}</p>
                </div>
            </v-slide-item>
        </v-slide-group>
    </v-sheet>
  </div>
</template>

<script>
export default {
    props: ['items']
}
</script>

<style lang="scss">
@import "include-media";
@import '~/assets/scss/variables';

.slider {
    margin: auto;
    max-width: fit-content;
    margin-bottom: 50px;
    .slider-component {
        max-width: 1005px;
        padding: 20px 0;
        .item {
            width: 130px;
            display: flex;
            flex-direction: column;
            // justify-content: space-around;
            align-items: center;
            padding: 15px 10px;
            margin: 0 10px;
            border: 2px solid black;
            border-radius: 10px;
            img {
                align-self: center;
                max-width: 100px;
                max-height: 70px;
                margin: auto 0;
                // flex-grow: 1;
            }
            p{
                font-size: 16px;
                font-weight: 500;
                align-self: center;
                // justify-items: flex-end;
                margin: 0;
                margin-top: 15px;
            }
        }
    }
}

@include media("screen", "<=desktop-md") {
    .slider {
        #{&}-component {
            max-width: 700px;
        }
    }
}

@include media("screen", "<=desktop") {
    .slider {
        #{&}-component {
            max-width: 650px;
            .item {
                width: 100px;
                margin: 0 5px;
                img {
                    
                    max-width: 80px;
                    max-height: 70px;
                }
            }
        }
    }
}

@include media("screen", "<=tablet") {
    .slider {
        #{&}-component {
            max-width: 504px;
            .item {
                margin: 0 5px;
                padding: 10px 5px;
                width: 90px;
                img {
                    max-width: 75px;
                    max-height: 60px;
                }
            }
        }
    }
}

@include media("screen", "<=phone") {
    .slider {
        #{&}-component {
            max-width: 404px;
        }
    }
}
</style>