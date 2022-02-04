export AZ_DIR=$HOME/.az
secret_list_path="$AZ_DIR/list.txt"

list-secrets(){
	if [[ -f $secret_list_path ]] then
		cat $secret_list_path
		return 0
	fi

	mkdir -p $AZ_DIR

	secrets=$(az keyvault secret list --vault-name $AZ_KEYVAULT_NAME | jq -r '.[] | .name')

	echo $secrets > $secret_list_path

	echo $secrets
}

get-secrets(){
	for var in "$@" 
	do
		if [ $# -ne 1 ]; then echo "$var"; fi
		echo $(az keyvault secret show --vault-name $AZ_KEYVAULT_NAME --name $var | jq -r '.value')
		if [ $# -ne 1 ]; then echo ""; fi 
	done
}

fzf-secrets(){
	get-secrets $(list-secrets | fzf --multi)
}

rm-secrets(){
	rm $secret_list_path
}
