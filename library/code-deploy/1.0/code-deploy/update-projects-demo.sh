#!/usr/bin/env bash
pushd /data/code-deploy/projects-demo && git pull && popd
rsync -ap /data/code-deploy/projects-demo/* /data/projects-demo

