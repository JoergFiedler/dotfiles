GIT_STATUS=''

git_deleted() {
  [[ $(echo "${GIT_STATUS}" | grep "deleted:") != "" ]] && echo "-"
}

git_modified() {
  [[ $(echo "${GIT_STATUS}" | grep "modified:") != "" ]] && echo "#"
}

git_added() {
  [[ $(echo "${GIT_STATUS}" | grep "new file:") != "" ]] && echo "+"
}

git_untracked() {
  [[ $(echo "${GIT_STATUS}" | grep "Untracked files:") != "" ]] && echo '!'
}

git_uncommitted() {
  [[ $(echo "${GIT_STATUS}" | grep "Changes to be committed:") != "" ]] && echo "?"
}

git_committed() {
  [[ $(echo "${GIT_STATUS}" | grep "branch is ahead of") != "" ]] && echo "yes"
}

git_clean() {
  [[ $(echo "${GIT_STATUS}" | grep "working directory clean") != "" ]] && echo "yes"
}

git_branchName() {
  local branch=`echo "${GIT_STATUS}" | sed -n "/#.On.branch.*$/p" | sed 's/#.On.branch.\([^\s]+\)*/\1/'`
  [[ $branch != "master" ]] || branch=''
  echo $branch
}

git_prompt() {
  GIT_STATUS=`git status ${PWD} 2> /dev/null`
  GIT_PROMPT=`git_uncommitted``git_untracked``git_modified``git_added``git_deleted`
  [[ "${GIT_PROMPT}" != "" ]] && GIT_COLOR=41
  [[ "${GIT_PROMPT}" == "" ]] && [[ $(git_clean) == "yes" ]] && GIT_COLOR=42 && GIT_PROMPT=' '
  [[ ${GIT_COLOR} == 42 ]] && [[ $(git_committed) == "yes" ]] && GIT_COLOR=43 && GIT_PROMPT=' '

  [[ $(git_branchName) != '' ]] && git_branch="$(git_branchName) "

  #echo "git prompt: $"${GIT_PROMPT}"
  #echo "git color: $GIT_COLOR"
  #echo "git clean: $(git_clean)"
  #echo "git committed: $(git_committed)"
  echo "$git_branch\[\e[0;37;$GIT_COLOR;1m\]"${GIT_PROMPT}"\[\e[0m\]"
}

