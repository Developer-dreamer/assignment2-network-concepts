#!/bin/bash

install_files() {
  # Files to install
  readonly SERVER="apiServer.sh"
  readonly LOGGER="apiServer.log"
  readonly SERVER_SERVICE="apiService.service"
  readonly DB="db.txt"
  readonly SOCAT="socat"

  if [[ ! -e "/usr/bin/$SERVER" ]]; then
    echo "Configuring apiServer.sh..."

    sudo mv "$SERVER" "/usr/bin/"
    sudo chmod +x "/usr/bin/$SERVER"
  fi
  if [[ ! -e "/etc/systemd/system/$SERVER_SERVICE" ]]; then
    echo "Configuring apiServer.service..."

    sudo mv "$SERVER_SERVICE" "/etc/systemd/system/"
  fi
  if [[ ! -e "$DB" ]]; then
    echo "Creating database..."

    sudo mv "$DB"
  fi

  #configuring logging
  if [[ ! -e "/var/log/$LOGGER" ]]; then
    echo "Enabling logging..."

    sudo touch "/var/log/$LOGGER"
  fi

  if ! dpkg -l | grep -q "$SOCAT"; then
    echo "Installing socat..."

    sudo apt install -y "$SOCAT"
  fi
}

# Call the install_files function
install_files
