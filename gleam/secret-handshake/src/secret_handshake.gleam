import gleam/list.{append, reverse}
import gleam/int.{bitwise_and as and}

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

pub fn commands(encoded_message: Int) -> List(Command) {
  let if_val = fn(lst, bit, f) {
    case and(encoded_message, bit) != 0 {
      True -> f(lst)
      False -> lst
    }
  }

  []
  |> if_val(1, append(_, [Wink]))
  |> if_val(2, append(_, [DoubleBlink]))
  |> if_val(4, append(_, [CloseYourEyes]))
  |> if_val(8, append(_, [Jump]))
  |> if_val(16, reverse)
}
