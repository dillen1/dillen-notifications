import '@mdi/font/css/materialdesignicons.css'
import './assets/global.css';

import { createApp } from "vue";
import { createVuetify } from "vuetify";
import 'vuetify/styles'

import App from "./App.vue";

import * as components from "vuetify/components";
import * as directives from "vuetify/directives";
import * as labsComponents from 'vuetify/labs/components'

const vuetify = createVuetify({
  components: {
    ...components,
    ...labsComponents,
  },
  theme: {
    defaultTheme: "dark",
  },
  directives,
})

const app = createApp(App);

app.use(vuetify);

app.mount("#app");
