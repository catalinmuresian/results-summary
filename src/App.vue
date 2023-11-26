<template>
  <div class="attribution">
    Challenge by <a href="https://www.frontendmentor.io?ref=challenge" target="_blank">Frontend Mentor</a>.
    Coded by <a href="https://github.com/catalinmuresian">Catalin Muresian</a>.
  </div>
  <router-view/>
</template>

<style lang="scss">
body {
  margin: 0;
  padding: 0;
}
#app {
  font-family: 'Hanken Grotesk', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
.attribution {
  position: absolute;
  bottom: 0px;
  left: 0;
  right: 0;
  font-size: 11px;
  text-align: center;
  color: grey;
}
.attribution a {
  text-decoration: none;
  color: hsl(228, 45%, 44%);
}
</style>
