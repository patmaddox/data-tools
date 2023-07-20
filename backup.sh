#!/bin/sh
rsync -a ./pending-local/ nas:/nas/pending/$(hostname -s)
