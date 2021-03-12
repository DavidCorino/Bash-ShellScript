#!/bin/bash
mkdir pod
PODS=$(oc get pod -o name)
for pod in $PODS; do
  CONTAINERS=$(oc get $pod --template='{{range .spec.containers}}{{.name}}
{{end}}')
  for c in $CONTAINERS; do
    oc logs $pod --container=$c --timestamps > ${pod}_${c}.log 2>&1
    oc logs -p $pod --container=$c --timestamps > ${pod}_${c}_p.log 2>&1
  done
done
