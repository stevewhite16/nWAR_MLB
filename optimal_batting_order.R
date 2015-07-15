# optimal_batting_order.R - finds the optimal bating order for a set of players
# Player = object with p_out, p_walk, p_strikeout, p_sacrifice, p_dp, p_single, p_dbl, p_trip, p_hr
# (often to simplify assume p_sacrifice and p_dp are both zero)

expected_runs <- function(team) {
  # team is a vector of 9 players
  if (nrows(team) != 9) {
      "The team does not have 9 players."
  }
  
  # this can be written as a big transition matrix with the possible states
  # for each base as the rows.. precompute all possible transitions, then simulate
}