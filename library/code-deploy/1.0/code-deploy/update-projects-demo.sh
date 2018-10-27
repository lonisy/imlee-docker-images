#!/usr/bin/env bash
pushd /data/code-deploy/projects-demo && git pull && popd
rsync -ap --delete --timeout=30 /data/code-deploy/projects-demo/* /data/projects-demo