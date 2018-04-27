param($database, $file);

mysqldump --user=root --add-drop-database --complete-insert --extended-insert --tz-utc $database --result-file=$file;
