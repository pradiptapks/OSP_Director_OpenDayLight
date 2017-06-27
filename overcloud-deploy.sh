#!/bin/bash

_SCRIPT="install"
_LOG=${_SCRIPT}-$(date +%F_%H-%M-%S).log

cd ~
source stackrc
mkdir -p ~/logs 2>/dev/null

stdbuf -i0 -o0 -e0 openstack overcloud deploy \
 --ntp-server clock.redhat.com \
 --templates /usr/share/openstack-tripleo-heat-templates/ \
 -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
 -e /home/stack/odl-config/network-enviroment.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/neutron-opendaylight.yaml |& tee -a ~/logs/${_LOG}
