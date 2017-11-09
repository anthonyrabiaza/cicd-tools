if [ $# -eq 0 ]
    then
        echo "No arguments supplied, please use $0 <JSONcommandFile> <JSONenvironmentFile>"
        echo "For instance $0 cicd-deploy/deploy_proxy.postman_collection.json cicd-deploy/anypoint_pce.postman_environment.json"
        echo " or "
        echo "$0 cicd-deploy/tier_request_api.postman_collection.json cicd-deploy/cloudhub.postman_environment.json"
    else
        if [ $# -eq 2 ] 
        then
            newman run $1 -e $2
        fi
fi