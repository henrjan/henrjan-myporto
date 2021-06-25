<template>
  <div class="contact" :id="navContact" ref="contact">
      <div class="polygon"></div>
      <h1>Get in touch</h1>
      <underline :dataWidth="dataWidth"/>
      <div class="contact-info">
        <div class="inquiry" ref="inquiry">
            <div class="form">
              <div class="sender-info">
                <CInput class="name" fieldName="Name" :modelValue.sync="name" :sendMessage="send" warnMessage=""/>
                <CInput class="email" fieldName="Email" required="true" :modelValue.sync="email" :sendMessage="send" :warnMessage="warning"/>
              </div>
              <CInput class="subject" fieldName="Subject" :modelValue.sync="subject" :sendMessage="send" warnMessage=""/>
              <CTextarea class="message" fieldName="Message" maxLength="1000" required="true" :modelValue.sync="message" :sendMessage="send"/>
              <button class="cta-send" @click="sendInquiry">Send message</button>
            </div>
            <div class="ty hide">
              <i class="confirm"></i>
              <p class="th">Thank You!</p>
              <p>You will receive a reply from your email shortly.</p>
            </div>
        </div>
        <div class="info">
            <div class="group">
              <i class="location"></i>
              <p>
                Central Jakarta City,<br/>
                Special Region of Jakarta,<br/>
                Indonesia
              </p>
            </div>
            <div class="group">
              <i class="email"></i>
              <p>henr.janitra@gmail.com</p>
            </div>
            <a class="group" href="#">
              <i class="linkedin"></i>
              <p>Henry Janitra</p>
            </a>
        </div>
      </div>
  </div>
</template>

<script>
import dataTarget from '~/assets/data-target'
import { ref, useStore, watch, onMounted, reactive, toRefs } from '@nuxtjs/composition-api'
import underline from './underline.vue'
import CInput from './c-input.vue'
import CTextarea from './c-textarea.vue'
import axios from 'axios'
export default {
  setup(){
        const dataWidth = ref(155)
        const store = useStore()
        const navContact = ref(dataTarget.contact)
        const contact = ref(null)
        const inquiry = ref(null)

        const send = ref(0)

        const warning = ref('')

        const inputFields = reactive({
          name:'',
          email:'',
          subject:'',
          message:'',
        })

        watch(
            ()=>{return store.state.navTarget},
            (newValue) => {
                if (newValue == navContact.value) {
                    window.scrollTo(
                        {
                            top: contact.value.offsetTop,
                            left: 0,
                            behavior: 'smooth'
                        }
                    )
                }
            },
        )

        function sendInquiry() {
          if (inputFields.email != '' && inputFields.message != '') {
            if (inputFields.email.match(/^[^@$!%*?&#~^-]+(@[a-zA-z\-]+\.[a-zA-z]+?(.[a-zA-z]+))$/) == null) {
              warning.value = "Email format is invalid"
              send.value++
              return
            }

            submitInquiry()

            inquiry.value.getElementsByClassName('ty')[0].classList.remove('hide')
            inquiry.value.getElementsByClassName('form')[0].classList.add('hide')
          } else {
            warning.value = ''
            if (inputFields.email != '' && inputFields.email.match(/^[^@$!%*?&#~^-]+(@[a-zA-z\-]+\.[a-zA-z]+?(.[a-zA-z]+))$/) == null) {
              warning.value = "Email format is invalid"
            }
            send.value++
          }
        }

        async function submitInquiry() {
          await axios.post("https://be-porto.herokuapp.com/v1/inquiry/new", {
            "first_name":inputFields.name,
            "email":inputFields.email,
            "subject":inputFields.subject,
            "message":inputFields.message
          }).then((response)=>{
              // console.log("response : ", response.data)
          }).catch((error)=>{
              console.log("error : ", error)
          })
        }

        return {
            inquiry,
            contact,
            navContact,
            dataWidth,
            sendInquiry,
            send,
            warning,
            ...toRefs(inputFields)
        }
    },
  components: { underline, CInput, CTextarea },
}
</script>

<style lang="scss">
@import "include-media";
@import '~/assets/scss/variables';

.contact {
    padding-bottom: 150px;
    background-color: #F27878;
    .polygon{
        width: 100%;
        height: 12.5rem;
        background-color: #188ECC;
        clip-path: polygon(0 0, 100% 0, 100% 20%, 50% 100%, 0 20%);
        margin-bottom: 20px;
    }
    h1 {
        text-align: center;
        font-weight: 500;
        font-size: 28px;
    }
    &-info {
      margin: 0 auto;
      margin-top: 100px;
      display: flex;
      max-width: 64rem;
      .inquiry{
        position: relative;
        font-size: 20px;
        flex-grow: 1;
        width: 32rem;
        max-width: 32rem;
        margin: auto;
        .form {
          position: relative;
          z-index: 100;
          width: 100%;
          .sender-info{
            display: flex;
            justify-content: space-between;
            .name{
              width: 15rem;
            }
            .email{
              width: 15rem;
            }
          }
          .subject{
              margin-top: 0.5rem;
              width: 100%;
          }
          .message {
              margin-top: 0.5rem;
          }
          .cta-send {
              margin-top: 0.5rem;
              float: right;
              background-color: #CF4040;
              font-size: 20px;
              color: white;
              padding: 16px 28px;
              font-weight: 500;
              width: 200px;
          }
        }
        .ty {
          position: absolute;
          height: 400px;
          width: 100%;
          padding-top: 100px;
          top: 0;
          transition: all 1s 0.3s;
          .confirm {
            display: block;
            width: 40px;
            height: 40px;
            background-image: url("~/assets/icons/check.svg");
            margin: auto;
            margin-bottom: 20px;
          }
          p {
            vertical-align: middle;
            text-align: center;
            font-size: 20px;
          }
          .th {
            font-size: 28px;
            font-weight: 500;
            margin-bottom: 28px;
          }
        }
        .hide {
          opacity: 0;
          // display: none;
          transition: all 1s;
        }
      }
      .info {
        flex-grow: 1;
        margin: auto;
        margin-top: 40px;
        max-width: 25rem;
        height: fit-content;
        background-color: #E85B5B;
        .group{
          margin: 1.25rem auto;
          display: flex;
          max-width: 17.5rem;
          .location {
            width: 30px;
            margin-right: 2px;
            height: 40px;
            background-image: url("~/assets/icons/map-marker.svg");
          }
          .email{
            // margin-top: 4px;
            width: 32px;
            height: 32px;
            background-image: url("~/assets/icons/envelope.svg");
          }
          .linkedin {
            width: 32px;
            height: 40px;
            background-image: url("~/assets/icons/linkedin.svg");
          }
          p {
            margin-top: 4px;
            padding-left: 16px;

            color: black;
            font-weight: 500;
            font-size: 20px;
          }
        }
        a {
          text-decoration: none;
          &:hover{
            text-decoration: underline;
            text-decoration-color: black;
          }
        }
      }
    }
}
@include media("screen", "<=desktop-md") {
  .contact {
    &-info{
      max-width: 60rem;
      flex-direction: column;
      .inquiry{
        width: 45rem;
        max-width: 45rem;
        .form {
          .sender-info{
            .name{
              width: 21.5rem;
            }
            .email{
              width: 21.5rem;
            }
          }
        }
      }
      .info {
        padding: 1rem 0;
        max-width: 32rem;
        width: 32rem;
      }
    }
    .polygon{
        height: 11rem;
    }
  }
}
@include media("screen", "<=desktop") {
  .contact {
    &-info{
      .inquiry{
        width: 40rem;
        max-width: 40rem;
        .form {
          .sender-info{
            .name{
              width: 19rem;
            }
            .email{
              width: 19rem;
            }
          }
        }
      }
      
    }
    .polygon{
        height: 9.5rem;
    }
  }
}
@include media("screen", "<=tablet") {
  .contact {
    &-info{
      .inquiry{
        width: 29rem;
        max-width: 29rem;
        .form {
          .sender-info{
            flex-direction: column;
            .name{
              width: 20rem;
            }
            .email{
              margin-top: 0.25rem;
              width: 20rem;
            }
          }
          .subject {
            margin-top: 0.25rem;
          }
          .message {
            margin-top: 0.25rem;
          }
        }
      }
      .info {
        background-clip: content-box;
        max-width: 100%;
        padding: 1rem 1.5rem;
      }
    }
    .polygon{
        height: 7.5rem;
    }
  }
}
@include media("screen", "<=phone") {
  .contact {
    &-info{
      .inquiry{
        width: 20rem;
        max-width: 25rem;
        .form {
          .sender-info{
            .name{
              width: 20rem;
            }
            .email{
              width: 20rem;
            }
          }
        }
      }
      .info {
        max-width: 20rem;
        max-width: 100%;
        padding: 1rem 1rem;
      }
    }
    .polygon{
        height: 6rem;
    }
  }
}
</style>