name=PG
conf=postgresql
settings=(INDEX STORAGE HOST PORT DB USER PASSWORD LOCK)
secrets=(PASSWORD)
plugins=(libOrthancPostgreSQLIndex libOrthancPostgreSQLStorage)
function genconf {
	if [[ ! $HOST ]]; then
		log "Missing HOST setting, not generating configuration file"
		return
	fi
	cat <<-EOF >"$1"
	{
		"PostgreSQL": {
			"EnableIndex": ${INDEX:-true},
			"EnableStorage": ${STORAGE:-false},
			"Host": "$HOST",
			"Port": ${PORT:-5432},
			"Database": "${DB:-postgres}",
			"Username": "${USER:-postgres}",
			"Password": "$PASSWORD",
			"Lock": ${LOCK:-false}
		}
	}
	EOF
}
