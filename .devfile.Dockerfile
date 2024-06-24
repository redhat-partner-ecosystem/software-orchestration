FROM registry.redhat.io/devspaces/udi-rhel8:3.14-6

# Switching to root user (setting UID to 0) because next
# commands require root privileges. Universal Developer
# Image default user has UID set to 10001.
USER 0

# add stuff

# Switch back to default user
USER 1000