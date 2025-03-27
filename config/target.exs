import Config

# Use Ringlogger as the logger backend and remove :console.
# See https://hexdocs.pm/ring_logger/readme.html for more information on
# configuring ring_logger.

config :logger, backends: [RingLogger]

# Use shoehorn to start the main application. See the shoehorn
# library documentation for more control in ordering how OTP
# applications are started and handling failures.

config :shoehorn, init: [:nerves_runtime, :nerves_pack]

# Erlinit can be configured without a rootfs_overlay. See
# https://github.com/nerves-project/erlinit/ for more information on
# configuring erlinit.

# Advance the system clock on devices without real-time clocks.
config :nerves, :erlinit, update_clock: true

# Configure the device for SSH IEx prompt access and firmware updates
#
# * See https://hexdocs.pm/nerves_ssh/readme.html for general SSH configuration
# * See https://hexdocs.pm/ssh_subsystem_fwup/readme.html for firmware updates

# keys =
#   System.user_home!()
#   |> Path.join(".ssh/id_{rsa,ecdsa,ed25519}.pub")
#   |> Path.wildcard()

# if keys == [],
#   do:
#     Mix.raise("""
#     No SSH public keys found in ~/.ssh. An ssh authorized key is needed to
#     log into the Nerves device and update firmware on it using ssh.
#     See your project's config.exs for this error message.
#     """)

config :nerves_ssh,
  # authorized_keys: Enum.map(keys, &File.read!/1)
  authorized_keys:
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8eKrZNiMIaQ2SLpVHYXEY3fP/iDoHRYivj1s9Udb48gjlCyF7c3POL4Bq4ThDsz+We9GGtJbfEJfj3JDFWvSrMF19UMRiWq5Se56fo1jEE7AcWupO0Mb3huVSqUZTSlhM8jtkoACf8uLBOl4C6qz20NvW0Z7o49jaHhqch+ZpcHCOPmuTchY/kfNUwhueRpmZ1cYHMEvArof/EKRtZ6BdzUCFaYzYuv8xJP1qPwPLlQ098woXu2unS7mV8+dqxVUOGsC+Kr4O7iHMlLGoTgj+3fHpkTWKQckR6jKXsdyvI5XsEtRAq9BhlyNa6rtlu1zKRU1Yo4N2gLWJwDV0Og5N6M2cwX0be1ow0NKJTHEiEgPoNHmqY3pqjV59gW6or3LCYT6Ua6omCi6EXtX9Hc1sfOAK03Ws/mBeH3A1O+ZD48fMsi2oyg0x/X2ovsAmrxryk9A1jHUc2A9YwLZce65M3pyYZPNzz+STG5tluU/UEMiKBMRykibhpc0kvRm8wSU= junior@junior-Aspire-A515-57"

# Configure the network using vintage_net
#
# Update regulatory_domain to your 2-letter country code E.g., "US"
#
# See https://github.com/nerves-networking/vintage_net for more information
config :vintage_net,
  regulatory_domain: "US",
  config: [
    {"usb0", %{type: VintageNetDirect}},
    {"eth0",
     %{
       type: VintageNetEthernet,
       ipv4: %{method: :dhcp}
     }},
    {"wlan0",
     %{
       type: VintageNetWiFi,
       vintage_net_wifi: %{
         mode: :infrastructure,
         networks: [
           %{
             key_mgmt: :wpa_psk,
             ssid: "Junior 2.4Ghz",
             psk: "17082022"
           }
         ]
       },
       ipv4: %{method: :dhcp}
     }}
  ]

config :mdns_lite,
  # The `hosts` key specifies what hostnames mdns_lite advertises.  `:hostname`
  # advertises the device's hostname.local. For the official Nerves systems, this
  # is "nerves-<4 digit serial#>.local".  The `"nerves"` host causes mdns_lite
  # to advertise "nerves.local" for convenience. If more than one Nerves device
  # is on the network, it is recommended to delete "nerves" from the list
  # because otherwise any of the devices may respond to nerves.local leading to
  # unpredictable behavior.

  hosts: [:hostname, "nerves"],
  ttl: 120,

  # Advertise the following services over mDNS.
  services: [
    %{
      protocol: "ssh",
      transport: "tcp",
      port: 22
    },
    %{
      protocol: "sftp-ssh",
      transport: "tcp",
      port: 22
    },
    %{
      protocol: "epmd",
      transport: "tcp",
      port: 4369
    }
  ]

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.target()}.exs"
