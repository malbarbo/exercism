pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(min: Int) -> Int {
  expected_minutes_in_oven() - min
}

pub fn preparation_time_in_minutes(num_layers: Int) -> Int {
  num_layers * 2
}

pub fn total_time_in_minutes(num_layers: Int, num_minutes_oven: Int) -> Int {
  preparation_time_in_minutes(num_layers) + num_minutes_oven
}

pub fn alarm() -> String {
  "Ding!"
}
