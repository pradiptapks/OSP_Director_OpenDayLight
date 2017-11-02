#!/bin/bash
time openstack overcloud deploy \
 --templates /usr/share/openstack-tripleo-heat-templates/ \
 -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
 -e /home/stack/templates/network-environment.yaml \
 -e /home/stack/templates/neutron-opendaylight-l3.yaml \
 --control-flavor control --control-scale 1 \
 --compute-flavor compute --compute-scale 1 \
 --libvirt-type qemu --ntp-server clock.redhat.com \
 --timeout 90 \
 --log-file overcloudDeploy_$(date +%m_%d_%y__%H_%M_%S).log > deploy_all.log 2>&1

