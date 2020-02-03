#! /bin/bash
source_dir=$1
backup_dir=$2

if [ -d $source_dir ]
then
    all_files=($(find $source_dir -mtime -1))
    
	#if backup_dir not exist, we create that
	if [ ! -d $backup_dir ]
    then
		mkdir $backup_dir
    fi

	if [ ! -d $backup_dir ]
    then
		echo Wrong name of backup dir, or has not permision
		exit 1;
    fi
    
	date=`date +%Y%m%d`
    work_dir=$backup_dir/$date
	
	if [ ! -d $work_dir ];
	then
		mkdir $work_dir
	fi
    
	for file in ${all_files[@]};
	do
		if [ -f $file ]
		then
			path=`dirname ${file[@]//$source_dir/}`
			if [ ! -f $work_dir/$path ]
			then
				mkdir -p $work_dir/$path
			fi
			cp $file $work_dir/$path
		fi
    done
else
    echo Source dir not exists!
fi