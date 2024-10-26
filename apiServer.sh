#!/bin/bash

read_db(command_type, param) {
  readonly DB="db.txt"

  if [[ ! -e $DB]]; then
    echo "Error with database"
    exit -1
  fi 

  while IPF=, read movie, director, year; do 
    if [$param == $year || $param == $director]; then
      echo "movie"
    fi 
  do < $DB 
}
