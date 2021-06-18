export const state = () => ({
    navTarget: "home",
    navScroll: "home"
})

export const getters = {
    getNavTarget(state){
        return state.navTarget
    }
}

export const mutations = {
    setNavTarget(state, target) {
        state.navTarget = target
    },
    setNavScroll(state, target) {
        state.navScroll = target
    }
}