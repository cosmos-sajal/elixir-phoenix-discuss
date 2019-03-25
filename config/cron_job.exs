use Mix.Config

config :discuss, Discuss.Scheduler,
  global: true,
  # storage: Quantum.Storage.Adapter.Implementation,
  jobs: [
    # Every minute
    {"* * * * *", {Dicuss.Tasks.ExampleCron, :work, []}}
  ]
