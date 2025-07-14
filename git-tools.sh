git-clean-checkout () {
    local dstBranch=$1

    echo " Checkouting '${dstBranch}' ..."

    # Update working directory to clean version of dstBranch
    echo " git clean -fd; git fetch origin; git fetch origin ${dstBranch}; git checkout ${dstBranch}; git reset --hard FETCH_HEAD; git reset --hard origin/${dstBranch}; git clean -fd"
    git clean -fd
    git fetch origin
    git fetch origin ${dstBranch}
    git checkout ${dstBranch}
    git reset --hard FETCH_HEAD
    git reset --hard origin/${dstBranch}
    git clean -fd
    echo ""
}
git-rebase () {
    local srcBranch=$1
    local dstBranch=$2

    echo " Rebasing '${srcBranch}' onto '${dstBranch}' ..."

    # Update working directory to clean version of srcBranch
    echo " git-clean-checkout ${srcBranch}"
    git-clean-checkout ${srcBranch}

    # Update working directory to clean version of dstBranch
    echo " git-clean-checkout ${dstBranch}"
    git-clean-checkout ${dstBranch}

    echo " git checkout ${dstBranch}; git pull origin ${dstBranch}"
    git checkout ${dstBranch}
    git pull origin ${dstBranch}

    echo " git checkout ${srcBranch}; git pull origin ${srcBranch}"
    git checkout ${srcBranch}
    git pull origin ${srcBranch}

    echo " Being at branch: ${srcBranch}"
    echo " git rebase -r ${dstBranch}"
    git rebase -r ${dstBranch}

    echo " Please use command: 'git status' to check merge status"
    echo " Please use command: 'git rebase --continue' to finish merge process"
    echo ""
}