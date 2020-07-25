#!/bin/bash

kubectl api-versions
    # check api versions
kubectl api-resources
    # check api resources

kubectl explain pod
kubectl explain pod.spec
kubectl explain pod.spec.containers
kubectl explain pod.spec.containers.name
kubectl explain pod.spec.containers.image
kubectl explain pod.spec --recursive
    # 'explain' option 사용방법

kubectl explain hpa.spec
kubectl explain hpa.spec --api-version=autoscaling/v2beta1
    # 'explain api-version'이 다를경우 사용 방법