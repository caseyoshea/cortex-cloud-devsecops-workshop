# cortex-cloud-devsecops-workshop
DevSecOps with Cortex Cloud


python3 -m venv env
source ./env/bin/activate 

pip3 install checkov
checkov --version
checkov --help
checkov --list

git clone https://github.com/caseyoshea/cortex-cloud-devsecops-workshop.git
cd cortex-cloud-devsecops-workshop/
git status

cd code/
checkov -d .

> Failed checks are returned containing the offending file and resource, the lines of code that triggered the policy, and a guide to fix the issue.


## Now try running checkov on an individual file with checkov -f <filename>.

checkov -f deployment_gce.tf
checkov -f vertex.tf

## Policies can be optionally enforced or skipped with the --check and --skip-check flags.
checkov -f deployment_gce.tf --check CKV_GCP_39,CKV_GCP_3
checkov -f deployment_gce.tf --skip-check CKV_GCP_39,CKV_GCP_3

## Frameworks can also be selected or omitted for a particular scan.
checkov -d . --framework secrets --enable-secret-scan-all-files
checkov -d . --skip-framework dockerfile

> Lastly, enforcement can be more granularly controlled by using the --soft-fail option. Applying --soft-fail results in the scan always returning a 0 exit code. Using --hard-fail-on overrides this option.

## Check the exit code when running checkov -d . with and without the --soft-fail option.
checkov -d . ; echo $?
checkov -d . --soft-fail ; echo $?
