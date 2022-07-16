import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "matched"]
  static values = {
    flippedCardCount: { type: Number, default: 0 },
    previouslyFlipped: { type: Number, default: 0 },
    matchedSets: { type: Number, default: 0 },
    totalSets: Number,
  }

  connect() {
    this.matchedTarget.textContent = this.matchedSetsValue
  }

  receiveUpdate(event) {
    const { cardFlip, cardId } = event.data
    this.previouslyFlippedValue = this.flippedCardCountValue
    this.flippedCardCountValue += cardFlip

    const flippedCards = this.cardTargets.filter(c => c.classList.contains("flipped") && !c.classList.contains("matched"))
    const flippedIds = flippedCards.map(c => c.getAttribute("dom_class"))

    if (this.flippedCardCountValue >= 2) {
      this.cardTargets
        .filter(c => !c.classList.contains("flipped"))
        .forEach(c => c.style.pointerEvents = "none")
    } else if (this.previouslyFlippedValue === 2) {
      this.cardTargets
        .filter(c => !c.classList.contains("matched"))
        .forEach(c => c.style.pointerEvents = "auto")
    }

    if (flippedIds.length === 2 && flippedIds[0] === flippedIds[1]) {
      this.matchedSetsValue++
      this.matchedTarget.textContent = this.matchedSetsValue

      flippedCards
        .filter(c => c.classList.contains("flipped") && !c.classList.contains("matched"))
        .forEach(c => {
          c.classList.add("matched")
          c.style.pointerEvents = "none"
        })

      this.cardTargets
        .filter(c => !c.classList.contains("matched"))
        .forEach(c => c.style.pointerEvents = "auto")
      
      this.previouslyFlippedValue = 0
      this.flippedCardCountValue = 0
    }

    if (this.matchedSetsValue === this.totalSetsValue) {
      alert("Congrats, you won the game!")
    }
  }

  resetGame() {
    this.matchedSetsValue = 0
    this.matchedTarget.textContent = 0
    this.previouslyFlippedValue = 0
    this.flippedCardCountValue = 0

    this.cardTargets.forEach(c => c.classList.remove("flipped", "matched"))
  }
}
