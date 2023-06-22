# 

# Source: https://live.paloaltonetworks.com/t5/globalprotect-discussions/globalprotect-blocks-the-network-traffic-of-wsl2/m-p/507821/highlight/true#M2955

$WSLInterface = C:\Windows\System32\wsl.exe --exec /bin/bash --noprofile --norc -c "/bin/ip -o -4 addr list eth0"
$WSLAddress = $WSLInterface.split()[6].split('/')[0]

$WSLRoute = C:\Windows\System32\wsl.exe -e /bin/bash --noprofile --norc -c "/sbin/ip -o route show table main default"
$WSLGateway = $WSLRoute.split()[2]

$InterfaceIndex = Get-NetRoute -DestinationPrefix $WSLGateway/32 | Select-Object -ExpandProperty "IfIndex"
$RouteMetric = Get-NetRoute -DestinationPrefix $WSLGateway/32 | Select-Object -ExpandProperty "RouteMetric"

route ADD $WSLAddress MASK 255.255.255.255 $WSLAddress METRIC $RouteMetric IF $InterfaceIndex