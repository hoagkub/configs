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

# custom alias
alias tree='find . | sed -e "s/[^-][^\/]*\//  │/g" -e "s/│\([^ ]\)/└──\1/"'
alias dercules_ubuntu_playground='docker run --net host --shm-size=8g -v /var/run/docker.sock:/var/run/docker.sock -v "$(pwd):$(pwd)" -w "$(pwd)" --privileged --rm -it --name dercules-ubuntu-playground ubuntu:20.04 bash'
alias tmux-kill-others='tmux kill-session -a -t $(tmux display-message -p "#S")'
