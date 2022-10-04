#!/usr/bin/env bash

set -e

sh -c "$(curl -sSfL https://release.solana.com/v1.10.32/install)"

solana config set --url localhost

solana-keygen new

cargo install --git https://github.com/project-serum/anchor anchor-cli --locked
