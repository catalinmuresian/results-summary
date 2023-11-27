<template>
  <div class="card-comp" :class="`${category.toLowerCase()}-comp`">
    <div class="category">
      <img :src="icon" :alt="icon">
      <h2 :class="`${category.toLowerCase()}-title`">{{ category }}</h2>
    </div>
    <div class="score">
      <span class="value">{{ score }}</span>
      <span>/</span>
      <span>100</span>

    </div>



  </div>
</template>

<script setup>

const props = defineProps({
  category: String,
  score: Number,
  icon: String,
})
</script>

<style lang="scss">
.card-comp {
  border-radius: 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 6px 15px;
  .category {
    display: flex;
    flex-direction: row;
    gap: 13px;
    img {
      width: 100%;
    }
    h2 {
      font-size: 16px;
      font-weight: 700;
    }
    .reaction-title {
      color: hsl(0, 100%, 67%);
    }
    .memory-title {
      color: hsl(39, 100%, 56%);
    }
    .verbal-title {
      color: hsl(166, 100%, 37%);
    }
    .visual-title {
      color: hsl(234, 85%, 45%);
    }
  }
  .score {
    display: flex;
    gap: 7px;
    .value {
      font-weight: 800;
      color: hsl(224, 30%, 27%);
    }
    span {
      color: #939393;
      font-weight: 800;
    }
  }
  @media only screen and (min-width: 700px) {
    padding: 1px 15px;
    .category {
      h2 {
        font-size: 18px;
        font-weight: 700;
      }
    }
    .score {
      .value {
        font-size: 18px;
      }
      span {
        font-size: 18px;
      }
    }
  }

  }

.reaction-comp {
  background-color: hsl(6, 100%, 98%);
}
.memory-comp {
  background-color: hsl(42, 100%, 97%);
}
.verbal-comp {
  background-color: hsl(180, 44%, 96%);
}
.visual-comp {
  background-color: hsl(240, 71%, 97%);
}



</style>
