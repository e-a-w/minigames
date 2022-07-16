import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["question", "name", "card"]
  static values = {
    revealColor: String,
    initialColor: String,
    cardFlip: Number
  }

  connect() {
    this.updateEvent = new CustomEvent('gameUpdate', { bubbles: true });
  }

  flipCard() {
    this.cardTarget.classList.toggle("flipped")

    if (this.cardTarget.classList.contains("flipped")) {
      // card is flipped face-down
      this.cardTarget.style.backgroundColor = this.initialColorValue
      this.cardFlipValue = 1
    } else {
      // card is flipped face-up
      this.cardTarget.style.backgroundColor = this.revealColorValue
      this.cardFlipValue = -1
    }

    this.nameTargets.forEach(t => t.classList.toggle("hidden"))
    this.questionTarget.classList.toggle("hidden")

    this.updateEvent.data = { cardFlip: this.cardFlipValue, cardId: this.element.getAttribute("dom_class") }
    this.element.dispatchEvent(this.updateEvent)
  }
}
