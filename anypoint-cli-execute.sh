if [ $# -eq 0 ]
    then
        echo "No arguments supplied, please use $0 <commandFile>"
        echo "For instance $0 deploy_client_enforcement.txt"
    else
        if [ -e $ANYPOINT_USERNAME ] && [ -e $ANYPOINT_PASSWORD ] && [ -e $ANYPOINT_ENV ] && [ -e $ANYPOINT_PROFILE ] 
        then
            echo "Please define ANYPOINT_USERNAME, ANYPOINT_PASSWORD and ANYPOINT_ENV OR ANYPOINT_PROFILE"
        else
            if [ -n $ANYPOINT_PROFILE ]
                then
                    echo "Connecting using profile"
                    for currentParam in "$@"
                    do
                        anypoint-cli --profile $ANYPOINT_PROFILE < $currentParam
                    done
                else
                    for currentParam in "$@"
                    do
                        anypoint-cli < $currentParam
                    done
            fi
        fi
fi