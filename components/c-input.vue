<template>
    <div class="input" ref="input">
        <p class="name">{{ fieldName }} <span v-if="required == 'true'">*</span> </p>
        <input type="text" @blur="onFocusOut" :value="modelValue" @input="$emit('update:modelValue', $event.target.value)">
        <p v-if="required == 'true'" class="warn hide">{{ getWarnMessage }}</p>
    </div>
</template>

<script>
export default {
    data() {
        return {
            
        }
    },
    props:{
        fieldName: String, 
        required: String, 
        modelValue: String,
        sendMessage: Number,
        warnMessage: String
    },
    methods: {
        onFocusOut() {
            // console.log(this.modelValue)
            if (this.required == 'true' && this.modelValue == '') {
                this.$refs.input.getElementsByClassName('warn')[0].classList.remove('hide')
                this.$refs.input.getElementsByTagName('input')[0].style.border = "4px solid #b30909"
            } else if (this.required == 'true' && this.modelValue != '') {
                this.$refs.input.getElementsByClassName('warn')[0].classList.add('hide')
                this.$refs.input.getElementsByTagName('input')[0].style.border = "4px solid transparent"
            }
        }
    },
    computed: {
        getWarnMessage() {
            if (this.warnMessage == '' || this.modelValue == '') {
                return "This field is required"
            }
            return this.warnMessage
        }
    },
    watch: {
        sendMessage: function(newVal){
            if (this.required == 'true' && (this.modelValue == '' || this.warnMessage != '')) {
                this.$refs.input.getElementsByClassName('warn')[0].classList.remove('hide')
                this.$refs.input.getElementsByTagName('input')[0].style.borderBottom = "4px solid #b30909"
            }
        }
    }
}
</script>

<style lang="scss">
.input {
    width: 100%;
    .name {
        font-size: 20px;
        font-weight: 500;
        color: black;
        margin-bottom: 0.25rem;
        span {
            color: #FF0000;
        }
    }
    input {
        font-size: 20px;
        padding: 10px;
        width: 100%;
        background-color: #FFFFFF;
        background-clip: padding-box;
        border: 4px solid transparent;
    }
    .warn {
        margin-top: 0px;
        font-weight: 500;
        font-size: 20px;
        font-style: italic;
        color: #b30909;
    }
    .hide {
        display: none;
    }
}

</style>