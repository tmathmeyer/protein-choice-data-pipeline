
data (
  name = "chicken",
  srcs = [
    "chicken.csv",
  ],
)

r_process_data(
  name = "chicken_mixed_logit_with_demographics",
  srcs = [
    "chicken_mixed_logit_with_demographics.R",
  ],
  deps = [
    "//protein/env:rchoice_env",
  ],
  data = [
    "chicken.csv",
  ],
)
