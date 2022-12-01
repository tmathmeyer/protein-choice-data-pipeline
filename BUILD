
data (
  name = "chicken",
  srcs = [
    "chicken.csv",
  ],
)

upload (
  name = "models",
  deps = [
    "//protein/mixed_logit/cb_fish_breakout:model",
    "//protein/mixed_logit/cbf_a_env:model",
    "//protein/mixed_logit/cbf_am_env:model",
    "//protein/mixed_logit/cbf_amf_env:model",
    "//protein/mixed_logit/cbf_amf_env_informed:model",
    "//protein/mixed_logit/cbf_attributes:model",
    "//protein/mixed_logit/cbf_demographics:model",
  ],
  host = "nas.lan.tedm.io",
  user = "ted",
  path = "/media/MinyanPhD/website/models/",
  perm = "775",
  ownr = "minyan:users",
)