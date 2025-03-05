#!/bin/bash

# Start Redis in background
redis-server &> /var/log/redis.log & disown

# Set up SSH
mkdir -p /root/.ssh
cp -r /root/ssh/* /root/.ssh/
chmod 700 /root/.ssh
chmod 600 /root/.ssh/*

# Start SSH agent and add key
eval $(ssh-agent)
KEY=${KEY:-id_ed25519}
if [ -f "/root/.ssh/$KEY" ]; then
  ssh-add /root/.ssh/$KEY
  echo "Added SSH key: $KEY"
else
  echo "Warning: SSH key $KEY not found"
  ls -la /root/.ssh/
fi

# Start interactive shell
exec bash