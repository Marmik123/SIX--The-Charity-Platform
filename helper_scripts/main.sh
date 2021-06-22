#!/bin/bash
PS3="Select action : "

select action in keystore locales; do
  case $action in
    keystore)
      ./debug_keys.sh
      break
      ;;
    locales)
      ./generate_locales.sh
      break
      ;;
    esac
  done