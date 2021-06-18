<template>
    <div class="textarea" ref="textarea">
        <p class="name">{{ fieldName }} <span v-if="required == 'true'">*</span> </p>
        <textarea  :maxlength="maxLength" @blur="onFocusOut" :value="modelValue" @input="$emit('update:modelValue', $event.target.value)"></textarea>
        <p v-if="required == 'true'" class="warn hide">This field is required</p>
    </div>
</template>

<script>
export default {
    data() {
        return {
            
        }
    },
    props:['fieldName', 'maxLength', 'required', 'modelValue', 'sendMessage'],
    methods: {
        onFocusOut() {
            if (this.required == 'true' && this.modelValue == '') {
                this.$refs.textarea.getElementsByClassName('warn')[0].classList.remove('hide')
                this.$refs.textarea.getElementsByTagName('textarea')[0].style.border = "4px solid #b30909"
            } else if (this.required == 'true' && this.modelValue != '') {
                this.$refs.textarea.getElementsByClassName('warn')[0].classList.add('hide')
                this.$refs.textarea.getElementsByTagName('textarea')[0].style.border = "4px solid transparent"
            }
        }
    },
    watch: {
        sendMessage: function(newVal){
            if (newVal == true && this.required == 'true' && this.modelValue == '') {
                this.$refs.textarea.getElementsByClassName('warn')[0].classList.remove('hide')
                this.$refs.textarea.getElementsByTagName('textarea')[0].style.borderBottom = "4px solid #b30909"
            }
        }
    }
}
</script>

<style lang="scss">
.textarea {
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
    textarea {
        font-size: 20px;
        padding: 10px;
        width: 100%;
        height: 200px;
        overflow-y: scroll;
        background-color: #FFFFFF;
        border: 4px solid transparent;
        background-clip: padding-box;
    }
    .warn {
        margin-top: 0px;
        font-size: 20px;
        font-weight: 500;
        font-style: italic;
        color: #b30909;
    }
    .hide {
        display: none;
    }
}
</style>