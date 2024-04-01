import gleam/iterator.{type Iterator, Done, Next}

pub fn primes_up_to(upper_bound: Int) -> List(Int) {
  case upper_bound >= 2 {
    True -> sieve(iterator.range(2, upper_bound)) |> iterator.to_list
    False -> []
  }
}

fn sieve(numbers: Iterator(Int)) -> Iterator(Int) {
  case iterator.step(numbers) {
    Done -> iterator.empty()
    Next(first, rest) ->
      iterator.yield(
        first,
        fn() {
          sieve(iterator.filter(rest, fn (p) { p % first != 0 }))
        }
      )
  }
}
