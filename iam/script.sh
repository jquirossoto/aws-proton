while getopts p: flag
do
    case "${flag}" in
        p) profile=${OPTARG};;
    esac
done

if [ -z "$profile" ]
then
      profile=default
fi

aws iam create-role --profile $profile --role-name ProtonServiceRole --assume-role-policy-document file://./assume-policy.json
aws iam attach-role-policy --profile $profile --role-name ProtonServiceRole --policy-arn arn:aws:iam::aws:policy/AdministratorAccess