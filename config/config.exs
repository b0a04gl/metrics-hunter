use Mix.Config

config :metrics_hunter, MyConnection,
  auth: [method: :token, token: "babIE6C5EEsKULqbDWpFvPyo-1f2NsK1lPXX7ZnlYZaUKBQGBueYg_esOnDbRcY-Lt1eX2rC2KRQvQcKeHzI5A=="],
  bucket: "_monitoring",
  org: "self",
  host: "http://localhost:8086",
  version: :v2
