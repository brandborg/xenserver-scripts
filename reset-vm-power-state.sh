#!/bin/bash

VMNAME="${1}"
VMUUID=$(xe vm-list name-label="${VMNAME}" | grep uuid | awk '{print $5}')

  verify_name() {
    if [ -z "${VMUUID}" ]; then
      echo "VMNAME: ${VMNAME} - not found!"
      echo "Maybe you are looking for: $(xe vm-list | grep "${VMNAME}" | awk '{ print $4 }')"
      exit 1
    fi
  }

  kill_vm_state(){
    xl destroy $(list_domains | grep ${VMUUID} | awk '{print $1}')
    xe vm-reset-powerstate vm="${VMNAME}" --force
  }

verify_name

kill_vm_state

echo "${VMNAME} powerstate reset"

exit 0
