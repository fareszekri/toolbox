#!/bin/bash
for i in $(az group list --query [].name -o tsv) 
do 
    if [ -z $(az resource list -g $i --query [].name -o tsv) ] && [ -z  $(az group lock list -g $i --query [].name -o tsv) ] 
    then 
        az group delete -n $i -y --no-wait
    else 
        echo "$i is locked or not empty "
    fi
done

