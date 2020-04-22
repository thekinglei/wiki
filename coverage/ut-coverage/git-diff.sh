
#通过git diff 得到变更、新增代码的行号
diff-lines() {
    local path=
    local line=
    while read; do
        esc=$'\033'
        if [[ $REPLY =~ ---\ (a/)?.* ]]; then
            continue
        elif [[ $REPLY =~ \+\+\+\ (b/)?([^[:blank:]$esc]+).* ]]; then
            path=${BASH_REMATCH[2]}
        elif [[ $REPLY =~ @@\ -[0-9]+(,[0-9]+)?\ \+([0-9]+)(,[0-9]+)?\ @@.* ]]; then
            line=${BASH_REMATCH[2]}
        elif [[ $REPLY =~ ^($esc\[[0-9;]+m)*([\ +-]) ]]; then
            echo "$path:$line:$REPLY"
            if [[ ${BASH_REMATCH[2]} != - ]]; then
                ((line++))
            fi
        fi
    done
}

###
#执行
#git diff ${ommit_Id1}...${Commit_Id2} |diff-lines
#示例 git diff  02342340er...HEAD |diff-lines
#如果只想显示添加/删除/修改的行，而不显示周围的上下文，则可以传递-U0
#git diff  02342340er...HEAD -U0 |diff-lines


