param($database, $file);

mysql --user=root $database --execute="source $file";
