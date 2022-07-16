import { Controller } from "@hotwired/stimulus"

const backgroundImage = "linear-gradient(135deg, #312e81 25%, transparent 25%), linear-gradient(225deg, #312e81 25%, transparent 25%), linear-gradient(45deg, #312e81 25%, transparent 25%), linear-gradient(315deg, #312e81 25%, #e0e7ff 25%)"
const backgroundPosition = "10px 0, 10px 0, 0 0, 0 0"
const backgroundSize = "20px 20px"
const backgroundRepeat = "repeat"

export default class extends Controller {
  static targets = ["name", "card"]
  static values = {
    initialColor: String,
    cardFlip: Number
  }

  connect() {
    this.updateEvent = new CustomEvent('gameUpdate', { bubbles: true });
    this.cardTarget.style.backgroundColor = "#e0e7ff"
    this.cardTarget.style.backgroundImage = backgroundImage
    this.cardTarget.style.backgroundPosition = backgroundPosition
    this.cardTarget.style.backgroundSize = backgroundSize
    this.cardTarget.style.backgroundRepeat = backgroundRepeat
  }

  flipCard() {
    this.cardTarget.classList.toggle("flipped")

    console.log(this.initialColorValue)

    if (this.cardTarget.classList.contains("flipped")) {
      this.cardFlipValue = 1
      this.cardTarget.style.background = this.initialColorValue
    } else {
      this.cardFlipValue = -1
      this.cardTarget.style.backgroundColor = "#e0e7ff"
      this.cardTarget.style.backgroundImage = backgroundImage
      this.cardTarget.style.backgroundPosition = backgroundPosition
      this.cardTarget.style.backgroundSize = backgroundSize
      this.cardTarget.style.backgroundRepeat = backgroundRepeat
    }

    this.nameTargets.forEach(t => t.classList.toggle("hidden"))

    this.updateEvent.data = { cardFlip: this.cardFlipValue, cardId: this.element.getAttribute("dom_class") }
    this.element.dispatchEvent(this.updateEvent)
  }
}
