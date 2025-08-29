# Check the battery status.

Use case: i have laptop which is running

fedora server and running crc for 

learning openshift.

I cannot check the battery of this laptop,

so I searched and found a command `upower`
upower -e will give you all objects being
monitored.

```shell

/org/freedesktop/UPower/devices/battery_BAT0
/org/freedesktop/UPower/devices/line_power_AC
/org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o001
/org/freedesktop/UPower/devices/line_power_ucsi_source_psy_USBC000o002
/org/freedesktop/UPower/devices/battery_hidpp_battery_0
/org/freedesktop/UPower/devices/DisplayDevice
```

You can check info on all these object using
the following command

```shell
upower --show-info /org/freedesktop/UPower/devices/battery_BAT0

  native-path:          BAT0
  vendor:               SMP
  model:                DELL TN2GY19
  serial:               4567
  power supply:         yes
  updated:              Fri 29 Aug 2025 10:10:17 AM CEST (2 seconds ago)
  has history:          yes
  has statistics:       yes
  battery
    present:             yes
    rechargeable:        yes
    state:               charging
    warning-level:       none
    energy:              40.9336 Wh
    energy-empty:        0 Wh
    energy-full:         41.4352 Wh
    energy-full-design:  61.8792 Wh
    energy-rate:         4.0888 W
    voltage:             16.55 V
    charge-cycles:       N/A
    time to full:        7.3 minutes
    percentage:          99% # how much is charged
    capacity:            66.9614%  # Battery status
    technology:          lithium-polymer
    charge-start-threshold:        75%
    charge-end-threshold:          80%
    charge-threshold-supported:    yes
    icon-name:          'battery-full-charging-symbolic'
  History (charge):
    1756454927	99.000	charging
  History (rate):
    1756455017	4.089	charging
    1756454987	4.165	charging
    1756454957	4.226	charging
    1756454927	4.302	charging
```
