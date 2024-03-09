<template>
    <v-app style="background: transparent;">
        <v-main>
            <v-layout :class="`d-flex fill-height align-end pa-2 ${positions[_data.Align]}`" style="height: 100vh; flex-direction: column; overflow: hidden">
                <template v-for="i in activeNotifications" :key="i">
                    <Transition name="slide" mode="out-in">
                        <v-card v-if="i.show" flat class="pa-3 ma-1" :color="_data.Background"  width="350">
                            <div class="d-flex align-center">
                                <div>
                                    <v-progress-circular class="progress" :color="_data.Types[i.type].color" size="45" width="3" :model-value="i.progress">
                                        <v-icon>{{ _data.Types[i.type].icon }}</v-icon>
                                    </v-progress-circular>
                                </div>
            
                                <div class="d-flex flex-column align-items justify-center ml-3">
                                    <div>
                                        <span :style="`color: ${_data.Types[i.type].color}; font-weight: 500; font-size: 1.1rem`">{{ i.title }}</span>
                                    </div>
                                    <div>
                                        <span style="color: #eee; font-weight: 300;" v-html="convertMessage(i.message)"></span>
                                    </div>
                                </div>
                            </div>
                        </v-card>
                    </Transition>
                </template>
            </v-layout>
        </v-main>
    </v-app>
</template>

<style>
.v-progress-circular__underlay {
    stroke: transparent !important;
}

.progress .v-progress-circular__overlay {
  transition: all 0.0s ease-in-out !important;
}

.slide-enter-active {
  animation: slide-in 0.3s;
}
.slide-leave-active {
  animation: slide-in 0.3s reverse;
}

@keyframes slide-in {
  0% {
    transform: translateX(400px);
  }
  100% {
    transform: translateX(0px);
  }
}
</style>

<script setup>
import { onMounted, ref } from 'vue'

const _data = ref({
    Align: '',
    Background: '',
    Types: []
})

const activeNotifications = ref([]);

const positions = {
    ['top']: 'justify-start',
    ['bottom']: 'justify-end',
    ['center']: 'justify-center'
}

const createNotification = (data) => {
    activeNotifications.value.push({
        title: data.title,
        type: data.type,
        message: data.message,
        duration: data.duration,
    });

    if (activeNotifications.value.length > 1) {
        return
    }

    const intervalId = setInterval(() => {
        if (activeNotifications.value.length === 0) {
            clearInterval(intervalId);
            return;
        }

        activeNotifications.value.forEach((element) => {
            if (element.show == null) {
                element.show = true;
                element.divide = element.duration
            }

            if (element.duration <= 0) {
                element.show = false;
            } else {
                element.progress = 100 - (element.duration / element.divide) * 100;
                element.duration = element.duration - 10; 
            }
        });
    }, 10);
}

const convertMessage = (text) => {
    text = text.replace(/~r~/g, "<span style='color:#ef5350';>");
    text = text.replace(/~g~/g, "<span style='color:#4caf50';>");
    text = text.replace(/~lg~/g, "<span style='color:#81c784';>");
    text = text.replace(/~lr~/g, "<span style='color:#e57373';>");
    text = text.replace(/~p~/g, "<span style='color:#7e57c2';>");
    text = text.replace(/~lp~/g, "<span style='color:#9575cd';>");
    text = text.replace(/~o~/g, "<span style='color:#ff9800';>");
    text = text.replace(/~lo~/g, "<span style='color:#ffb74d';>");
    text = text.replace(/~y~/g, "<span style='color:#FFDD32';>");
    text = text.replace(/~s~/g, "</span>");
    text = text.replace(/~w~/g, "</span>");
    text = text.replace(/~b~/g, "<b>");
    text = text.replace(/~n~/g, "<br>");
    text = "<span style='color:#eee';>" + text + "</span>";

    return text
}

onMounted(() => {
    window.addEventListener("message", (event) => {
        const { message, data } = event.data;

        if (message == 'setData') {
            _data.value = data;
        }

        if (message == 'createNotification') {
            createNotification(data);
        }
    });
})
</script>