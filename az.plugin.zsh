export AZ_DIR=$HOME/.az
secret_list_path="$AZ_DIR/list.txt"

list-secrets(){
	if [[ -f $secret_list_path ]] then
		cat $secret_list_path
		return 0
	fi

	secrets=$(az keyvault secret list --vault-name $AZ_KEYVAULT_NAME | jq -r '.[] | .name')

	echo $secrets > $secret_list_path

	echo $secrets
}

get-secrets(){
	for var in "$@" 
	do
		echo "$var"
		echo $(az keyvault secret show --vault-name $AZ_KEYVAULT_NAME --name $var | jq -r '.value')
		echo ""
	done
}

fzf-secrets(){
	get-secrets $(list-secrets | fzf --multi)
}

rm-secrets(){
	rm $secret_list_path
}
