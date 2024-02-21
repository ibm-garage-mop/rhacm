#!/bin/bash

PROJECT=rhacm-policies

for type in policies policysets placement placementbindings; do
  mkdir -p $type
  cd $type
  oc get $type -n $PROJECT -o yaml | yq '.items[] | split_doc | del(.status,.metadata.managedFields,.metadata.resourceVersion,.metadata.uid,.metadata.generation,.metadata.creationTimestamp)' | yq --no-doc -s '.metadata.name +".yaml"'
  cd ..
done


mkdir -p secrets
cd secrets
oc get secrets -n $PROJECT -o yaml | yq '.items[] | select(.type=="Opaque") | split_doc | del(.status,.metadata.managedFields,.metadata.resourceVersion,.metadata.uid,.metadata.generation,.metadata.creationTimestamp)' | yq --no-doc -s '.metadata.name +".yaml"'
cd ..
