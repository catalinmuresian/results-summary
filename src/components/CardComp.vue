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
    padding: 0 10px;
    .category {
      img {
        width: 17px;
      }
      h2 {
        font-size: 15px;
      }
    }
    .score {
      .value {
        font-size: 15px;
      }
    }
  }

  }

.reaction-comp {
  background-color: #FDF2ED;
}
.memory-comp {
  background-color: #FFF9EE;
}
.verbal-comp {
  background-color: #F0F9F9;
}
.visual-comp {
  background-color: #F0EFFC;
}



</style>
