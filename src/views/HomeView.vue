<template>
  <div class="card">
    <div class="result">
      <h1>Your Result</h1>
      <div class="circle">
        <h2>{{ resultNumber }}</h2>
        <h4>of 100</h4>
      </div>
      <div class="info">
        <h2>Great</h2>
        <h6>You scored higher than 65% of the people who have taken these tests.</h6>
      </div>
    </div>
    <div class="summary">
      <h1>Summary</h1>
      <div class="list">
        <CardComp
            v-for="{category, score, icon} in list"
            :category="category"
            :icon="icon"
            :score="score"
        />
      </div>
      <button
          :class="isComplete && 'complete'"
          :style="isFetching && 'cursor: default;'"
          @click="handleResult()">{{ buttonText }}</button>
    </div>
  </div>
</template>

<script setup>
import {ref} from "vue";
import CardComp from "@/components/CardComp";

const resultNumber = ref(76)
const isFetching = ref(false)

const list = ref([
      {
        "category": "Reaction",
        "score": 80,
        "icon": "icon-reaction.svg"
      },
      {
        "category": "Memory",
        "score": 92,
        "icon": "icon-memory.svg"
      },
      {
        "category": "Verbal",
        "score": 61,
        "icon": "icon-verbal.svg"
      },
      {
        "category": "Visual",
        "score": 72,
        "icon": "icon-visual.svg"
      }
    ])

const isComplete = ref(false)

const buttonText = ref('Continue')

function generateRandomNumber(min, max) {
  return Math.floor(Math.random() * (max - min + 1) + min);
}

function handleResult () {
  if (!isFetching.value) {
    isFetching.value = true
    buttonText.value = '... is loading'
    list.value.forEach(obj => {
      obj.score = 0
    })
    resultNumber.value = 0
    setTimeout(() => {
      buttonText.value = 'Complete !'
      let sum = []
      list.value.forEach(obj => {
        obj.score = generateRandomNumber(50, 95);
        sum.push(obj.score)
        resultNumber.value = (sum.reduce((partialSum, a) => partialSum + a, 0) / 4).toFixed(0) * 1;
      })
      isComplete.value = true
      setTimeout(() => {
        buttonText.value = 'Continue'
        isComplete.value = false
        isFetching.value = false
      }, 3000)
    }, 1500)
  }
}
</script>

<style lang="scss">
.card {
  max-width: 400px;
  width: 100%;
  margin: 0 auto;
  .result {
    color: white;
    background: linear-gradient(#6743FF, #312DE8);
    border-radius: 0 0 30px 30px;
    display: flex;
    flex-direction: column;
    gap: 20px;
    h1 {
      font-size: 18px;
      color: #c9c1ef;
      margin: 20px 0 0;
    }
    .circle {
      display: flex;
      flex-direction: column;
      background: linear-gradient(#5321d6, #4735F0);
      border-radius: 50%;
      width: 130px;
      height: 130px;
      margin: 0 auto;
      justify-content: center;
      h2 {
        font-size: 52px;
        margin: 0;
      }
      h4 {
        margin: 0;
        color: #867BFF;

      }
    }
    .info {
      h2 {
        font-size: 25px;
        margin: 0;
      }
      h6 {
        width: 280px;
        color: #bbaef8;

        font-size: 16px;
        margin: 10px auto 40px;

      }
    }
  }
  .summary {
    padding: 0 30px;
    h1 {
      font-size: 20px;
      margin: 20px 0;
      text-align: left;
      color: hsl(224, 30%, 27%);

    }
    .list {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }
    .complete {
      background: green!important;
    }
    button {
      cursor: pointer;
      margin-top: 25px;
      border-radius: 30px;
      padding: 18px;
      outline: none;
      background-color: hsl(224, 30%, 27%);
      color: white;
      font-weight: 700;
      width: 100%;
      border: none;
      font-size: 18px;
      margin-bottom: 40px;
    }
    button:hover {
      background: linear-gradient(#6743FF, #312DE8);;
      transition: background 100ms ease-in-out;
    }
  }
  @media only screen and (min-width: 700px) {
    display: flex;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    max-width: 750px;
    height: 520px;
    box-shadow: 20px 20px 20px 5px rgba(5, 0, 255, 0.05);
    border-radius: 30px;
    .result {
      width: 55%;
      gap: 35px;
      h1 {
        font-size: 24px;
        margin-top: 35px;
      }
      .circle {
        width: 200px;
        height: 200px;
        h2 {
          font-size: 70px;
        }
        h4 {
          font-size: 18px;
        }
      }
      .info {
        h2 {
          font-size: 32px;
        }
        h6 {
          width: 265px;
          font-size: 18px;
          margin-top: 20px;
        }
      }
    }
    .summary {
      width: 45%;
      padding: 0 40px;
      h1 {
        font-size: 22px;
        margin: 45px 0 30px;
      }
      .list {
        gap: 20px;
      }
    }
    .result {
      border-radius: 30px;
    }
    .summary button {
      margin-top: 40px;
      padding: 18px;
      font-size: 15px;
    }
  }
}
</style>
