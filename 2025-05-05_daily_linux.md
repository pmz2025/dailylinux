# 05-05-2025

## Daily Linux Curl

curl -OLv http://

-L - remote location (can redirect to new location)
-O - location where to store the output if not directory is given, it is stored in current directory
-v - verbose

Lets use this in practice. We need to find the latest (stable) version of kubectl and use this information to find sha256 sum

set LATESTKUBECTL $(curl -sL https://dl.k8s.io/release/stable.txt)



### Download exec and check sum using --check

```bash

curl -LO https://dl.k8s.io/release/$LATESTKUBECTL/bin/linux/amd64/kubectl.sha256

curl -LO https://dl.k8s.io/release/$LATESTKUBECTL/bin/linux/amd64/kubectl

echo $(cat kubectl.sha256) kubectl | sha256sum --check

# Inside you are wondering why i have not given path to kubectl executable, because
# sha256sum --check checks for file inside the current folder

```

Lesson learnt, use `--check` option

### Repo variables

YUM/DNF has some pre-defined variables which are seen been used in .repo files

$arch
$basearch
$releasever


# In this '' s means search, and search for .0 and replace with nothing or delete and the $ matches any character present at the end of the string.

```bash
set REPOKUBEVER $(echo $LATESTKUBECTL | sed 's/.0$//')
set kubepkgs "https://pkgs.k8s.io/core:/stable:"


echo "\
[kubernetes]
name=kubernetes repo
baseurl=$kubepkgs//$REPOKUBEVER/rpm
enabled=1
gpgcheck=1
gpgkey=$kubepkgs//$REPOKUBEVER/rpm/repodata/repomd.xml.key" > kubernetes.repo

sudo cp -v kubernetes.repo /etc/yum.repos.d/kubernetes.repo
sudo dnf check-upgrade
sudo dnf install kubectl
```

### References:

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management
https://www.geeksforgeeks.org/remove-last-character-from-string-in-linux/
https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/6/html/deployment_guide/sec-using_yum_variables#sec-Using_Yum_Variables