alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
alias dot='cd ~/dotfiles'
alias findInFiles='grep -Rins'
alias mkdir='mkdir -p'
alias ports='lsof -i -n -P | grep TCP'
alias refresh='source ~/.zshrc'
alias rm='rm -i -f'
alias wor='cd ~/workspace'
alias google='googler -n 7 -c ru -l ru'

# Git
alias add='git add'
alias addAll='add -A'
alias commit='git commit'
alias ammend='commit --ammend'
alias checkout='git checkout'
alias rebase='git rebase'
alias master='checkout master'
alias merge='git merge'
alias clone='git clone'
alias pull='git pull --prune --tags --rebase'
alias push='npm test && git push --no-verify'
alias pushBranch='push origin HEAD'
alias status='git status'
alias git-status='git status -sb'
alias stash='git stash'
alias wip='commit -am "WIP"'
alias git-wipe='git branch --merged >/tmp/merged-branches && vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches'

# Node
alias n='npm'
alias nc='rm -rf node_modules && ni'
alias ni='npm install'
alias nr='npm run'
alias nt='npm test'
alias npm-clear='nc'
alias npm-install='ni'
alias npm-run='nr'
alias npm-test='nt'
alias y='yarn'
alias ya='yarn add'
alias yt='yarn test'
alias yd='yarn dev'
alias yc='rm -rf node_modules && y'
alias yarn-add='ya'
alias yarn-test='yt'
alias yarn-clear='yc'
alias yarn-crisis='rm -rf node_modules && rm yarn.lock && y'

# Ruby
alias bexec='bundle exec'
alias binstall='bundle install'
alias bupdate='bundle update'
alias railss='bundle exec rails s'
alias rmigrate='bundle exec rake db:migrate'
alias rscaffold='bundle exec rails generate scaffold'

# Go

alias got="go get"
alias got-all="go get ./..."

# Personal Scripts
alias remove-duplicates='python3 ~/dotfiles/scripts/remove-duplicates.py'
alias git-profile='python3 ~/dotfiles/scripts/git-profile.py'
alias branch='python3 ~/dotfiles/scripts/git-branch.py'

alias test-factory='bash <(curl -s https://raw.githubusercontent.com/arctouch/web-tests-factory/main/testsFactory.sh)'
