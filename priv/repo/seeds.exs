alias DashElixirFlutter.Repo
alias DashElixirFlutter.ConsumeDistance
alias DashElixirFlutter.AuxValues.AuxValue

Repo.insert!(%AuxValue{
  key: "distanceHodometer",
  value: 0.0
})

Repo.insert!(%AuxValue{
  key: "consumedHodometer",
  value: 0.0
})

Repo.insert!(%AuxValue{
  key: "distanceTrip",
  value: 0.0
})

Repo.insert!(%AuxValue{
  key: "consumedTrip",
  value: 0.0
})

Repo.insert!(%AuxValue{
  key: "pulsesDistance",
  value: 0.0
})

Repo.insert!(%AuxValue{
  key: "pulsesConsume",
  value: 0.0
})

Repo.insert!(%AuxValue{
  key: "pulsesPerMeter",
  value: 0.19
})
