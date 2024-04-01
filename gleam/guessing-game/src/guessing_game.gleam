pub fn reply(guess: Int) -> String {
  case guess - 42 {
    0 -> "Correct"
    d if d < -1 -> "Too low"
    d if d > 1 -> "Too high"
    _ -> "So close"
  }
}
