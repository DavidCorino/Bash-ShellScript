#!/bin/bash

func backup_files() {

    [ -d "/backups/daily" ]
    then
        mkdir -p backups_daily_dir
    

    source_file_dir=$1
    destination_file_dir=$2
    name_file=basename $source_file_dir 

    tar -cJvf "$destination_file_dir"\/$(echo $(basename $(source_file_dir)))".$(date +"%Y-%m-%d_%H-%M-%S").tar.gz $destination_file_dir/

}

backup_files ${1} ${2}