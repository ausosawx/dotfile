#!/bin/bash

tlmgr install $(cat custom-pkgs.txt | tr '\n' ' ')
