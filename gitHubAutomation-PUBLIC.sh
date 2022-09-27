

#Creating a github repo and connecting it to local repo
#Write creation code

remote=$(git remote -v)

#-z is used to check if the given var is null or not. Returns true if null
#NOTE : Always use "$var" double quotes if the var contains a value with spaces. Eg: A sentence.
if [ -z "$remote" ]
then
	echo "Remote Repo doesnt exist on Github"
	echo "Want to create a Remote repo? [y for yes, n for no]"
	read choice

#Spacing between $var and == important!!
	if [ $choice == "y" ]
	then
		echo "Enter Remote Repo Name(NO SPACES, only _ allowed)"
		read repoName
		#NOTE: WARNING Dont expose this script, coz TOKEN is very sensitive!!
		#Imp to give var between single quotes, use ' 3 times
		
#-------------------------REPLACE <TOKEN> with your github Token & <username> with your github username-------------------------
		curl -X POST -H "Authorization: token <TOKEN>" https://api.github.com/user/repos -d '{"name":"'$repoName'","private":false}'
		url="https://github.com/<username>/$repoName.git"

		if [ "$url" ]
		then
			git remote add origin "$url"
			echo "Origin added"
			echo "$remote"
		else
			echo "Url cant be Null"
		fi
	
	elif [ $choice == "n" ] 
	then
		echo "Remote repo wasnt created"

	else
		echo "Enter valid choice"
	fi

else
	echo "Remote repo already exists"
fi
