#!/bin/bash

sudo puppet apply --modulepath modules -e 'class{'git':}'
sudo puppet apply --modulepath modules -e 'class{'mysql':}'
sudo puppet apply --modulepath modules -e 'class{'extract':}'
