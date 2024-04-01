import gleam/list
import gleam/int

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

pub fn commands(encoded_message: Int) -> List(Command) {
  let cmds = []
  |> append_if(has_bit(encoded_message, 0), Wink)
  |> append_if(has_bit(encoded_message, 1), DoubleBlink)
  |> append_if(has_bit(encoded_message, 2), CloseYourEyes)
  |> append_if(has_bit(encoded_message, 3), Jump)

  case has_bit(encoded_message, 4) {
    False -> cmds
    True -> list.reverse(cmds)
  }
}

fn append_if(lst: List(a), cond: Bool, val: a) -> List(a) {
  case cond {
    True -> list.append(lst, [val])
    False -> lst
  }
}

fn has_bit(n: Int, bit: Int) -> Bool {
  let x = int.bitwise_shift_left(1, bit)
  int.bitwise_and(n, x) == x
}
