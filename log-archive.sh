#!/bin/bash

diretorio=$1
diretorio_absoluto="$(pwd)/$1"

function arquivar(){
	if [[ -d "$diretorio" ]]; then
		tar -czf ~/Projects/Linux/log-archive-tool/stored-logs/logs_archive_$(date +%Y%m%d_%H%M%S).tar.gz "$diretorio" 
		echo 'Arquivo criado com sucesso'
	else
		echo 'Arquivo não existe'
	fi
}

function setup_cron(){
	cron_line="* * * * * $(pwd)/log-archive.sh \"$diretorio_absoluto\""
	(crontab -l 2>/dev/null; echo "$cron_line") | crontab -

}

arquivar
if crontab -l 2> /dev/null | grep -q "log-archive.sh \"$diretorio_absoluto\""; then
	echo "Cron para esse arquivo já existe"
else
	setup_cron
fi

